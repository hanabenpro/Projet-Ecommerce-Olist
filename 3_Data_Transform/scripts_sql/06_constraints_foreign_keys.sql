ALTER TABLE fact_orders
ADD CONSTRAINT FK_fact_orders_customers
    FOREIGN KEY (customer_id)
    REFERENCES dim_customers(customer_id);

ALTER TABLE fact_orders
ADD CONSTRAINT FK_fact_orders_sellers
    FOREIGN KEY (seller_id)
    REFERENCES dim_sellers(seller_id);

ALTER TABLE fact_orders
ADD CONSTRAINT FK_fact_orders_products
    FOREIGN KEY (product_id)
    REFERENCES dim_products(product_id);

ALTER TABLE fact_orders
ADD CONSTRAINT FK_fact_orders_reviews
FOREIGN KEY (review_id)
REFERENCES dim_review(review_id);