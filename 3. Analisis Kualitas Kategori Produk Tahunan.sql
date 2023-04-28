-- TASK 3
-- Annual Product Category Quality Analysis

-- 1. Total Revenue by Year
WITH rvn AS (
	select
		year,
		total_price + total_shipping as revenue
	from(
		select date_part('year', o.order_purchase_timestamp) as year,
			   sum(oi.price) as total_price,
			   sum(oi.freight_value) as total_shipping
		from orders as o
		join order_items as oi on o.order_id = oi.order_id
		where o.order_status = 'delivered'
		group by 1
		order by 1
	) tempo
	group by 1, 2
	order by 1
), 

-- 2. Amount canceled Orders by Year
cncl AS (
	select date_part('year', order_purchase_timestamp) as year,
	   	   count(order_status) as total_canceled
	from orders
	where order_status = 'canceled'
	group by 1
	order by 1
),

-- 3. Highest Revenue Categorik Product Name by Year
hr as (
	select
		year,
		product_category_name,
		revenue,
		rank() over(partition by year order by revenue desc) as highest_revenue
	from (
		select
			date_part('year', o.order_purchase_timestamp) as year,
			pr.product_category_name,
			sum(oi.price + oi.freight_value) as revenue
		from order_items as oi
		join orders as o on o.order_id = oi.order_id
		join products as pr on oi.product_id = pr.product_id
		where o.order_status = 'delivered'
		group by 1, 2
	) tempo
	group by 1, 2, 3
	order by 1
),


-- 4. Highest Canceled Order of Categorik Product Name by Year
hc AS(
	select
		year,
		product_category_name,
		canceled,
		rank() over(partition by year order by canceled desc) as highest_canceled
	from (
		select
			date_part('year', o.order_purchase_timestamp) as year,
			pr.product_category_name,
			count(o.order_status) as canceled
		from orders as o
		join order_items as oi on o.order_id = oi.order_id
		join products as pr on oi.product_id = pr.product_id
		where o.order_status = 'canceled'
		group by 1, 2
	) tempo
	group by 1, 2, 3
)

-- 5. Result
select 
	r.year, 
	r.revenue, 
	hr.product_category_name as highest_revenue,  
	cn.total_canceled,
	hc.product_category_name as most_canceled
from rvn as r
join cncl as cn on r.year = cn.year
join hr on r.year = hr.year
join hc on r.year = hc.year
where hr.highest_revenue < 2 and hc.highest_canceled < 2;
