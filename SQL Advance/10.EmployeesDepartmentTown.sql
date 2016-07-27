SELECT t.Name [TOWN],d.Name [Department],COUNT(e.EmployeeID) as [Emp Count] FROM  Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID 
JOIN Addresses a
ON e.AddressID = a.AddressID
JOIN Towns t
ON a.TownID = t.TownID
GROUP BY t.Name , d.Name
ORDER BY d.Name