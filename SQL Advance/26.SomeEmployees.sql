SELECT
        d.Name AS [Department Name],
        e.JobTitle AS [Job Title],
        MIN(e.FirstName) AS [FIRST Name],
        MIN(Salary) AS [Minimum Salary]
FROM Employees e
JOIN Departments d
        ON e.DepartmentID = d.DepartmentID
GROUP BY        d.Name,
                        e.JobTitle
ORDER BY d.Name
 