SELECT m.FirstName [FirstName],m.LastName[Last Name], COUNT(*) [Emp Count]
FROM Employees e JOIN Employees m
    ON e.ManagerID = m.EmployeeID
WHERE e.EmployeeID = e.EmployeeID
GROUP BY m.FirstName,m.LastName
HAVING COUNT(*) = 5