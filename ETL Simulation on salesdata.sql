-- SQL ETL PIPELINE SIMULATION

-- 1. Extract: Create staging table
DROP TABLE IF EXISTS staging_sales;

CREATE TABLE staging_sales (
    invoice_no TEXT,
    customer_id TEXT,
    gender TEXT,
    age INTEGER,
    category TEXT,
    quantity INTEGER,
    price REAL,
    payment_method TEXT,
    invoice_date TEXT,
    shopping_mall TEXT
);

-- Imported data from CSV file named customer_shopping_data
-- Data quality check
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM staging_sales;

-- 2. Transform: Clean and standardize data
UPDATE staging_sales
SET 
    gender = UPPER(TRIM(gender)),
    category = TRIM(category),
    payment_method = UPPER(TRIM(payment_method));

-- Create cleaned table
DROP TABLE IF EXISTS cleaned_sales;

CREATE TABLE cleaned_sales AS
SELECT *
FROM staging_sales
WHERE 
    invoice_no IS NOT NULL AND
    customer_id IS NOT NULL AND
    gender IS NOT NULL AND
    category IS NOT NULL AND
    payment_method IS NOT NULL AND
    invoice_date IS NOT NULL AND
    shopping_mall IS NOT NULL AND
    price > 0 AND
    quantity > 0 AND
    age > 0;

-- Verify cleaned table
SELECT COUNT(*) AS cleaned_rows FROM cleaned_sales;

-- 3. Load: Create production table and insert cleaned data
DROP TABLE IF EXISTS production_sales;

CREATE TABLE production_sales (
    sales_id INTEGER PRIMARY KEY AUTOINCREMENT,
    invoice_no TEXT,
    customer_id TEXT,
    gender TEXT,
    age INTEGER,
    category TEXT,
    quantity INTEGER,
    price REAL,
    total_amount REAL,
    payment_method TEXT,
    invoice_date TEXT,
    location TEXT,
    load_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Load data into production table
INSERT INTO production_sales (
    invoice_no,
    customer_id,
    gender,
    age,
    category,
    quantity,
    price,
    total_amount,
    payment_method,
    invoice_date,
    location
)
SELECT
    invoice_no,
    customer_id,
    gender,
    age,
    category,
    quantity,
    price,
    (quantity * price) AS total_amount,
    payment_method,
    invoice_date,
    shopping_mall AS location
FROM cleaned_sales;

-- Verify load data
SELECT COUNT(*) AS total_loaded FROM production_sales;

-- 4. Audit creation
DROP TABLE IF EXISTS audit_log;

CREATE TABLE audit_log (
    audit_id INTEGER PRIMARY KEY AUTOINCREMENT,
    source_table TEXT NOT NULL,
    destination_table TEXT NOT NULL,
    start_row INTEGER,
    end_row INTEGER,
    rows_inserted INTEGER,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insert initial ETL log record
INSERT INTO audit_log (
    source_table,
    destination_table,
    start_row,
    end_row,
    rows_inserted
)
SELECT
    'staging_sales',
    'production_sales',
    MIN(sales_id),
    MAX(sales_id),
    COUNT(*)
FROM production_sales;

-- 5. Trigger for Automated Auditing
DROP TRIGGER IF EXISTS trg_etl_audit_log;

CREATE TRIGGER trg_etl_audit_log
AFTER INSERT ON production_sales
BEGIN
    INSERT INTO audit_log (
        source_table,
        destination_table,
        start_row,
        end_row,
        rows_inserted
    )
    SELECT
        'staging_sales',
        'production_sales',
        (SELECT MIN(sales_id) FROM production_sales),
        (SELECT MAX(sales_id) FROM production_sales),
        (SELECT COUNT(*) FROM production_sales);
END;

