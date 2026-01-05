-- PURPOSE: Verify user activity at each funnel stage
-- AUTHOR: Ebenezer Uzochukwu
-- NOTES: Helps identify missing events and prepare for funnel analysis
-- Check first event per user
SELECT user_id,
       MIN(event_type) AS first_event,
       COUNT(*) AS total_events
FROM dbo.Events
GROUP BY user_id
ORDER BY total_events DESC;

-- Users with missing funnel stages
SELECT u.user_id,
       MAX(CASE WHEN e.event_type = 'page_view' THEN 1 ELSE 0 END) AS page_view,
       MAX(CASE WHEN e.event_type = 'product_view' THEN 1 ELSE 0 END) AS product_view,
       MAX(CASE WHEN e.event_type = 'add_to_cart' THEN 1 ELSE 0 END) AS add_to_cart,
       MAX(CASE WHEN e.event_type = 'signup' THEN 1 ELSE 0 END) AS signup,
       MAX(CASE WHEN e.event_type = 'checkout' THEN 1 ELSE 0 END) AS checkout,
       MAX(CASE WHEN e.event_type = 'purchase' THEN 1 ELSE 0 END) AS purchase
FROM dbo.Users u
LEFT JOIN dbo.Events e ON u.user_id = e.user_id
GROUP BY u.user_id
ORDER BY u.user_id;

