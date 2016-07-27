CREATE TABLE Users
(
        Id INT PRIMARY KEY IDENTITY NOT NULL,
        Username VARCHAR(100) NOT NULL UNIQUE,
        Password VARCHAR(100),
        FullName nvarchar(100) NULL,
        LastLoggedIn datetime,
        CONSTRAINT check_Password CHECK (LEN(Password) > 5)
)
GO