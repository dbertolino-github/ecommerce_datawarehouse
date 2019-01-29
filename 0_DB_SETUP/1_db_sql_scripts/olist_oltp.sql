--------------------------------------------------------
-- Schema OLTP
--------------------------------------------------------
CREATE SCHEMA "OLTP";
SET SCHEMA 'OLTP';

--------------------------------------------------------
-- Table "OLTP".OLTP_CUSTOMERS
--------------------------------------------------------
CREATE TABLE "OLTP".OLTP_CUSTOMERS
(    
    CUSTOMER_ID VARCHAR(50), 
    CUSTOMER_UNIQUE_ID VARCHAR(50), 
    CUSTOMER_ZIPCODE VARCHAR(5), 
    CUSTOMER_CITY VARCHAR(50), 
    CUSTOMER_STATE VARCHAR(50)
);
--------------------------------------------------------
-- Table "OLTP".OLTP_GEOLOCALIZATIONS
--------------------------------------------------------
CREATE TABLE "OLTP".OLTP_GEOLOCALIZATIONS
(    
    GEO_ZIPCODE VARCHAR(5), 
    GEO_LAT DOUBLE PRECISION, 
    GEO_LONG DOUBLE PRECISION, 
    GEO_CITY VARCHAR(50),
    GEO_STATE VARCHAR(50)
);
--------------------------------------------------------
-- Table "OLTP".OLTP_ORDER_ITEMS
--------------------------------------------------------
CREATE TABLE "OLTP".OLTP_ORDER_ITEMS
(    
    ORDER_ID VARCHAR(50), 
    ORDER_ITEM_QTA INTEGER, 
    PRODUCT_ID VARCHAR(50),
    SELLER_ID VARCHAR(50),
    PRICE REAL,
    FREIGHT_VALUE REAL
);
--------------------------------------------------------
-- Table "OLTP".OLTP_ORDER_PAYMENTS
--------------------------------------------------------
CREATE TABLE "OLTP".OLTP_ORDER_PAYMENTS
(    
    ORDER_ID VARCHAR(50), 
    PAYMENT_SEQUENTIAL INTEGER, 
    PAYMENT_TYPE VARCHAR(20),
    PAYMENT_INSTALLMENTS INTEGER,
    PAYMENT_VALUE REAL
);
--------------------------------------------------------
-- Table "OLTP".OLTP_ORDER_REVIEWS
--------------------------------------------------------
CREATE TABLE "OLTP".OLTP_ORDER_REVIEWS
(    
    REVIEW_ID VARCHAR(50),
    ORDER_ID VARCHAR(50),
    REVIEW_SCORE INTEGER, 
    REVIEW_TITLE TEXT,
    REVIEW_CONTENT TEXT,
    REVIEW_CREATION_TIMESTAMP TIMESTAMP,
    REVIEW_ANSWER_TIMESTAMP TIMESTAMP
);
--------------------------------------------------------
-- Table "OLTP".OLTP_ORDERS
--------------------------------------------------------
CREATE TABLE "OLTP".OLTP_ORDERS
(    
    ORDER_ID VARCHAR(50),
    CUSTOMER_ID VARCHAR(50), 
    ORDER_STATUS VARCHAR(30),
    ORDER_PURCHASE_TIMESTAMP TIMESTAMP,
    ORDER_APPROVAL_TIMESTAMP TIMESTAMP,
    ORDER_DELIVERED_CARRIER_TIMESTAMP TIMESTAMP,
    ORDER_DELIVERED_CUSTOMER_TIMESTAMP TIMESTAMP,
    ORDER_ESTIMATED_DELIVERY_TIMESTAMP TIMESTAMP
);
--------------------------------------------------------
-- Table "OLTP".OLTP_PRODUCTS
--------------------------------------------------------
CREATE TABLE "OLTP".OLTP_PRODUCTS
(    
    PRODUCT_ID VARCHAR(50),
    PRODUCT_CATEGORY_NAME VARCHAR(100), 
    PRODUCT_NAME_LENGHT INTEGER,
    DESCRIPTION_LENGHT INTEGER,
    PRODUCT_PHOTO_QTA INTEGER,
    PRODUCT_WEIGHT_GRAMS INTEGER,
    PRODUCT_LENGHT_CM INTEGER,
    PRODUCT_HEIGHT_CM INTEGER,
    PRODUCT_WIDTH_CM INTEGER
);

--------------------------------------------------------
-- Table "OLTP".OLTP_SELLERS
--------------------------------------------------------
CREATE TABLE "OLTP".OLTP_SELLERS
(
    SELLER_ID VARCHAR(50),
    SELLER_ZIPCODE VARCHAR(5),
    SELLER_CITY VARCHAR(50), 
    SELLER_STATE VARCHAR(50)
);

--------------------------------------------------------
-- Table "OLTP".OLTP_CATEGORIES_TRANSLATION
--------------------------------------------------------
CREATE TABLE "OLTP".OLTP_CATEGORIES_TRANSLATION
(    
    PRODUCT_CATEGORY_NAME VARCHAR(100),
    PRODUCT_CATEGORY_NAME_ENGLISH VARCHAR(100)
);


