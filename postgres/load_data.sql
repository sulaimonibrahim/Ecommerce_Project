SET datestyle = 'DMY';


COPY olist_customers_dataset(customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
FROM '/olist_customers_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY olist_sellers_dataset(seller_id, seller_zip_code, seller_city, seller_state)
FROM '/olist_sellers_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY olist_products_dataset(product_id, product_category_name, product_name_length, product_description_length, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm)
FROM '/olist_products_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY olist_orders_dataset(order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date)
FROM '/olist_orders_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY olist_order_reviews_dataset(review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp)
FROM '/olist_order_reviews_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY olist_order_payments_dataset(order_id, payment_sequential, payment_type, payment_installments, payment_value)
FROM '/olist_order_payments_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY olist_order_items_dataset(order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value)
FROM '/olist_order_items_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY olist_geolocation_dataset(zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state)
FROM '/olist_geolocation_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY product_cat_name_trans(product_category_name, product_category_name_english)
FROM '/product_cat_name_trans.csv'
DELIMITER ','
CSV HEADER;

