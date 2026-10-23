CREATE DATABASE Pizza_Sales;
USE Pizza_Sales;

SELECT * FROM pizza_sales;

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;
SELECT SUM(total_price) / COUNT(DISTINCT order_id) as Average_Price from pizza_sales;
SELECT SUM(quantity) as Total_Pizza_Order from pizza_sales;
SELECT COUNT(DISTINCT order_id) as Total_Order_Placed from pizza_sales;
SELECT SUM(quantity) / COUNT(DISTINCT order_id) as Average_Pizza_Per_Order from pizza_sales;

SELECT
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Order_day,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY Order_day
ORDER BY FIELD(Order_day,
    'Monday', 'Tuesday', 'Wednesday',
    'Thursday', 'Friday', 'Saturday', 'Sunday') ASC;


SELECT MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Order_month,
COUNT(DISTINCT order_id) as Total_orders
FROM pizza_sales
GROUP BY Order_month
ORDER BY FIELD(Order_month,
'JANUARY', 'FEBRUARY', 'MARCH', 'APRIL', 'MAY', 'JUNE', 'JULY', 'AUGUST', 'SEPTEMBER', 'OCTOBER', 'NOVEMBER', 'DECEMBER');

SELECT pizza_category, SUM(total_price) AS Category_revenue, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales as Percetage )from pizza_sales
GROUP BY pizza_category;

SELECT pizza_size, SUM(quantity) AS Size_Revenue, SUM(quantity) * 100 / (SELECT SUM(quantity) from pizza_sales) from pizza_sales
Group BY pizza_size;

SELECT pizza_category, SUM(quantity) AS Categorywise_Sell, SUM(quantity) * 100 / (SELECT SUM(quantity) from pizza_sales) from pizza_sales
GROUP BY pizza_category;

SELECT pizza_name, SUM(quantity) as Pizza_Sold from pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
LIMIT 5;

SELECT pizza_name , SUM(quantity) as Pizza_Sold from pizza_sales
GROUP BY pizza_name
Order By SUM(quantity) ASC
LIMIT 5;

