USE ecomerce_sales;

-- Combined Analysis: Top 5 Products by Sales Revenue and Quantity Sold
WITH ProductSales AS (
    SELECT 
        p.product_id,
        p.product_category AS category,
        SUM(oi.price * oi.order_item_id) AS total_revenue,
        SUM(oi.order_item_id) AS total_quantity_sold
    FROM 
        order_items oi
    JOIN 
        products p ON oi.product_id = p.product_id
    GROUP BY 
        p.product_id, p.product_category
)
SELECT 
    p.product_id,
    p.category,
    p.total_revenue,
    p.total_quantity_sold,
    RANK() OVER (ORDER BY p.total_revenue DESC) AS revenue_rank,
    RANK() OVER (ORDER BY p.total_quantity_sold DESC) AS quantity_rank
FROM 
    Products p
WHERE 
    RANK() OVER (ORDER BY p.total_revenue DESC) <= 5
    OR RANK() OVER (ORDER BY p.total_quantity_sold DESC) <= 5;
