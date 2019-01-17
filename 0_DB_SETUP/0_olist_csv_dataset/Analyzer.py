from __future__ import print_function
import pandas as pd

customers_dataframe_col = list(["customer_id", "customer_unique_id","customer_zip_code_prefix", "customer_city","customer_state"])
customers_dataframe = pd.read_csv("olist_customers_dataset.csv", sep=",", names=customers_dataframe_col, quoting=3)
print('\nCustomers Information:' )
print(customers_dataframe.describe())

geo_col = list(["geolocation_zip_code_prefix","geolocation_lat","geolocation_lng","geolocation_city","geolocation_state"])
geo_dataframe = pd.read_csv("olist_geolocation_dataset.csv", sep=",", dtype={"geolocation_zip_code_prefix" : int,"geolocation_lat" : float ,"geolocation_lng": float,"geolocation_city" : object,"geolocation_state": object})
print('\nGeo Information:' )
print(geo_dataframe.describe())

order_items_col = list(["order_id","order_item_id","product_id","seller_id","price","freight_value"])
order_items_dataframe = pd.read_csv("olist_order_items_dataset.csv", sep=",", names=order_items_col)
print('\nOrder items Information:' )
print(order_items_dataframe.describe())

order_payments_col = list(["order_id","payment_sequential","payment_type","payment_installments","payment_value"])
order_payments_dataframe = pd.read_csv("olist_order_payments_dataset.csv", sep=",", names=order_payments_col)
print('\nOrder payments Information:' )
print(order_payments_dataframe.describe())

order_reviews_col = list(["review_id","order_id","review_score","review_comment_title","review_comment_message","review_creation_date","review_answer_timestamp"])
order_reviews_dataframe = pd.read_csv("olist_order_reviews_dataset.csv", sep=",", names=order_reviews_col)
print('\nOrder reviews Information:' )
print(order_reviews_dataframe.describe())

orders_col = list(["order_id","customer_id","order_status","order_purchase_timestamp","order_approved_at","order_delivered_carrier_date","order_delivered_customer_date","order_estimated_delivery_date"])
orders_dataframe = pd.read_csv("olist_orders_dataset.csv", sep=",", names=orders_col)
print('\nOrders Information:' )
print(orders_dataframe.describe())

products_col = list(["product_id","product_category_name","product_name_lenght","product_description_lenght","product_photos_qty","product_weight_g","product_length_cm","product_height_cm","product_width_cm"])
products_dataframe = pd.read_csv("olist_products_dataset.csv", sep=",", names=products_col)
print('\nProducts Information:' )
print(products_dataframe.describe())

sellers_col = list(["seller_id","seller_zip_code_prefix","seller_city","seller_state"])
sellers_dataframe = pd.read_csv("olist_sellers_dataset.csv", sep=",", names=sellers_col)
print('\nSellers Information:' )
print(sellers_dataframe.describe())

traduction_col = list(["product_category_name","product_category_name_english"])
traduction_dataframe = pd.read_csv("product_category_name_translation.csv", sep=",", names=traduction_col)
print('\nTraduction Information:' )
print(traduction_dataframe.describe())
