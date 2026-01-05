-- PURPOSE: Calculate drop-offs per funnel step for Power BI
-- AUTHOR: Ebenezer Uzochukwu
-- NOTES: Drop-offs = users who did not progress to the next stage
-- DATA SOURCE: dbo.funnel_clean

SELECT 'Page View → Product View' AS funnel_step,
       SUM(drop_page_to_product) AS drop_off_users,
       CAST(SUM(drop_page_to_product)*1.0/NULLIF(SUM(page_view),0) AS DECIMAL(5,2)) AS drop_off_rate
FROM dbo.funnel_clean
UNION ALL
SELECT 'Product View → Add to Cart',
       SUM(drop_product_to_cart),
       CAST(SUM(drop_product_to_cart)*1.0/NULLIF(SUM(product_view),0) AS DECIMAL(5,2))
FROM dbo.funnel_clean
UNION ALL
SELECT 'Add to Cart → Signup',
       SUM(drop_cart_to_signup),
       CAST(SUM(drop_cart_to_signup)*1.0/NULLIF(SUM(add_to_cart),0) AS DECIMAL(5,2))
FROM dbo.funnel_clean
UNION ALL
SELECT 'Signup → Checkout',
       SUM(drop_signup_to_checkout),
       CAST(SUM(drop_signup_to_checkout)*1.0/NULLIF(SUM(signup),0) AS DECIMAL(5,2))
FROM dbo.funnel_clean
UNION ALL
SELECT 'Checkout → Purchase',
       SUM(drop_checkout_to_purchase),
       CAST(SUM(drop_checkout_to_purchase)*1.0/NULLIF(SUM(checkout),0) AS DECIMAL(5,2))
FROM dbo.funnel_clean;
