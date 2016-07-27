SELECT e.FirstName + ' ' + e.LastName AS 'Employees Full Name' , a.FirstName + ' ' + a.LastName AS 'Manager Full Name'
FROM Employees e JOIN Employees a ON a.ManagerID = e.EmployeeID