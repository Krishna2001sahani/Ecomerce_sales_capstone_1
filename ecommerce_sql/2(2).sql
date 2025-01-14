use ecomerce_sales;
-- Top 5 Best-Selling Products by Quantity Sold
SELECT 
    p.product_id,
    p.product_category AS category,
    SUM(oi.order_item_id) AS total_quantity_sold
FROM 
    order_items oi
JOIN 
    products p
ON 
    oi.product_id = p.product_id
GROUP BY 
    p.product_id, p.product_category
ORDER BY 
    total_quantity_sold DESC
LIMIT 5;

