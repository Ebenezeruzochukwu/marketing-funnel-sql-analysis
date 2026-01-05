-- PURPOSE: Create Users and Events tables for marketing funnel analysis
-- AUTHOR: Ebenezer Uzochukwu
-- NOTES: Schema designed to simulate real-life messy marketing data
CREATE TABLE dbo.Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    state VARCHAR(50),
    signup_date DATETIME,
    device_type VARCHAR(20),
    acquisition_channel VARCHAR(30)
);

CREATE TABLE dbo.Events (
    event_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    session_id INT,
    event_type VARCHAR(30),
    event_timestamp DATETIME,
    CONSTRAINT FK_Events_Users FOREIGN KEY (user_id)
        REFERENCES dbo.Users(user_id),
    CONSTRAINT FK_Events_Sessions FOREIGN KEY (session_id)
        REFERENCES dbo.Sessions(session_id)
);

