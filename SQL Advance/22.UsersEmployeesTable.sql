INSERT INTO Users (UserName, Password, FullName, LastLoggedIn, GroupId)
        SELECT
                LOWER(LEFT(FirstName, 1) + LastName) + CAST(EmployeeID AS NVARCHAR(10)),
                LOWER(LEFT(FirstName, 1) + LastName) + '123',
                FirstName + ' ' + LastName,
                NULL,
                2
        FROM Employees
GO