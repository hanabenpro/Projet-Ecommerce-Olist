-- ETAPE D'INSERTION DES DONNEES DANS LA TABLE DES FAITS

-- CTE OBLIBATOIRES POUR AGRÉGER LES DONNÉES DE PAYMENTS ET REVIEWS : éviter les doublons dans la table des faits
--stg_payments_clean peut contenir PLUSIEURS paiements par order_id => tu dois agréger les paiements AVANT la jointure.
--stg_reviews_clean peut contenir PLUSIEURS reviews par order_id => tu dois agréger aussi.

WITH payments AS (
    SELECT
        order_id,
        SUM(payment_value) AS payment_value,
        MAX(payment_type) AS payment_type
    FROM stg.stg_payments_clean
    GROUP BY order_id
),
reviews AS (
    SELECT
        review_key,
        AVG(review_score) AS review_score
    FROM stg.stg_reviews_clean
    GROUP BY review_key
)

INSERT INTO mart.fact_orders (
    order_id, order_item_id, customer_id, seller_id, product_id,
    purchase_date, expedition_date, delivery_date, estimated_delivery_date,
    shipping_limit_date, price, freight_value, payment_value, payment_type, review_key,
    review_score, delivery_delay_days, delivery_time_days,total_delivery_days, expedition_delay_days, is_late_delivery, total_revenue
)
SELECT
    o.order_id,
    oi.order_item_id,
    o.customer_id,
    oi.seller_id,
    oi.product_id,

    o.order_purchase_timestamp AS purchase_date,
    o.order_delivered_carrier_date AS expedition_date,
    o.order_delivered_customer_date AS delivery_date,
    o.order_estimated_delivery_date AS estimated_delivery_date,

    oi.shipping_limit_date,
    oi.price,
    oi.freight_value,

    p.payment_value,
    p.payment_type,

    r.review_key,
    r.review_score,

    DATEDIFF(day, o.order_estimated_delivery_date, o.order_delivered_customer_date) AS delivery_delay_days,
    DATEDIFF(day, o.order_delivered_carrier_date, o.order_delivered_customer_date) AS delivery_time_days,
    DATEDIFF(day, o.order_purchase_timestamp, o.order_delivered_customer_date) AS total_delivery_days,
    DATEDIFF(day, o.order_delivered_carrier_date, oi.shipping_limit_date) AS expedition_delay_days,

    CASE 
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1
        ELSE 0
    END AS is_late_delivery,

    (oi.price + oi.freight_value) AS total_revenue
FROM
    stg.stg_orders_clean o
JOIN
    stg.stg_order_items_clean oi ON o.order_id = oi.order_id
LEFT JOIN
    reviews r ON o.review_key= r.review_key
LEFT JOIN 
    payments p ON o.order_id = p.order_id
LEFT JOIN mart.fact_orders f 
       ON f.order_id = o.order_id 
      AND f.order_item_id = oi.order_item_id
WHERE f.order_id IS NULL;

