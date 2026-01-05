-- PURPOSE: Funnel counts aggregated by acquisition channel
-- AUTHOR: Ebenezer Uzochukwu
-- NOTES: Helps identify which marketing channels perform best at each stage
-- DATA SOURCE: dbo.funnel_clean

SELECT
    acquisition_channel,
    SUM(page_view) AS page_view_users,
    SUM(product_view) AS product_view_users,
    SUM(add_to_cart) AS add_to_cart_users,
    SUM(signup) AS signup_users,
    SUM(checkout) AS checkout_users,
    SUM(purchase) AS purchase_users
FROM dbo.funnel_clean
GROUP BY acquisition_channel
ORDER BY acquisition_channel;
