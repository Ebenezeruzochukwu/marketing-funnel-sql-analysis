-- PURPOSE: Funnel drop-off analysis by acquisition channel
-- AUTHOR: Ebenezer Uzochukwu
-- NOTES: Shows which channels lose users at each step
-- DATA SOURCE: dbo.vw_funnel_valid + dbo.Users

SELECT
    u.acquisition_channel,
    'Page View → Product View' AS funnel_step,
    SUM(CASE WHEN f.page_view = 1 AND f.product_view = 0 THEN 1 ELSE 0 END) AS drop_off_users,
    CAST(SUM(CASE WHEN f.page_view = 1 AND f.product_view = 0 THEN 1 ELSE 0 END)*1.0/NULLIF(SUM(f.page_view),0) AS DECIMAL(5,2)) AS drop_off_rate
FROM dbo.vw_funnel_valid f
JOIN dbo.Users u ON f.user_id = u.user_id
GROUP BY u.acquisition_channel
UNION ALL
SELECT
    u.acquisition_channel,
    'Product View → Add to Cart',
    SUM(CASE WHEN f.product_view = 1 AND f.add_to_cart = 0 THEN 1 ELSE 0 END),
    CAST(SUM(CASE WHEN f.product_view = 1 AND f.add_to_cart = 0 THEN 1 ELSE 0 END)*1.0/NULLIF(SUM(f.product_view),0) AS DECIMAL(5,2))
FROM dbo.vw_funnel_valid f
JOIN dbo.Users u ON f.user_id = u.user_id
GROUP BY u.acquisition_channel
UNION ALL
SELECT
    u.acquisition_channel,
    'Add to Cart → Signup',
    SUM(CASE WHEN f.add_to_cart = 1 AND f.signup = 0 THEN 1 ELSE 0 END),
    CAST(SUM(CASE WHEN f.add_to_cart = 1 AND f.signup = 0 THEN 1 ELSE 0 END)*1.0/NULLIF(SUM(f.add_to_cart),0) AS DECIMAL(5,2))
FROM dbo.vw_funnel_valid f
JOIN dbo.Users u ON f.user_id = u.user_id
GROUP BY u.acquisition_channel
UNION ALL
SELECT
    u.acquisition_channel,
    'Signup → Checkout',
    SUM(CASE WHEN f.signup = 1 AND f.checkout = 0 THEN 1 ELSE 0 END),
    CAST(SUM(CASE WHEN f.signup = 1 AND f.checkout = 0 THEN 1 ELSE 0 END)*1.0/NULLIF(SUM(f.signup),0) AS DECIMAL(5,2))
FROM dbo.vw_funnel_valid f
JOIN dbo.Users u ON f.user_id = u.user_id
GROUP BY u.acquisition_channel
UNION ALL
SELECT
    u.acquisition_channel,
    'Checkout → Purchase',
    SUM(CASE WHEN f.checkout = 1 AND f.purchase = 0 THEN 1 ELSE 0 END),
    CAST(SUM(CASE WHEN f.checkout = 1 AND f.purchase = 0 THEN 1 ELSE 0 END)*1.0/NULLIF(SUM(f.checkout),0) AS DECIMAL(5,2))
FROM dbo.vw_funnel_valid f
JOIN dbo.Users u ON f.user_id = u.user_id
GROUP BY u.acquisition_channel
ORDER BY acquisition_channel, funnel_step;
