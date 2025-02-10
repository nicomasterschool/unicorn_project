--1. How many customers do we have in the data?
SELECT COUNT(distinct customer_id) num_customers
FROM customers


--What was the city with the most profit for the company in 2015?
SELECT 
			o.shipping_city,
      EXTRACT(YEAR FROM o.order_date) AS sales_year,
      SUM(od.order_profits) total_profit
FROM orders o
LEFT JOIN order_details od ON o.order_id = od.order_id
WHERE EXTRACT(YEAR FROM o.order_date) = '2015'
GROUP BY o.shipping_city,sales_year
ORDER BY total_profit DESC
LIMIT 1