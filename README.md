# olist_ecommerce examplained
Repository to store files and productions from a datawarehouse project on e-commerce dataset

# Info
**0_DB_SETUP folder contains:**
* 0_olist_csv_dataset - all OLIST public dataset files in csv format, togheter with a script python that shows statistics about those csv files thanks to pandas libraries.  
* 1_db_sql_scripts - three sql scripts to create the *OLIST_ecommerce* database schemas on postgres 9.6+
  * To re-create a local db, copy the sql scripts text directly from the web page instead of download the files, because Downloading the files and load them through pgAdmin could cause "sintax error" problems.

**1_ETL_TALEND folder contains:**
* OLIST_ETL_v1.0 - job to populate the OLTP schema with data from csv files.
* OLIST_ETL_v1.1 - bug fixed on v1.0, the process rejected some null values that must be stored in the OLTP schema.
