CREATE TABLE [stg].[stg_orders_clean] (
    [column1]                       NVARCHAR (50) NOT NULL,
    [order_id]                      NVARCHAR (50) NOT NULL,
    [customer_id]                   NVARCHAR (50) NOT NULL,
    [order_status]                  NVARCHAR (50) NOT NULL,
    [order_purchase_timestamp]      DATETIME2 (7) NULL,
    [order_approved_at]             DATETIME2 (7) NULL,
    [order_delivered_carrier_date]  DATETIME2 (7) NULL,
    [order_delivered_customer_date] DATETIME2 (7) NULL,
    [order_estimated_delivery_date] DATETIME2 (7) NULL,
    CONSTRAINT [PK_orders_clean] PRIMARY KEY CLUSTERED ([order_id] ASC)
);

--Supprimer la clé primaire existante de dim_review
SELECT 
    CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'stg_orders_clean'
  AND CONSTRAINT_TYPE = 'PRIMARY KEY';

ALTER TABLE stg.stg_orders_clean
DROP CONSTRAINT PK_orders_clean;

--Ajouter la colonne surrogate key
ALTER TABLE stg.stg_orders_clean
ADD review_key INT IDENTITY(1,1);

--Créer la nouvelle clé primaire sur cette colonne
ALTER TABLE stg.stg_orders_clean
ADD CONSTRAINT PK_orders_clean PRIMARY KEY (review_key);
