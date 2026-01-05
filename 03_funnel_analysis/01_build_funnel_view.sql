-- PURPOSE: Build a clean funnel view per user
-- AUTHOR: Ebenezer Uzochukwu
-- NOTES: Calculates user progress through page_view → purchase stages
-- Drop view if exists
IF OBJECT_ID('dbo.vw_funnel_valid', 'V') IS NOT NULL
    DROP VIEW dbo.vw_funnel_valid;
GO

CREATE VIEW dbo.vw_funnel_valid AS
WITH stage_times AS (
    SELECT
        user_id,
        MIN(CASE WHEN event_type = 'page_view' THEN event_timestamp END) AS page_view_time,
        MIN(CASE WHEN event_type = 'product_view' THEN event_timestamp END) AS product_view_time,
        MIN(CASE WHEN event_type = 'add_to_cart' THEN event_timestamp END) AS add_to_cart_time,
        MIN(CASE WHEN event_type = 'signup' THEN event_timestamp END) AS signup_time,
        MIN(CASE WHEN event_type = 'checkout' THEN event_timestamp END) AS checkout_time,
        MIN(CASE WHEN event_type = 'purchase' THEN event_timestamp END) AS purchase_time
    FROM dbo.Events
    GROUP BY user_id
)
SELECT
    user_id,
    CASE WHEN page_view_time IS NOT NULL THEN 1 ELSE 0 END AS page_view,
    CASE WHEN product_view_time > page_view_time THEN 1 ELSE 0 END AS product_view,
    CASE WHEN add_to_cart_time > product_view_time THEN 1 ELSE 0 END AS add_to_cart,
    CASE WHEN signup_time > add_to_cart_time THEN 1 ELSE 0 END AS signup,
    CASE WHEN checkout_time > signup_time THEN 1 ELSE 0 END AS checkout,
    CASE WHEN purchase_time > checkout_time THEN 1 ELSE 0 END AS purchase
FROM stage_times;
GO
