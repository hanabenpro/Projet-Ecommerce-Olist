-- ETAPE D'INSERTION DES DONNEES DANS LA TABLE DIM_CUSTOMERS

INSERT INTO dbo.dim_customers (customer_id, customer_unique_id, customer_city, customer_state, customer_zip_code_prefix)
SELECT DISTINCT
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state,
    customer_zip_code_prefix
FROM
    stg.stg_customers_clean;

-- ETAPE D'INSERTION DES DONNEES DANS LA TABLE DIM_SELLERS

INSERT INTO dbo.dim_sellers (seller_id, seller_city, seller_state, seller_zip_code_prefix)
SELECT DISTINCT
    seller_id,
    seller_city,
    seller_state,
    seller_zip_code_prefix
FROM
    stg.stg_sellers_clean;

-- ETAPE D'INSERTION DES DONNEES DANS LA TABLE DIM_PRODUCTS

INSERT INTO dbo.dim_products (
    product_id,
    product_category_name,
    product_category_name_english,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm,
    product_volume_cm3
)
SELECT DISTINCT
    p.product_id,
    p.product_category_name,
    c.product_category_name_english,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm,
    p.product_volume_cm3
FROM stg.stg_products_clean p
LEFT JOIN stg.stg_category_clean c
    ON p.product_category_name = c.product_category_name;

-- ETAPE D'INSERTION DES DONNEES DANS LA TABLE DIM_REVIEW
INSERT INTO dbo.dim_review (
    review_id,
    order_id,
    review_score,
    result_concatenation_coms,
    review_creation_date,
    review_answer_timestamp
)
SELECT DISTINCT
    review_id,
    order_id,
    review_score,
    result_concatenation_coms,
    review_creation_date,
    review_answer_timestamp
FROM stg.stg_reviews_clean;



-- ETAPE D'INSERTION DES DONNEES DANS LA TABLE DIM_GEOLOCATION

INSERT INTO mart.dim_geolocation (
    zip_code_prefix,
    geolocation_lat,
    geolocation_lng,
    geolocation_city,
    geolocation_state
)
SELECT DISTINCT
    geolocation_zip_code_prefix AS zip_code_prefix,
    geolocation_lat,
    geolocation_lng,
    geolocation_city,
    geolocation_state
FROM stg.stg_geo_clean;

