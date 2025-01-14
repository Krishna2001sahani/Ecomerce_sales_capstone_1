use ecomerce_sales;
-- Top 5 Best-Selling Products by Sales Revenue
SELECT 
    p.product_id,
    p.product_category AS category,
    SUM(oi.price * oi.order_item_id) AS total_revenue
FROM 
    order_items oi
JOIN 
    products p
ON 
    oi.product_id = p.product_id
GROUP BY 
    p.product_id, p.product_category
ORDER BY 
    total_revenue DESC
LIMIT 5;
