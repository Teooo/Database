SELECT e.FirstName, e.LastName, m.FirstName + ' ' + m.LastName AS [Manager Name]
FROM Employees e
	RIGHT OUTER JOIN Employees m
		ON e.ManagerID = m.EmployeeID

SELECT e.FirstName, e.LastName, m.FirstName + ' ' + m.LastName AS [Manager Name]
FROM Employees e
	LEFT OUTER JOIN Employees m
		ON e.ManagerID = m.EmployeeID