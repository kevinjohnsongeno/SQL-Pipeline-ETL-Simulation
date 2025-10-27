# 🧩 SQL ETL Pipeline Simulation

> **Objective:** Simulate an **ETL (Extract, Transform, Load)** process entirely using SQL and SQLite to demonstrate data engineering fundamentals.

---

## 📘 Project Overview

This project showcases a **complete ETL pipeline** developed purely with SQL commands inside **SQLite**.  
It demonstrates how raw retail sales data can be extracted from CSV files, cleaned and transformed, loaded into structured production tables, and tracked using automated audit logs.  

The pipeline replicates real-world ETL workflows without relying on external ETL tools — providing a **lightweight, transparent, and fully SQL-driven solution**.

---

## 🎯 Key Objectives

- Simulate the **Extract, Transform, Load (ETL)** process using SQL.  
- Implement **data cleaning and transformation** steps within SQLite.  
- Design **audit logs and triggers** for process automation and accountability.  
- Create a **production-ready dataset** suitable for analytics and reporting.  
- Maintain an end-to-end workflow using only database scripts.

---

## 🧠 Tools & Technologies Used

| Component | Description |
|------------|-------------|
| **Database** | SQLite |
| **Interface** | DB Browser for SQLite |
| **Source Data** | Retail sales transactions (CSV file) |
| **Language** | SQL (SQLite dialect) |
| **Output Format** | SQLite database tables and CSV exports |

---

## ⚙️ Workflow Summary

The project is divided into five key phases that simulate a real ETL process:

### 1️⃣ Extract
- Raw sales data from a CSV file is imported into a **staging table**.  
- This table acts as a temporary workspace for initial data inspection and validation.  
- The original data remains intact for traceability and reproducibility.

### 2️⃣ Transform
- Data cleaning and transformation are performed on the staging table.  
- Duplicates, null values, and invalid records are removed.  
- Text fields are standardized, numeric fields validated, and date formats normalized.  
- The cleaned data is stored in a **cleaned table** ready for production loading.

### 3️⃣ Load
- Clean, validated data is moved into a **production table** designed for analytics.  
- Computed metrics such as **Total Amount (Quantity × Price)** are included.  
- Each record is timestamped during the load process for tracking.

### 4️⃣ Audit and Automation
- An **audit log** records every ETL operation, capturing:  
  - Source and destination tables  
  - Row ranges, record counts, and timestamps  
- Automated **SQL triggers** ensure audit entries are logged automatically when data is inserted into production tables.

### 5️⃣ Export and Verification
- Final **production tables** are verified for completeness and accuracy.  
- Outputs can be exported as CSV files for reporting or business analysis.  
- This ensures **data consistency**, **traceability**, and **repeatability**.

---

## 📊 Project Outputs

| Output Table | Description |
|---------------|-------------|
| **staging_sales** | Contains raw, unprocessed data imported from the CSV file. |
| **cleaned_sales** | Intermediate dataset after cleaning and transformation. |
| **production_sales** | Final analytics-ready dataset with computed totals and timestamps. |
| **audit_log** | Tracks all ETL operations including record counts and load timestamps. |

---

## 🧾 Example Results

### ✅ Sample Cleaned Record
| Invoice No | Customer ID | Gender | Age | Category | Quantity | Price | Payment Method | Invoice Date | Shopping Mall |
|-------------|--------------|--------|-----|-----------|-----------|--------|----------------|---------------|----------------|
| I138884 | C241288 | FEMALE | 28 | Clothing | 5 | 1500.40 | CREDIT CARD | 2022-08-05 | Kanyon |

### ✅ Example Audit Log Entry
| Audit ID | Source Table | Destination Table | Rows Inserted | Timestamp |
|-----------|---------------|------------------|----------------|------------|
| 1 | staging_sales | production_sales | 5000 | 2025-10-27 15:45:00 |

---

## 📁 Project Deliverables

| File | Description |
|------|-------------|
| **README.md** | Complete project documentation including objectives, workflow, and results. |
| **ETL Simulation on salesdata.sql** | Main SQL script implementing the full ETL pipeline (Extract → Transform → Load → Audit). |
| **SQL ETL Simulation** | Supporting SQL script for testing and data validation. |
| **customer_shopping_data.csv** | Raw retail sales dataset used as the ETL input source. |
| **cleaned_sales.csv** | Cleaned version of the dataset generated after transformation. |
| **production_sales.csv** | Final analytics-ready dataset with computed totals. |
| **audit_log.csv** | Audit trail capturing ETL process metadata. |
| **SQL_ETL_PIPELINE_REPORT.pdf** | Concise 1–2 page project report summarizing methods and findings. |

---

## 🧩 Key Features

- 💾 End-to-end **SQL-based ETL** implementation  
- 🔁 **Automated auditing** via database triggers  
- ⏱ Built-in **timestamp tracking** for all ETL runs  
- 🧹 **Data cleaning** and standardization in SQL  
- 📦 **Reproducible and portable** SQLite-based workflow  

---

## 🔍 Learning Outcomes

Through this project, I learned to:
- Design, build, and automate SQL-driven ETL workflows.  
- Manage data quality within relational databases.  
- Implement audit trails and maintain ETL transparency.  
- Use SQLite as a lightweight environment for testing and demonstration.  
- Understand the lifecycle of ETL in data engineering systems.

---

## 🧭 How to Use This Project

1. Open **DB Browser for SQLite** (or any SQLite-compatible environment).  
2. Load the `salesdata.db` database file.  
3. Import the `customer_shopping_data.csv` file into the `staging_sales` table.  
4. Execute the SQL script: **ETL Simulation on salesdata.sql**.  
5. View results in the following tables:
   - `cleaned_sales`
   - `production_sales`
   - `audit_log`
6. Export the final tables to CSV for reporting or visualization.

---

## 🏁 Conclusion

This project successfully simulates an **end-to-end ETL workflow** using only SQL within SQLite.  
It demonstrates how to extract, clean, transform, and load data while maintaining audit transparency through automated triggers.  
The modular design and detailed audit logging make it ideal for **academic learning**, **data engineering demonstrations**, or **portfolio showcasing**.

---

## 👤 Author Information

**Project by:** *Kevin Johnson Geno*  
**Email:** *kevinjohnsongeno@gmail.com*  
**Last Updated:** *October 2025*  

> 💡 *Tip:* Run this project directly in **DB Browser for SQLite** to visualize the ETL process in action and inspect table relationships instantly.
