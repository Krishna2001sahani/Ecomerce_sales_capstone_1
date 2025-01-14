use ecomerce_sales;
--  Most Loyal Customers (Purchase Frequency and Total Spend)
SELECT 
    c.customer_id,
    c.customer_unique_id,
    COUNT(o.order_id) AS purchase_frequency,
    SUM(oi.price * oi.order_item_id) AS total_spend
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
    purchase_frequency DESC, total_spend DESC
LIMIT 10; -- Top 10 most loyal customers
