--  Query for Seasonality Analysis (Peak Months)

SELECT
    DATE_FORMAT(order_purchase_timestamp, '%M') AS month,
    SUM(p.payment_value) AS total_sales
FROM
    orders o
JOIN
    payments p
    ON o.order_id = p.order_id
WHERE
    o.order_status = 'delivered'
GROUP BY
    DATE_FORMAT(order_purchase_timestamp, '%M')
ORDER BY
    total_sales DESC;
