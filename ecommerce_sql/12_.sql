-- Calculate Month-to-Date (MTD) Sales Metrics
-- To calculate MTD sales, use the cumulative sum of sales within the same month.

SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    DATE(o.order_purchase_timestamp) AS order_date,
    SUM(p.payment_value) AS daily_sales,
    SUM(SUM(p.payment_value)) OVER (
        PARTITION BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')
        ORDER BY DATE(o.order_purchase_timestamp)
    ) AS mtd_sales
FROM
    orders o
JOIN
    payments p
    ON o.order_id = p.order_id
WHERE
    o.order_status = 'delivered'
GROUP BY
    month, order_date
ORDER BY
    month, order_date;
