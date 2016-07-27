SELECT e.FirstName + ' ' + e.LastName AS 'Full Name' , a.AddressText ,m.FirstName + ' ' + m.LastName AS 'Manager Name', c.AddressText AS 'Manager Address'
FROM Employees e 
JOIN Addresses a 
ON e.AddressID = a.AddressID
LEFT OUTER JOIN Employees m 
ON e.ManagerID = m.EmployeeID
JOIN Addresses c 
ON m.AddressID = c.AddressID