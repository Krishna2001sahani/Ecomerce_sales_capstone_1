-- Identifying Regions or Products with the Highest Canceled Rates
--       Regions with the Highest Canceled Rates
SELECT
    c.customer_state AS region,
    COUNT(CASE WHEN o.order_status = 'canceled' THEN 1 END) * 100.0 / COUNT(*) AS cancellation_rate
FROM
    orders o
JOIN
    customers c
    ON o.customer_id = c.customer_id
GROUP BY
    c.customer_state
ORDER BY
    cancellation_rate DESC
LIMIT 10;
