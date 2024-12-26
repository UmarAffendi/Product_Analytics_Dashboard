WITH cte AS (
  SELECT
    a.product_id,
    a.product_name,
    a.category,
    a.cost_price,
    a.sale_price,
    a.brand,
    a.description,
    a.image_url,
    b.transaction_date,
    b.customer_type,
    b.country,
    b.discount_band,
    b.units_sold,
    (sale_price * units_sold) AS revenue,
    (cost_price * units_sold) AS total_cost,
    TO_CHAR(TO_DATE(b.transaction_date::TEXT, 'YYYY-DD-MM'), 'FMMonth') AS month,
    TO_CHAR(TO_DATE(b.transaction_date::TEXT, 'YYYY-DD-MM'), 'YYYY') AS year
  FROM product_data a
  JOIN product_sales b
  ON a.product_id = b.product_id
)

SELECT *,
(1 - discount * 1.0/100) * revenue AS discount_revenue
FROM cte a
JOIN discount_data b
ON TRIM(LOWER(a.discount_band)) = TRIM(LOWER(b.discount_band)) AND a.month = b.month