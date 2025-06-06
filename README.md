# Task-4
# 📦 E-Commerce Shipment Analysis (MySQL Project)

## 🔍 Project Summary

This project explores an e-commerce shipment dataset to extract insights about product shipments, delivery performance, and customer interactions using MySQL. It demonstrates SQL fundamentals such as data filtering, aggregation, subqueries, views, and optimization techniques.

---

## 🧰 Tools & Technologies

- **Database:** MySQL
- **Interface:** MySQL Workbench or Command Line
- **Data Source:** UK-based e-commerce CSV dataset (2010–2011)

---

## 🏗️ Database & Table Structure

- **Database Name:** `Databasetask`
- **Table Name:** `Tableofdatabase`
- **Key Columns:**  
  - `ID`, `Warehouse_block`, `Mode_of_Shipment`, `Customer_care_calls`,  
  - `Customer_rating`, `Cost_of_the_Product`, `Prior_purchases`,  
  - `Product_importance`, `Gender`, `Discount_offered`,  
  - `Weight_in_gms`, `Reached_on_Time_Y_N`

---

## 📊 Analysis Highlights

- ✅ **Total shipments & sample records**
- 📦 **Delivery performance:** On-time vs delayed shipments
- 🚚 **Shipment cost analysis** by mode of transport
- 🏢 **Revenue breakdown** by warehouse (after discount)
- ⚠️ **Delay analysis** by product importance
- 💰 **Top 5 expensive delayed shipments**
- 📈 **Above-average cost products** using subqueries
- 🔍 **Reusable view** for high-value delayed shipments

---

## ⚙️ Optimization

- 🗂️ **Indexes** on `Warehouse_block` and `Reached_on_Time_Y_N`
- 👁️ **Views** to simplify analysis
- 📋 **EXPLAIN** used to inspect query performance

---

## ✅ Outcome

This project demonstrates core SQL skills:
- Table creation and CSV data import
- Filtering and grouping data with `WHERE`, `GROUP BY`, `ORDER BY`
- Performing subqueries and calculations (`AVG`, `SUM`)
- Creating reusable views and optimizing performance with indexes

A great example of applying SQL to analyze real-world structured data effectively.
