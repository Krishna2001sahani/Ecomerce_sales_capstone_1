--  Products with the Highest Canceled Rates

SELECT
    oi.product_id,
    COUNT(CASE WHEN o.order_status = 'canceled' THEN 1 END) * 100.0 / COUNT(*) AS cancellation_rate
FROM
    order_items oi
JOIN
    orders o
    ON oi.order_id = o.order_id
GROUP BY
    oi.product_id
ORDER BY
    cancellation_rate DESC
LIMIT 10;
