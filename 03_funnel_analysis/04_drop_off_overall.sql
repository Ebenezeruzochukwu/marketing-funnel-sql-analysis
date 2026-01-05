-- PURPOSE: Calculate overall drop-offs per funnel step
-- AUTHOR: Ebenezer Uzochukwu
-- NOTES: Shows number of users lost at each stage
-- DATA SOURCE: dbo.vw_funnel_valid

SELECT 'Page View → Product View' AS funnel_step,
       SUM(CASE WHEN page_view = 1 AND product_view = 0 THEN 1 ELSE 0 END) AS drop_off_users,
       CAST(SUM(CASE WHEN page_view = 1 AND product_view = 0 THEN 1 ELSE 0 END)*1.0/NULLIF(SUM(page_view),0) AS DECIMAL(5,2)) AS drop_off_rate
FROM dbo.vw_funnel_valid
UNION ALL
SELECT 'Product View → Add to Cart',
       SUM(CASE WHEN product_view = 1 AND add_to_cart = 0 THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN product_view = 1 AND add_to_cart = 0 THEN 1 ELSE 0 END)*1.0/NULLIF(SUM(product_view),0) AS DECIMAL(5,2))
FROM dbo.vw_funnel_valid
UNION ALL
SELECT 'Add to Cart → Signup',
       SUM(CASE WHEN add_to_cart = 1 AND signup = 0 THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN add_to_cart = 1 AND signup = 0 THEN 1 ELSE 0 END)*1.0/NULLIF(SUM(add_to_cart),0) AS DECIMAL(5,2))
FROM dbo.vw_funnel_valid
UNION ALL
SELECT 'Signup → Checkout',
       SUM(CASE WHEN signup = 1 AND checkout = 0 THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN signup = 1 AND checkout = 0 THEN 1 ELSE 0 END)*1.0/NULLIF(SUM(signup),0) AS DECIMAL(5,2))
FROM dbo.vw_funnel_valid
UNION ALL
SELECT 'Checkout → Purchase',
       SUM(CASE WHEN checkout = 1 AND purchase = 0 THEN 1 ELSE 0 END),
       CAST(SUM(CASE WHEN checkout = 1 AND purchase = 0 THEN 1 ELSE 0 END)*1.0/NULLIF(SUM(checkout),0) AS DECIMAL(5,2))
FROM dbo.vw_funnel_valid;
