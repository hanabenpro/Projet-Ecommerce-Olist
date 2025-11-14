CREATE TABLE [stg].[stg_reviews_clean] (
    [review_id]                 NVARCHAR (50)  NOT NULL,
    [order_id]                  NVARCHAR (50)  NOT NULL,
    [review_score]              INT            NULL,
    [review_comment_title]      NVARCHAR (50)  NULL,
    [review_comment_message]    NVARCHAR (250) NULL,
    [review_creation_date]      DATETIME2 (7)  NOT NULL,
    [review_answer_timestamp]   DATETIME2 (7)  NOT NULL,
    [result_concatenation_coms] NVARCHAR (250) NULL,
    CONSTRAINT [PK_reviews_clean] PRIMARY KEY CLUSTERED ([review_id] ASC)
);


--Supprimer la clé primaire existante de dim_review
SELECT 
    CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'stg_reviews_clean'
  AND CONSTRAINT_TYPE = 'PRIMARY KEY';

ALTER TABLE stg.stg_reviews_clean
DROP CONSTRAINT PK_reviews_clean;

--Ajouter la colonne surrogate key
ALTER TABLE stg.stg_reviews_clean
ADD review_key INT IDENTITY(1,1);

--Créer la nouvelle clé primaire sur cette colonne
ALTER TABLE stg.stg_reviews_clean
ADD CONSTRAINT PK_dim_review PRIMARY KEY (review_key);
