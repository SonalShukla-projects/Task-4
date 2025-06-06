
-- SQL Project: E-Commerce Shipment Analysis

-- Step 1: Create and use the database
CREATE DATABASE IF NOT EXISTS Databasetask;
USE Databasetask;

-- Step 2: Create the shipments table (renamed)
CREATE TABLE IF NOT EXISTS Tableofdatabase (
  ID INT PRIMARY KEY,
  Warehouse_block VARCHAR(10),
  Mode_of_Shipment VARCHAR(20),
  Customer_care_calls INT,
  Customer_rating INT,
  Cost_of_the_Product DECIMAL(10,2),
  Prior_purchases INT,
  Product_importance VARCHAR(20),
  Gender VARCHAR(10),
  Discount_offered DECIMAL(10,2),
  Weight_in_gms INT,
  Reached_on_Time_Y_N TINYINT(1)
);

-- Step 3: Load CSV data (adjust path as needed)
-- Note: Must move CSV to folder from 'secure_file_priv' result
-- Example path: 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/shipments.csv'
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/shipments.csv'
INTO TABLE Tableofdatabase
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Step 4: Data exploration queries
SELECT * FROM Tableofdatabase LIMIT 10;
SELECT COUNT(*) AS total_shipments FROM Tableofdatabase;

-- Step 5: Delivery status counts
SELECT Reached_on_Time_Y_N AS delivery_status, COUNT(*) AS count
FROM Tableofdatabase
GROUP BY Reached_on_Time_Y_N;

-- Step 6: Average cost per shipment method
SELECT Mode_of_Shipment, AVG(Cost_of_the_Product) AS avg_cost
FROM Tableofdatabase
GROUP BY Mode_of_Shipment;

-- Step 7: Revenue per warehouse (net)
SELECT Warehouse_block, SUM(Cost_of_the_Product - Discount_offered) AS total_revenue
FROM Tableofdatabase
GROUP BY Warehouse_block;

-- Step 8: Delays by product importance
SELECT Product_importance, COUNT(*) AS delayed_count
FROM Tableofdatabase
WHERE Reached_on_Time_Y_N = 0
GROUP BY Product_importance;

-- Step 9: Top 5 delayed expensive shipments
SELECT ID, Cost_of_the_Product
FROM Tableofdatabase
WHERE Reached_on_Time_Y_N = 0
ORDER BY Cost_of_the_Product DESC
LIMIT 5;

-- Step 10: Subquery - above average product cost
SELECT ID, Cost_of_the_Product
FROM Tableofdatabase
WHERE Cost_of_the_Product > (
  SELECT AVG(Cost_of_the_Product) FROM Tableofdatabase
);

-- Step 11: Create a view for high-value delayed shipments
CREATE VIEW high_value_delays AS
SELECT *
FROM Tableofdatabase
WHERE Reached_on_Time_Y_N = 0 AND Cost_of_the_Product > 250;

-- Step 12: Query the view
SELECT * FROM high_value_delays;

-- Step 13: Indexes for optimization
CREATE INDEX idx_warehouse ON Tableofdatabase(Warehouse_block);
CREATE INDEX idx_delivery ON Tableofdatabase(Reached_on_Time_Y_N);

-- Step 14: EXPLAIN plan (for performance check)
EXPLAIN SELECT * FROM Tableofdatabase WHERE Reached_on_Time_Y_N = 0;
