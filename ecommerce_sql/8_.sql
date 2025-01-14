--  Query for Monthly Sales Trend (Last Two Years)

SELECT
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS month,
    SUM(p.payment_value) AS total_sales
FROM
    orders o
JOIN
    payments p
    ON o.order_id = p.order_id
WHERE
    o.order_status = 'delivered'
GROUP BY
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m')
ORDER BY
    month ASC;
