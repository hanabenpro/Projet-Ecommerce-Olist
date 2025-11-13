CREATE TABLE fact_orders (
    order_id              varchar(50) NOT NULL,
    order_item_id         int NOT NULL,
    customer_id           varchar(50),
    seller_id             varchar(50),
    product_id            varchar(50),
    purchase_date         datetime,
    expedition_date       datetime,
    delivery_date         datetime,
    estimated_delivery_date datetime,
    price                 float,
    freight_value         float,
    payment_value         float,
    payment_type          varchar(50),
    review_score          int,
    delivery_delay_days   int,
    delivery_time_days    int,
    is_late_delivery      bit,
    total_revenue         float,
    CONSTRAINT PK_fact_orders PRIMARY KEY (order_id, order_item_id)
);

--Ajout colonnes 
ALTER TABLE fact_orders
ADD shipping_limit_date datetime;

ALTER TABLE fact_orders 
ADD review_id varchar(50) NULL;