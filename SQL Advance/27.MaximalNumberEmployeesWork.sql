SELECT TOP 1
        *
FROM (SELECT
        t.Name,
        COUNT(*) AS [NUMBER OF Employees]
FROM Employees e
JOIN Addresses a
        ON e.AddressID = a.AddressID
JOIN Towns t
        ON a.TownID = t.TownID
GROUP BY t.Name) TownsAndNumberOfEmployees
ORDER BY TownsAndNumberOfEmployees.[NUMBER OF Employees] DESC
 