-- PURPOSE: Funnel counts aggregated by device type
-- AUTHOR: Ebenezer Uzochukwu
-- NOTES: Helps identify devices where users drop off the most
-- DATA SOURCE: dbo.funnel_clean

SELECT
    device_type,
    SUM(page_view) AS page_view_users,
    SUM(product_view) AS product_view_users,
    SUM(add_to_cart) AS add_to_cart_users,
    SUM(signup) AS signup_users,
    SUM(checkout) AS checkout_users,
    SUM(purchase) AS purchase_users
FROM dbo.funnel_clean
GROUP BY device_type
ORDER BY device_type;
