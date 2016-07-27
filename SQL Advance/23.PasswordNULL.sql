UPDATE Users
SET Password = NULL
WHERE LastLoggedIn <= '2010-03-10'