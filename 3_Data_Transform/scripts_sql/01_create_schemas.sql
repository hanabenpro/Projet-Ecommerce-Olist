-- Création des schémas mart et stg
CREATE SCHEMA mart;

CREATE SCHEMA stg;

-- Transfert des tables de staging vers le schéma stg
ALTER SCHEMA stg TRANSFER dbo.stg_category_clean;
ALTER SCHEMA stg TRANSFER dbo.stg_customers_clean;
ALTER SCHEMA stg TRANSFER dbo.stg_geo_clean;
ALTER SCHEMA stg TRANSFER dbo.stg_orders_clean;
ALTER SCHEMA stg TRANSFER dbo.stg_order_items_clean;
ALTER SCHEMA stg TRANSFER dbo.stg_payments_clean;
ALTER SCHEMA stg TRANSFER dbo.stg_products_clean;
ALTER SCHEMA stg TRANSFER dbo.stg_reviews_clean;
ALTER SCHEMA stg TRANSFER dbo.stg_sellers_clean;

-- Transfert des tables de mart vers le schéma mart
ALTER SCHEMA mart TRANSFER dbo.dim_customers;
ALTER SCHEMA mart TRANSFER dbo.dim_sellers;
ALTER SCHEMA mart TRANSFER dbo.dim_products;
ALTER SCHEMA mart TRANSFER dbo.dim_geolocation;
ALTER SCHEMA mart TRANSFER dbo.dim_review;

ALTER SCHEMA mart TRANSFER dbo.fact_orders