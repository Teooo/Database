CREATE VIEW vUsersLoggedToday AS
SELECT
        *
FROM Users
WHERE DAY(LastLoggedIn) = DAY(GETDATE())
GO