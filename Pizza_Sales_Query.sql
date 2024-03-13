select * from pizza_sales;

SELECT 
    order_id,
    COUNT(order_id) AS total_orders
FROM 
    pizza_sales
GROUP BY 
    order_id order by order_id;

select pizza_category,count(*) total_count from pizza_sales
where quantity > 2
group by pizza_category
order by total_count desc;

 -------------------Problem Statement-----------------------
 --Q.K1 Total Revenue:
 select round(sum(total_price),2) Total_revenue 
 from pizza_sales;

 --Q.K2 Average Order Value:
 select sum(total_price)/count(distinct order_id) Average_Order_value 
 from pizza_sales;

 --Q.K3 Total Pizza Sold:
 Select sum(quantity) Total_pizza_sold 
 from pizza_sales;

 --Q.K4 Total Orders:
 Select count(distinct order_id) Total_Orders
 from pizza_sales;

 --Q.K5 Average Pizza Per Order:
 select cast(cast(sum(quantity) as decimal(10,2))/
 cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))Average_Pizza_perOrder
 from pizza_sales;

--Q.C1 Daily Trend for Total orders:
select DATENAME(DW, order_date) Order_Day, 
count(distinct order_id) Total_Orders
from pizza_sales
group by DATENAME(DW, order_date);

--Q.C2 Monthly trend for total order:
select DATENAME(MONTH, order_date) Month_Name,
count(distinct order_id) Total_Orders
from pizza_sales
group by DATENAME(MONTH, order_date);

--Q.C3 Percentage of sales by pizza category:
select pizza_category, round(sum(total_price),2) Total_Sales,
round(sum(total_price) * 100/(select sum(total_price) from pizza_sales),2) Total_Percentage
from pizza_sales
group by pizza_category;

--Q.C4 Percentage of sales by pizza category
select pizza_size, round(sum(total_price),2) Total_Sales,
round(sum(total_price) * 100/(select sum(total_price) from pizza_sales),2) Total_Percentage
from pizza_sales
group by pizza_size;

--Q.C5 Total Pizza Sold by Pizza Category:
select pizza_category,sum(quantity) Total_Quantity
from pizza_sales
group by pizza_category;

--Q.C5 Top 5 Best Sellers by Revenue, Total Quantity & Total Order:
select top 5 pizza_name, round(sum(total_price),2) Total_Revenue,
sum(quantity) Total_Quantity,
count(distinct order_id) Total_Orders
from pizza_sales
group by pizza_name
order by Total_Revenue desc;

--Q.C5 Bottom 5 worst Sellers by Revenue, Total Quantity & Total Order:
select top 5 pizza_name, round(sum(total_price),2) Total_Revenue,
sum(quantity) Total_Quantity,
count(distinct order_id) Total_Orders
from pizza_sales
group by pizza_name
order by Total_Revenue asc;