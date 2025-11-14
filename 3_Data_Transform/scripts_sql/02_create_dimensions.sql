-- Creation des tables de la data marts

CREATE TABLE dim_customers (
  customer_id varchar(50) PRIMARY KEY not NULL,
  customer_unique_id varchar(50),
  customer_city varchar(50),
  customer_state varchar(50),
  customer_zip_code_prefix int
);

CREATE TABLE dim_sellers (
  seller_id varchar(50) PRIMARY KEY not NULL,
  seller_city varchar(50),
  seller_state varchar(50),
  seller_zip_code_prefix int
);

CREATE TABLE dim_products (
  product_id varchar(50) PRIMARY KEY not NULL,
  product_category_name varchar(100),
  product_category_name_english varchar(100),
  product_weight_g float,
  product_length_cm float,
  product_height_cm float,
  product_width_cm float,
  product_volume_cm3 float
);

CREATE TABLE dim_geolocation (
  zip_code_prefix int PRIMARY KEY not NULL,
  geolocation_lat float,
  geolocation_lng float,
  geolocation_city varchar(50),
  geolocation_state varchar(50)
);

CREATE TABLE dim_review (
  review_id varchar(50) PRIMARY KEY not NULL,
  order_id varchar(50),
  review_score int,
  result_concatenation_coms varchar(50),
  review_creation_date datetime,
  review_answer_timestamp datetime
);

-- Modification des types de données pour correspondre aux faits
'changement type payment'
ALTER TABLE stg_payments_clean
ALTER COLUMN payment_value float;  

ALTER TABLE stg_order_items_clean
ALTER COLUMN price float;  
ALTER TABLE stg_order_items_clean
ALTER COLUMN freight_value float;

ALTER TABLE stg_reviews_clean
ALTER COLUMN review_score int;

ALTER TABLE mart.dim_review 
ALTER COLUMN result_concatenation_coms NVARCHAR(MAX);

-- Supprimer la clé étrangère (FK) vers dim_review
ALTER TABLE mart.fact_orders
DROP CONSTRAINT FK_fact_orders_reviews;

--Supprimer la clé primaire existante de dim_review
SELECT 
    CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'dim_review'
  AND CONSTRAINT_TYPE = 'PRIMARY KEY';

ALTER TABLE mart.dim_review
DROP CONSTRAINT PK__dim_revi__60883D90D2D99B95;

--Ajouter la colonne surrogate key
ALTER TABLE mart.dim_review
ADD review_key INT IDENTITY(1,1);

--Créer la nouvelle clé primaire sur cette colonne
ALTER TABLE mart.dim_review
ADD CONSTRAINT PK_dim_review PRIMARY KEY (review_key);


