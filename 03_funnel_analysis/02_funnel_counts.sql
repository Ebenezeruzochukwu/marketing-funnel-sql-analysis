-- PURPOSE: Count users at each funnel stage
-- AUTHOR: Ebenezer Uzochukwu
-- NOTES: Prepares data for conversion rate and drop-off calculations
SELECT
    SUM(page_view) AS page_view_users,
    SUM(product_view) AS product_view_users,
    SUM(add_to_cart) AS add_to_cart_users,
    SUM(signup) AS signup_users,
    SUM(checkout) AS checkout_users,
    SUM(purchase) AS purchase_users
FROM dbo.vw_funnel_valid;
