BEGIN TRAN
DELETE Employees
WHERE DepartmentID = (SELECT
                DepartmentID
        FROM Departments
        WHERE Name = 'Sales')
ROLLBACK TRAN