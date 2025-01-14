--  1. Rank Products Based on Sales Within Each Category
SELECT
    p.product_category,
    oi.product_id,
    SUM(oi.price) AS total_sales,
    RANK() OVER (PARTITION BY p.product_category ORDER BY SUM(oi.price) DESC) AS sales_rank
FROM
    order_items oi
JOIN
    products p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_category, oi.product_id
ORDER BY
    p.product_category, sales_rank;
