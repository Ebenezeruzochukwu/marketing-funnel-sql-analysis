-- PURPOSE: Aggregate overall funnel counts for Power BI visuals
-- AUTHOR: Ebenezer Uzochukwu
-- NOTES: Counts users at each stage from page view to purchase
-- DATA SOURCE: dbo.funnel_clean

SELECT
    SUM(page_view) AS page_view_users,
    SUM(product_view) AS product_view_users,
    SUM(add_to_cart) AS add_to_cart_users,
    SUM(signup) AS signup_users,
    SUM(checkout) AS checkout_users,
    SUM(purchase) AS purchase_users
FROM dbo.funnel_clean;
