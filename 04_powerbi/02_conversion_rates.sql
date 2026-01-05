-- PURPOSE: Calculate conversion rates for each funnel step
-- AUTHOR: Ebenezer Uzochukwu
-- NOTES: Conversion rate = users progressing to next stage / users at previous stage
-- DATA SOURCE: dbo.funnel_clean

SELECT
    CAST(SUM(product_view) * 1.0 / NULLIF(SUM(page_view),0) AS DECIMAL(5,2)) AS page_to_product_rate,
    CAST(SUM(add_to_cart) * 1.0 / NULLIF(SUM(product_view),0) AS DECIMAL(5,2)) AS product_to_cart_rate,
    CAST(SUM(signup) * 1.0 / NULLIF(SUM(add_to_cart),0) AS DECIMAL(5,2)) AS cart_to_signup_rate,
    CAST(SUM(checkout) * 1.0 / NULLIF(SUM(signup),0) AS DECIMAL(5,2)) AS signup_to_checkout_rate,
    CAST(SUM(purchase) * 1.0 / NULLIF(SUM(checkout),0) AS DECIMAL(5,2)) AS checkout_to_purchase_rate
FROM dbo.funnel_clean;
