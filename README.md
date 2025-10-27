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
| **Output Format** | CSV and SQLite database tables |

---

## ⚙️ Workflow Summary

The project is divided into five key phases that simulate a real ETL process:

### 1️⃣ Extract
- Raw sales data from a CSV file is imported into a **staging table**.  
- This table acts as a temporary workspace for initial data inspection and validation.  
- Original data remains intact for traceability and reproducibility.

### 2️⃣ Transform
- Data cleaning and transformation are performed on the staging table.  
- Duplicates, null values, and invalid records are removed.  
- Text fields are standardized, numeric fields are validated, and date formats are normalized.  
- Cleaned data is stored in a **cleaned table** ready for production loading.

### 3️⃣ Load
- Clean, validated data is moved to **production tables** structured for analytics.  
- Additional computed metrics such as **Total Amount (Quantity × Price)** are included.  
- Data is timestamped during the load process for tracking and historical reference.

### 4️⃣ Audit and Automation
- An **audit log** records every ETL operation, storing:
  - Source and destination table names  
  - Number of records processed  
  - Row ranges and timestamps  
- Automated **SQL triggers** are used to insert audit entries automatically whenever new records are added to production tables.

### 5️⃣ Export and Verification
- Final **production tables** and **audit logs** are exported as CSV files.  
- These can be used for analytics dashboards, reports, or further data modeling.  
- The system ensures **data consistency**, **traceability**, and **process automation**.

---

## 📊 Project Outputs

| Output Table | Description |
|---------------|-------------|
| **staging_sales** | Contains raw, unprocessed sales data imported from CSV. |
| **cleaned_sales** | Intermediate dataset after applying all cleaning and transformation logic. |
| **production_sales** | Final dataset for business reporting, includes computed totals and timestamps. |
| **audit_log** | Records all ETL operations, including source, destination, and data volume. |

---

## 🧾 Example Results

### Sample Cleaned Record
| Invoice No | Customer ID | Gender | Age | Category | Quantity | Price | Payment Method | Invoice Date | Shopping Mall |
|-------------|--------------|--------|-----|-----------|-----------|--------|----------------|---------------|----------------|
| I138884 | C241288 | FEMALE | 28 | Clothing | 5 | 1500.40 | CREDIT CARD | 2022-08-05 | Kanyon |

### Example Audit Log Entry
| Audit ID | Source Table | Destination Table | Rows Inserted | Timestamp |
|-----------|---------------|------------------|----------------|------------|
| 1 | staging_sales | production_sales | 5000 | 2025-10-27 15:45:00 |

---

## 📁 Project Deliverables

| File | Description |
|------|-------------|
| **README.md** | Complete project documentation including objectives, tools, ETL workflow, and results. |
| **SQL ETL Simulation** | Main SQL script implementing the ETL process (Extract, Transform, Load, and Audit). |
| **customer_shopping_data.csv** | Raw retail sales dataset used as the input source for the ETL pipeline. |
| **salesdata.db** | SQLite database file containing all project tables — staging, cleaned, production, and audit. |
| **SQL_ETL_Project_Report.pdf**  | Concise 1–2 page project summary. |

---

## 🧩 Key Features

- 💾 Fully SQL-based ETL implementation  
- 🔁 Automated auditing through triggers  
- ⏱ Timestamp tracking for every ETL load    
- ⚙️ Re-runnable and modular design  

---

## 🔍 Learning Outcomes

Through this project, you’ll learn to:
- Design and execute SQL-based ETL pipelines.  
- Manage data quality directly in SQL.  
- Build audit mechanisms for data traceability.  
- Use SQLite as a lightweight ETL testing environment.  
- Understand how real-world ETL systems work at a conceptual level.

---

## 🧭 How to Use This Project

1. Open **DB Browser for SQLite**.  
2. Create or open a database file.  
3. Import the raw data CSV into the **staging_sales** table.  
4. Run the SQL ETL script step-by-step.  
5. Check the **production_sales** and **audit_log** tables.  
6. Export the results as CSV or visualize directly.  

---

## 🏁 Conclusion

This project successfully simulates an **end-to-end ETL workflow** using only SQL within SQLite.  
It demonstrates how raw data can be extracted, cleaned, transformed, and loaded into analytics-ready tables while maintaining full process transparency through audit logs and automation triggers.  

The pipeline’s modular structure makes it suitable for **small-scale data warehousing**, **teaching**, and **ETL prototyping** before scaling to enterprise tools.

---

## 👤 Author Information

**Project by:** *Kevin Johnson Geno*  
**Email:** *kevinjohnsongeno@gmail.com*  
**Last Updated:** *October 2025*  

> Run this project in **DB Browser for SQLite** or the SQLite CLI for an instant, visualized ETL experience.
