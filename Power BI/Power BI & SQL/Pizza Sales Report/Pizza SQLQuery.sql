
select * from pizza_sales;

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