SELECT
        d.Name AS [Department Name],
        e.JobTitle AS [Job Title],
        AVG(Salary) AS [Average Salary]
FROM Employees e
JOIN Departments d
        ON e.DepartmentID = d.DepartmentID
GROUP BY        d.Name,
                        e.JobTitle