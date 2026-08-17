-- RETRIVE THE TOTAL NUMBER OF ORDDER PLACED 

select count(order_id) as total_orders from orders;

-- find the total  revenue generated from the pizza hut
select sum(price) as total_income from pizzas;

select 
round(sum(order_details.quantity*pizzas.price),2) as total_sales
from order_details join pizzas 
on order_details.pizza_id = pizzas.pizza_id;

-- identify highest price pizza

select pizza_types.name,pizzas.price
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;

-- identify most common pizza size order 

	select pizzas.size, count(order_details.order_details_id) as sum
	from pizzas join order_details
	on pizzas.pizza_id = order_details.pizza_id
	group by pizzas.size
	order by sum desc limit 1 ;
    
-- List the top 5 most ordered pizza types along with their quantities.

select pizza_types.name ,sum(order_details.quantity) as total
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by total desc limit 5;

-- Join the necessary tables to find the total quantity of each pizza category ordered
select pizza_types.category,sum(order_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details 
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category
order by quantity ;

-- Determine the distribution of orders by hour of the day
select * from orders;
select hour(order_time) , count(order_id) from orders
group by  hour(order_time);

-- category wise distribution of pizza types

select category , count(name) from pizza_types
group by category;

-- Group the orders by date and calculate the average number of pizzas ordered per day
select avg(quantity) from
(select orders.order_date , sum(order_details.quantity) as quantity
from orders join order_details
on orders.order_id = order_details.order_id
group by orders.order_date) as order_quantity;

-- top 3 order pizza based on revenue 

select pizza_types.name,
sum(order_details.quantity*pizzas.price) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by revenue desc limit 3;

-- calculate percentage contribution of each pizza type to total revenue

select pizza_types.category,
sum(order_details.quantity*pizzas.price) / (select 
sum(order_details.quantity*pizzas.price) as total_sales
from order_details join pizzas 
on pizzas.pizza_id = order_details.pizza_id) *100 as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category ;

-- analyse cumulative revenue generated over time
select order_date,
sum(revenue) over(order by order_date) as cumulative_revenue 
from
(select orders.order_date,
sum(order_details.quantity*pizzas.price)as revenue
from order_details join pizzas
on order_details.pizza_id = pizzas.pizza_id
join orders
on orders.order_id = order_details.order_id
group by orders.order_date ) as sales;

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select name, revenue from 
(select name , category, revenue,
rank() over(partition by category order by revenue desc)as rn
from
 (select pizza_types.category, pizza_types.name,
 sum(order_details.quantity * pizzas.price )as revenue
 from pizza_types join pizzas
 on pizza_types.pizza_type_id = pizzas.pizza_type_id
 join order_details
 on order_details.pizza_id = pizzas.pizza_id
 group by pizza_types.category,pizza_types.name )as a)as b 
 where rn<=3;
