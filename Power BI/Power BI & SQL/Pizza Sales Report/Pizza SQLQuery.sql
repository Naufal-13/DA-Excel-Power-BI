
### KPI REQUIREMENT ###

# Total_Revenue
select	SUM(total_price) as Total_Revenue from pizza_sales ;

# Avg_order_Value
select (SUM(total_price) / COUNT(distinct order_id)) AS Avg_order_Value from pizza_sales;

# Total_pizza_sold
select SUM(quantity) as Total_pizza_sold from pizza_sales;

# Total_orders
select COUNT(DISTINCT order_id) as Total_orders from pizza_sales;

# Avg_Pizzas_per_order (Dengan Pembulatan)
select CAST( CAST (SUM(quantity) AS DECIMAL(10,2)) / 
CAST (COUNT(distinct order_id) AS DECIMAL(10,2)) AS DECIMAL (10,2))
as Avg_Pizzas_per_order 
from pizza_sales;


### CHARTS REQUIREMENT ###

# Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) as order_date, COUNT(DISTINCT order_date) as Total_orders 
from pizza_sales
GROUP BY DATENAME(DW, order_date);

# Monthly Trend for Orders
SELECT DATENAME(MONTH, order_date) as Month_Name, COUNT (DISTINCT order_id) as Total_orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date);

# Percen of Sales by Pizza Category
SELECT pizza_category, CAST (SUM(total_price) as decimal(10,2)) as total_revenue, CAST (SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales) as decimal (10,2)) as Percentg 
FROM pizza_sales
group by pizza_category;

# Percen of Sales by Pizza Size
SELECT pizza_size, CAST (SUM(total_price) as decimal(10,2)) as total_revenue, CAST (SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales) as decimal (10,2)) as Percentg 
FROM pizza_sales
group by pizza_size;

--------------------------
select * from pizza_sales;
--------------------------

# Top 5 best seller by revenue
SELECT pizza_name, CAST(SUM (total_price) as decimal(10,2)) as revenue
from pizza_sales
group by pizza_name;

# Top 5 best seller by total qty, and total orders
Select pizza_name, SUM(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity; 