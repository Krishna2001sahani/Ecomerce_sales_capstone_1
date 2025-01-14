-- Query 2: Customers with the Highest AOV
SELECT 
    c.customer_id,
    c.customer_unique_id,
    SUM(oi.price * oi.order_item_id) / COUNT(DISTINCT o.order_id) AS average_order_value,
    SUM(oi.price * oi.order_item_id) AS total_spend,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM 
    customers c
JOIN 
    orders o
ON 
    c.customer_id = o.customer_id
JOIN 
    order_items oi
ON 
    o.order_id = oi.order_id
GROUP BY 
    c.customer_id, c.customer_unique_id
ORDER BY 
    average_order_value DESC
LIMIT 10; -- Top 10 customers with the highest AOV
