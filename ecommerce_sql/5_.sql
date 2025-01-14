use ecomerce_sales;
--  Average Delivery Time by Region

WITH delivery_time AS (
    SELECT
        o.customer_id,
        DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) AS delivery_time
    FROM
        orders o
    WHERE
        o.order_status = 'delivered'
        AND o.order_delivered_customer_date IS NOT NULL
)
SELECT
    c.customer_state AS region,
    AVG(d.delivery_time) AS avg_delivery_time
FROM
    delivery_time d
JOIN
    customers c
    ON d.customer_id = c.customer_id
GROUP BY
    c.customer_state
ORDER BY
    avg_delivery_time ASC;
