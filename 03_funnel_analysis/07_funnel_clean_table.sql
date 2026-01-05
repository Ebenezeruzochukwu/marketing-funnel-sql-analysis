-- PURPOSE: Create a clean, reusable funnel table for Power BI
-- AUTHOR: Ebenezer Uzochukwu
-- NOTES: Combines funnel stages, drop-offs, acquisition_channel, and device_type
-- DATA SOURCE: dbo.vw_funnel_valid + dbo.Users

-- Drop existing table if exists
IF OBJECT_ID('dbo.funnel_clean', 'U') IS NOT NULL
    DROP TABLE dbo.funnel_clean;
GO

-- Create clean table
SELECT
    f.user_id,
    u.acquisition_channel,
    u.device_type,
    f.page_view,
    f.product_view,
    f.add_to_cart,
    f.signup,
    f.checkout,
    f.purchase,
    -- Drop-off flags
    CASE WHEN f.page_view = 1 AND f.product_view = 0 THEN 1 ELSE 0 END AS drop_page_to_product,
    CASE WHEN f.product_view = 1 AND f.add_to_cart = 0 THEN 1 ELSE 0 END AS drop_product_to_cart,
    CASE WHEN f.add_to_cart = 1 AND f.signup = 0 THEN 1 ELSE 0 END AS drop_cart_to_signup,
    CASE WHEN f.signup = 1 AND f.checkout = 0 THEN 1 ELSE 0 END AS drop_signup_to_checkout,
    CASE WHEN f.checkout = 1 AND f.purchase = 0 THEN 1 ELSE 0 END AS drop_checkout_to_purchase
INTO dbo.funnel_clean
FROM dbo.vw_funnel_valid f
JOIN dbo.Users u ON f.user_id = u.user_id;
GO

-- Quick sanity check
SELECT TOP 20 * FROM dbo.funnel_clean;
