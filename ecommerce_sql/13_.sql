--  Calculate Year-to-Date (YTD) Sales Metrics
SELECT
    YEAR(o.order_purchase_timestamp) AS year,
    DATE(o.order_purchase_timestamp) AS order_date,
    SUM(p.payment_value) AS daily_sales,
    SUM(SUM(p.payment_value)) OVER (
        PARTITION BY YEAR(o.order_purchase_timestamp)
        ORDER BY DATE(o.order_purchase_timestamp)
    ) AS ytd_sales
FROM
    orders o
JOIN
    payments p
    ON o.order_id = p.order_id
WHERE
    o.order_status = 'delivered'
GROUP BY
    year, order_date
ORDER BY
    year, order_date;
