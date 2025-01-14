-- Additional Insights
-- To compare peak months across years, group by both year and month:

SELECT
    YEAR(order_purchase_timestamp) AS year,
    MONTH(order_purchase_timestamp) AS month,
    SUM(p.payment_value) AS total_sales
FROM
    orders o
JOIN
    payments p
    ON o.order_id = p.order_id
WHERE
    o.order_status = 'delivered'
GROUP BY
    YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY
    year, month;
