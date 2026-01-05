-- PURPOSE: Explore the raw dataset to understand event distribution
-- AUTHOR: Ebenezer Uzochukwu
-- NOTES: Aggregates events by type, state, acquisition_channel, and device_type

-- Count of events by type
SELECT event_type, COUNT(*) AS event_count
FROM dbo.Events
GROUP BY event_type
ORDER BY event_count DESC;

-- Count of users by state
SELECT state, COUNT(*) AS user_count
FROM dbo.Users
GROUP BY state
ORDER BY user_count DESC;

-- Count of users by acquisition channel
SELECT acquisition_channel, COUNT(*) AS user_count
FROM dbo.Users
GROUP BY acquisition_channel
ORDER BY user_count DESC;

-- Count of users by device type
SELECT device_type, COUNT(*) AS user_count
FROM dbo.Users
GROUP BY device_type
ORDER BY user_count DESC;
