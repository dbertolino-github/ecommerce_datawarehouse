--------------------------------------------------------
-- Schema DWH
--------------------------------------------------------
CREATE SCHEMA "DWH";
SET SCHEMA 'DWH';

--------------------------------------------------------
-- Table "DWH".D_CUSTOMERS
--------------------------------------------------------
CREATE SEQUENCE "DWH".D_CUSTOMERS_SEQ 
INCREMENT 1
MINVALUE 1
START 1
CACHE 20;

CREATE TABLE "DWH".D_CUSTOMERS
(    
    CUSTOMER_KEY NUMERIC NOT NULL DEFAULT nextval('"DWH".D_CUSTOMERS_SEQ'),
    CUSTOMER_UNIQUE_ID VARCHAR(50) NOT NULL, 
    CUSTOMER_ZIPCODE VARCHAR(5) NOT NULL, 
    CUSTOMER_CITY VARCHAR(50) NOT NULL, 
    CUSTOMER_STATE VARCHAR(5) NOT NULL,
    CUSTOMER_GEO_LAT DOUBLE PRECISION NOT NULL, 
    CUSTOMER_GEO_LONG DOUBLE PRECISION NOT NULL,
    CONSTRAINT "D_CUSTOMERS_PK" PRIMARY KEY (CUSTOMER_KEY)
);
--------------------------------------------------------
-- Table "DWH".D_PAYMENTS
--------------------------------------------------------
CREATE SEQUENCE "DWH".D_PAYMENTS_SEQ
INCREMENT 1
MINVALUE 1
START 1
CACHE 20;

CREATE TABLE "DWH".D_PAYMENTS
(    
    PAYMENT_KEY NUMERIC NOT NULL DEFAULT nextval('"DWH".D_PAYMENTS_SEQ'),
    PAYMENT_ID VARCHAR(50) NOT NULL, 
    PAYMENT_SEQUENTIAL SMALLINT NOT NULL, 
    PAYMENT_TYPE VARCHAR(20) NOT NULL,
    PAYMENT_INSTALLMENTS SMALLINT NOT NULL,
    PAYMENT_VALUE NUMERIC(2) NOT NULL,
    CONSTRAINT "D_PAYMENTS_PK" PRIMARY KEY (PAYMENT_KEY) 
);
--------------------------------------------------------
-- Table "DWH".D_PRODUCTS
--------------------------------------------------------
CREATE SEQUENCE "DWH".D_PRODUCTS_SEQ
INCREMENT 1
MINVALUE 1
START 1
CACHE 20;

CREATE TABLE "DWH".D_PRODUCTS
(    
    PRODUCT_KEY NUMERIC NOT NULL DEFAULT nextval('"DWH".D_PRODUCTS_SEQ'),
    PRODUCT_ID VARCHAR(50) NOT NULL,
    PRODUCT_CATEGORY_NAME VARCHAR(100) NOT NULL, 
    PRODUCT_CATEGORY_NAME_ENGLISH VARCHAR(100) NOT NULL,
    PRODUCT_NAME_LENGHT SMALLINT NOT NULL,
    DESCRIPTION_LENGHT INTEGER NOT NULL,
    PRODUCT_PHOTO_QTA SMALLINT NOT NULL,
    PRODUCT_WEIGHT_GRAMS SMALLINT NOT NULL,
    PRODUCT_LENGHT_CM SMALLINT NOT NULL,
    PRODUCT_HEIGHT_CM SMALLINT NOT NULL,
    PRODUCT_WIDTH_CM SMALLINT NOT NULL,
    CONSTRAINT "D_PRODUCTS_PK" PRIMARY KEY (PRODUCT_KEY) 
);
--------------------------------------------------------
-- Table "DWH".D_SELLERS
--------------------------------------------------------
CREATE SEQUENCE "DWH".D_SELLERS_SEQ
INCREMENT 1
MINVALUE 1
START 1
CACHE 20;

