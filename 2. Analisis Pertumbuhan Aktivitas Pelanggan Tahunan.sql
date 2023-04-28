-- TASK 2
-- Annual Customer Activity Growth Analysis

-- 1. Calculate Monthly Active User (MAU) Average by Year

WITH mau as (
	select year, 
		   round(avg(mau), 2) as average_mau
	from (
		select date_part('year', o.order_purchase_timestamp) as year,
			date_part('month', o.order_purchase_timestamp) as month,
			count(distinct cs.customer_unique_id) as mau
		from orders as o
		join customers as cs
			 on cs.customer_id = o.customer_id
		group by 1, 2
	) tempo
	group by 1
	order by 1
	),

-- 2. Amount New Customer (First Order) by Year
new_customer as (
	select date_part('year', first_order) as year,
		   count(distinct customer_unique_id) as new_customers
	from(
		select cs.customer_unique_id,
			min(o.order_purchase_timestamp) as first_order
		from orders as o
		join customers as cs on cs.customer_id = o.customer_id
		group by 1
	) tempo
	group by 1
	order by 1
	),

-- 3. Amount Regular Customer (Repeat Order) by Year
repeat as (
	select year,
		   count(cstmr) as repeating_customers
	from (
		select cs.customer_unique_id,
			   count(1) as cstmr,
			   date_part('year', o.order_purchase_timestamp) as year
		from orders as o
		join customers as cs on cs.customer_id = o.customer_id
		group by 1, 3
		having count (1) > 1
	) tempo
	group by 1
	order by 1
),

-- 4. Average Order by Year
avg_freq as (
	select year,
		   round(avg(total_order), 2) as avg_orders_per_customers
	from (
		select cs.customer_unique_id, 
			   date_part('year', o.order_purchase_timestamp) as year,
			   count(1) as total_order
		from orders as o
		join customers as cs on cs.customer_id = o.customer_id
		group by 1, 2
	) tempo
	group by 1
	order by 1
)

-- 5. Result
select m.year, m.average_mau, nc.new_customers, r.repeating_customers, af.avg_orders_per_customers
from mau as m
join new_customer as nc on nc.year = m.year
join repeat as r on m.year = r.year
join avg_freq as af on m.year = af.year;
