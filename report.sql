SELECT * FROM `pizza-sales`.pizza_sales;

select sum(quantity) as Total_Pizza_Sold FROM `pizza-sales`.pizza_sales;

select count(distinct order_id) as Total_orders from  `pizza-sales`.pizza_sales;

select round(sum(quantity) / count(distinct order_id),2) as Avg_Pizzas_Per_order FROM `pizza-sales`.pizza_sales;

SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, 
COUNT(DISTINCT order_id) AS total_orders  
from  `pizza-sales`.pizza_sales
group by dayname(str_to_date(order_date, '%d-%m-%Y'));


SELECT monthname(STR_TO_DATE(order_date, '%d-%m-%Y')) AS month_name, 
COUNT(DISTINCT order_id) AS total_orders  
from  `pizza-sales`.pizza_sales
group by monthname(str_to_date(order_date, '%d-%m-%Y'))
order by total_orders desc;


SELECT pizza_category, round(SUM(total_price),2) as total_revenue,
round(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) ,2) AS PCT
FROM `pizza-sales`.pizza_sales
GROUP BY pizza_category;


SELECT pizza_size, round(SUM(total_price),2) as total_revenue,
round(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) ,2) AS PCT
FROM `pizza-sales`.pizza_sales
GROUP BY pizza_size
order by PCT desc;


SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM `pizza-sales`.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
limit 5;

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM `pizza-sales`.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
limit 5;

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
limit 5;


SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
limit 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
limit 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
limit 5;