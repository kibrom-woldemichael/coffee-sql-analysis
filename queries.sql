-- View all records
SELECT * FROM coffee_sales;

-- Check table structure
PRAGMA table_info(coffee_sales);

-- Total quantity sold
SELECT
    SUM(Quantity_kg) AS total_quantity_sold
FROM coffee_sales;

-- Total revenue
SELECT
    SUM(Quantity_kg * Price_per_kg) AS total_revenue
FROM coffee_sales;

-- Total profit
SELECT
    SUM((Quantity_kg * Price_per_kg) - ((Quantity_kg * Cost_per_kg) + Shipping_Cost)) AS total_profit
FROM coffee_sales;

-- Revenue by country
SELECT
    Country,
    SUM(Quantity_kg * Price_per_kg) AS revenue
FROM coffee_sales
GROUP BY Country
ORDER BY revenue DESC;

-- Profit by country
SELECT
    Country,
    SUM((Quantity_kg * Price_per_kg) - ((Quantity_kg * Cost_per_kg) + Shipping_Cost)) AS profit
FROM coffee_sales
GROUP BY Country
ORDER BY profit DESC;

-- Revenue by coffee type
SELECT
    Coffee_Type,
    SUM(Quantity_kg * Price_per_kg) AS revenue
FROM coffee_sales
GROUP BY Coffee_Type
ORDER BY revenue DESC;

-- Profit by coffee type
SELECT
    Coffee_Type,
    SUM((Quantity_kg * Price_per_kg) - ((Quantity_kg * Cost_per_kg) + Shipping_Cost)) AS profit
FROM coffee_sales
GROUP BY Coffee_Type
ORDER BY profit DESC;

-- Monthly revenue trend
SELECT
    strftime('%Y-%m', Date) AS month,
    SUM(Quantity_kg * Price_per_kg) AS revenue
FROM coffee_sales
GROUP BY month
ORDER BY month;

-- Monthly profit trend
SELECT
    strftime('%Y-%m', Date) AS month,
    SUM((Quantity_kg * Price_per_kg) - ((Quantity_kg * Cost_per_kg) + Shipping_Cost)) AS profit
FROM coffee_sales
GROUP BY month
ORDER BY month;

-- Top customers by revenue
SELECT
    Customer,
    SUM(Quantity_kg * Price_per_kg) AS revenue
FROM coffee_sales
GROUP BY Customer
ORDER BY revenue DESC;

-- Top customers by profit
SELECT
    Customer,
    SUM((Quantity_kg * Price_per_kg) - ((Quantity_kg * Cost_per_kg) + Shipping_Cost)) AS profit
FROM coffee_sales
GROUP BY Customer
ORDER BY profit DESC;

-- Average selling price by coffee type
SELECT
    Coffee_Type,
    AVG(Price_per_kg) AS average_price
FROM coffee_sales
GROUP BY Coffee_Type
ORDER BY average_price DESC;

-- Lowest-performing countries by profit
SELECT
    Country,
    SUM((Quantity_kg * Price_per_kg) - ((Quantity_kg * Cost_per_kg) + Shipping_Cost)) AS profit
FROM coffee_sales
GROUP BY Country
ORDER BY profit ASC;