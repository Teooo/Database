INSERT INTO WorkHours (EmployeeId, DATE, Task, Hours)
        VALUES (10, GETDATE(), 'Random task', 11)
 
INSERT INTO WorkHours (EmployeeId, DATE, Task, Hours)
        VALUES (11, GETDATE(), 'yeah, yeah, blabla', 34)
 
DELETE WorkHours
WHERE EmployeeId = 11
 
UPDATE WorkHours
SET Task = 'updated task'
WHERE EmployeeId = 11
 
SELECT
        *
FROM WorkHoursLogs
 
--32. Start a database transaction, delete all employees from the 'Sales' department along
--with all dependent records from the pother tables. At the end rollback the transaction.
BEGIN TRAN
DELETE Employees
WHERE DepartmentID = (SELECT
                DepartmentID
        FROM Departments
        WHERE Name = 'Sales')
ROLLBACK TRAN