CREATE TABLE "DWH".D_SELLERS
(
    SELLER_KEY NUMERIC NOT NULL DEFAULT nextval('"DWH".D_SELLERS_SEQ'),
    SELLER_ID VARCHAR(50) NOT NULL,
    SELLER_ZIPCODE VARCHAR(5) NOT NULL,
    SELLER_CITY VARCHAR(50) NOT NULL, 
    SELLER_STATE VARCHAR(5) NOT NULL,
    SELLER_GEO_LAT DOUBLE PRECISION NOT NULL, 
    SELLER_GEO_LONG DOUBLE PRECISION NOT NULL, 
    CONSTRAINT "D_SELLERS_PK" PRIMARY KEY (SELLER_KEY) 
);
--------------------------------------------------------
-- Table "DWH".F_ORDERS
--------------------------------------------------------
CREATE TABLE "DWH".F_ORDERS
(    
    ORDER_ID VARCHAR(50) NOT NULL,
    CUSTOMER_KEY NUMERIC NOT NULL,  
    PRODUCT_KEY NUMERIC NOT NULL,
    SELLER_KEY NUMERIC NOT NULL,
    PAYMENT_KEY NUMERIC NOT NULL,
    ORDER_ITEM_QTA SMALLINT NOT NULL, 
    PRICE NUMERIC(2) NOT NULL,
    FREIGHT_VALUE NUMERIC(2) NOT NULL,
    ORDER_STATUS VARCHAR(30) NOT NULL,
    REVIEW_SCORE SMALLINT NOT NULL,  
    ORDER_PURCHASE_TIMESTAMP TIMESTAMP NOT NULL,
    ORDER_APPROVAL_TIMESTAMP TIMESTAMP NOT NULL,
    ORDER_DELIVERED_CARRIER_TIMESTAMP TIMESTAMP NOT NULL,
    ORDER_DELIVERED_CUSTOMER_TIMESTAMP TIMESTAMP NOT NULL,
    ORDER_ESTIMATED_DELIVERY_TIMESTAMP TIMESTAMP NOT NULL
);

--------------------------------------------------------
-- FOREIGN KEY Constraints
--------------------------------------------------------
ALTER TABLE "DWH".F_ORDERS 
ADD CONSTRAINT "F_ORDERS_D_CUSTOMERS_FK" FOREIGN KEY (CUSTOMER_KEY)
REFERENCES "DWH".D_CUSTOMERS (CUSTOMER_KEY)
MATCH SIMPLE 
ON UPDATE NO ACTION 
ON DELETE NO ACTION;

ALTER TABLE "DWH".F_ORDERS 
ADD CONSTRAINT "F_ORDERS_D_PAYMENTS_FK" FOREIGN KEY (PAYMENT_KEY)
REFERENCES "DWH".D_PAYMENTS (PAYMENT_KEY)
MATCH SIMPLE 
ON UPDATE NO ACTION 
ON DELETE NO ACTION;


ALTER TABLE "DWH".F_ORDERS 
ADD CONSTRAINT "F_ORDERS_D_PRODUCTS_FK" FOREIGN KEY (PRODUCT_KEY)
REFERENCES "DWH".D_PRODUCTS (PRODUCT_KEY)
MATCH SIMPLE 
ON UPDATE NO ACTION 
ON DELETE NO ACTION;

ALTER TABLE "DWH".F_ORDERS 
ADD CONSTRAINT "F_ORDERS_D_SELLERS_FK" FOREIGN KEY (SELLER_KEY)
REFERENCES "DWH".D_SELLERS (SELLER_KEY)
MATCH SIMPLE 
ON UPDATE NO ACTION 
ON DELETE NO ACTION;

--------------------------------------------------------
-- INDEXING JOINS
--------------------------------------------------------
CREATE INDEX "FKI_F_ORDERS_D_CUSTOMERS_FK"
ON "DWH".F_ORDERS
USING btree (CUSTOMER_KEY); 

CREATE INDEX "FKI_F_ORDERS_D_PAYMENTS_FK"
ON "DWH".F_ORDERS
USING btree (PAYMENT_KEY); 

CREATE INDEX "FKI_F_ORDERS_D_PRODUCTS_FK"
ON "DWH".F_ORDERS
USING btree (PRODUCT_KEY); 

CREATE INDEX "FKI_F_ORDERS_D_SELLERS_FK"
ON "DWH".F_ORDERS
USING btree (SELLER_KEY); 
