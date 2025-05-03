
-- Task 6: Sales Trend Analysis Using Aggregations

-- A. Monthly Revenue & Order Volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

-- B. Revenue per Product per Month
SELECT 
    product_id,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS product_revenue
FROM online_sales
GROUP BY product_id, year, month
ORDER BY year, month, product_revenue DESC;

-- C. Top 3 Months by Total Revenue
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY month
ORDER BY monthly_revenue DESC
LIMIT 3;

-- D. Revenue in a Specific Year (e.g., 2024)
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS revenue_2024,
    COUNT(DISTINCT order_id) AS orders_2024
FROM online_sales
WHERE EXTRACT(YEAR FROM order_date) = 2024
GROUP BY month
ORDER BY month;

-- E. Handling NULLs in amount
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(COALESCE(amount, 0)) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY year, month
ORDER BY year, month;
