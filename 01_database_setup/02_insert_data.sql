-- PURPOSE: Insert raw/messy dataset for marketing funnel analysis
-- AUTHOR: Ebenezer Uzochukwu
-- DATA: 1000+ users/events simulating real-life marketing interactions
;WITH Numbers AS (
    SELECT TOP 1200 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects a CROSS JOIN sys.objects b
)
INSERT INTO dbo.Users (
    first_name,
    last_name,
    email,
    state,
    signup_date,
    device_type,
    acquisition_channel
)
SELECT
    CHOOSE(ABS(CHECKSUM(NEWID())) % 10 + 1,
        'john','JANE','mike','SARAH','alex','Chris','emily','ROB','anna',''
    ),
    CHOOSE(ABS(CHECKSUM(NEWID())) % 7 + 1,
        'smith','DOE','johnson','Brown','lee','WILSON',''
    ),
    CASE
        WHEN RAND(CHECKSUM(NEWID())) < 0.08 THEN NULL
        WHEN RAND(CHECKSUM(NEWID())) < 0.15 THEN CONCAT('user', n, '@gmail')
        ELSE CONCAT('user', n, '@gmail.com')
    END,
    CHOOSE(ABS(CHECKSUM(NEWID())) % 17 + 1,
        'CA','California','NY','New York','TX','Texas',
        'FL','Florida','IL','Illinois','WA','washington',
        'NJ','New Jersey','PA','',NULL
    ),
    DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 180, GETDATE()),
    CHOOSE(ABS(CHECKSUM(NEWID())) % 5 + 1,
        'mobile','desktop','tablet','unknown',NULL
    ),
    CHOOSE(ABS(CHECKSUM(NEWID())) % 6 + 1,
        'paid_search','organic','referral','social','email',NULL
    )
FROM Numbers;

