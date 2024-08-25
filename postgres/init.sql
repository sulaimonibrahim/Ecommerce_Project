-- Creating product_cat_name_trans table
CREATE TABLE product_cat_name_trans (
    product_category_name VARCHAR(255),
    product_category_name_english VARCHAR(255)
);

-- Creating olist_sellers_dataset table
CREATE TABLE olist_sellers_dataset (
    seller_id VARCHAR(255),
    seller_zip_code VARCHAR(255),
    seller_city VARCHAR(255),
    seller_state VARCHAR(255)
);

-- Creating olist_products_dataset table
CREATE TABLE olist_products_dataset (
    product_id VARCHAR(255),
    product_category_name VARCHAR(255),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

-- Create olist_orders_dataset table
CREATE TABLE olist_orders_dataset (
    order_id VARCHAR(255),
    customer_id VARCHAR(255),
    order_status VARCHAR(255),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

-- Create olist_order_reviews_dataset table
CREATE TABLE olist_order_reviews_dataset (
    review_id VARCHAR(255),
    order_id VARCHAR(255),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date DATE,
    review_answer_timestamp TIMESTAMP
);

-- Create olist_order_payments_dataset table
CREATE TABLE olist_order_payments_dataset (
    order_id VARCHAR(255),
    payment_sequential INT,
    payment_type VARCHAR(255),
    payment_installments INT,
    payment_value FLOAT
);

-- Create olist_order_items_dataset table
CREATE TABLE olist_order_items_dataset (
    order_id VARCHAR(255),
    order_item_id INT,
    product_id VARCHAR(255),
    seller_id VARCHAR(255),
    shipping_limit_date TIMESTAMP,
    price FLOAT,
    freight_value FLOAT
);

-- Create olist_geolocation_dataset table
CREATE TABLE olist_geolocation_dataset (
    zip_code_prefix VARCHAR(255),
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city VARCHAR(255),
    geolocation_state VARCHAR(255)
);

-- Create olist_customers_dataset table
CREATE TABLE olist_customers_dataset (
    customer_id VARCHAR(255),
    customer_unique_id VARCHAR(255),
    customer_zip_code_prefix VARCHAR(255),
    customer_city VARCHAR(255),
    customer_state VARCHAR(255)
);
