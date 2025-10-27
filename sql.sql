DROP TABLE IF EXISTS staging;
CREATE TABLE staging (
	invoice_no	TEXT,
	customer_id	TEXT,
	gender	TEXT,
	age	INTEGER,
	category	TEXT,
	quantity	INTEGER,
	price	REAL,
	payment_method	TEXT,
	invoice_date	TEXT,
	shopping_mall	TEXT
);
SELECT * FROM staging;
SELECT 
		COUNT(*) AS total_rows,
		COUNT(DISTINCT customer_id) AS unique_rows
	FROM staging;

SELECT * FROM staging 
	WHERE 
		invoice_no IS NOT NULL AND
		customer_id IS NOT NULL AND
		gender IS NOT NULL AND
		category IS NOT NULL AND
		payment_method IS NOT NULL AND
		invoice_date IS NOT NULL AND
		shopping_mall IS NOT NULL AND
		price > 0 AND
		quantity >0 AND
		age > 0;
UPDATE staging
SET gender = UPPER(TRIM(gender)),
    category = TRIM(category),
    payment_method = UPPER(TRIM(payment_method));

DROP TABLE IF EXISTS cleaned_sales;
CREATE TABLE cleaned_sales AS
	SELECT * FROM staging_sales
		WHERE 
			invoice_no IS NOT NULL AND
			customer_id IS NOT NULL AND
			gender IS NOT NULL AND
			category IS NOT NULL AND
			payment_method IS NOT NULL AND
			invoice_date IS NOT NULL AND
			shopping_mall IS NOT NULL AND
			price > 0 AND
			quantity >0 AND
			age > 0;
		
SELECT * FROM cleaned_sales;
SELECT 
		COUNT(*) AS total_rows
	FROM staging;

	CREATE TABLE IF NOT EXISTS production_sales (
    sales_id INTEGER PRIMARY KEY AUTOINCREMENT,
    invoice_no TEXT,
    customer_id TEXT,
    gender TEXT CHECK (gender IN ('Male', 'Female')),
    age INTEGER,
    category TEXT,
    quantity INTEGER,
    price REAL,
    payment_method TEXT,
    invoice_date TEXT,
    location TEXT,
    load_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE production_sales 
ADD COLUMN total_amount REAL;
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
SELECT COUNT(*) AS total_loaded FROM production_sales;
SELECT * FROM production_sales;

CREATE TABLE IF NOT EXISTS audit_log (
    audit_id INTEGER PRIMARY KEY AUTOINCREMENT,
    source_table TEXT NOT NULL,
    destination_table TEXT NOT NULL,
    start_row INTEGER,
    end_row INTEGER,
    rows_inserted INTEGER,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER IF NOT EXISTS trg_audit_log
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
        'cleaned_sales' AS source_table,
        'production_sales' AS destination_table,
        (SELECT MIN(sales_id) FROM production_sales),
        (SELECT MAX(sales_id) FROM production_sales),
        (SELECT COUNT(*) FROM production_sales);
END;

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
