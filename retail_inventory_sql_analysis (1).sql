CREATE DATABASE IF NOT EXISTS retail_inventory_db;

USE retail_inventory_db;
CREATE TABLE retail_sales (
    `Date` DATE,
    `Store ID` VARCHAR(20),
    `Product ID` VARCHAR(20),
    `Category` VARCHAR(50),
    `Region` VARCHAR(50),
    `Inventory Level` INT,
    `Units Sold` INT,
    `Units Ordered` INT,
    `Demand Forecast` DECIMAL(12,2),
    `Price` DECIMAL(10,2),
    `Discount` INT,
    `Weather Condition` VARCHAR(30),
    `Holiday/Promotion` INT,
    `Competitor Pricing` DECIMAL(10,2),
    `Seasonality` VARCHAR(30),
    `Year` INT,
    `Month` INT,
    `Month_Name` VARCHAR(20),
    `Day` INT,
    `Day_of_Week` INT,
    `Week` INT,
    `Revenue` DECIMAL(12,2)
);

DESCRIBE retail_sales;

SELECT COUNT(*) AS total_rows
FROM retail_sales;

SELECT *
FROM retail_sales
LIMIT 10;


SELECT
    COUNT(DISTINCT `Store ID`) AS total_stores,
    COUNT(DISTINCT `Product ID`) AS total_products
FROM retail_sales;

SELECT
    COUNT(DISTINCT `Store ID`) AS total_stores,
    COUNT(DISTINCT `Product ID`) AS total_products
FROM retail_sales;

SELECT SUM(`Revenue`) AS total_revenue
FROM retail_sales;

SELECT SUM(`Units Sold`) AS total_units_sold
FROM retail_sales;

SELECT
    `Category`,
    SUM(`Revenue`) AS total_revenue
FROM retail_sales
GROUP BY `Category`
ORDER BY total_revenue DESC;


SELECT
    `Region`,
    SUM(`Revenue`) AS total_revenue
FROM retail_sales
GROUP BY `Region`
ORDER BY total_revenue DESC;

SELECT
    `Year`,
    `Month`,
    `Month_Name`,
    SUM(`Revenue`) AS monthly_revenue
FROM retail_sales
GROUP BY `Year`, `Month`, `Month_Name`
ORDER BY `Year`, `Month`;


SELECT
    `Product ID`,
    `Category`,
    SUM(`Revenue`) AS total_revenue
FROM retail_sales
GROUP BY `Product ID`, `Category`
ORDER BY total_revenue DESC
LIMIT 10;


# power bi part

CREATE VIEW category_performance AS
SELECT
    `Category`,
    SUM(`Revenue`) AS total_revenue,
    SUM(`Units Sold`) AS total_units_sold,
    AVG(`Price`) AS average_price,
    AVG(`Inventory Level`) AS average_inventory
FROM retail_sales
GROUP BY `Category`;


SELECT *
FROM category_performance;

SELECT USER(), CURRENT_USER();
SHOW VARIABLES LIKE 'port';

