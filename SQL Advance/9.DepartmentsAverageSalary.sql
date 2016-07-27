SELECT d.Name as [Department], AVG(e.Salary) as [Average Salary] FROM Employees e, Departments d
WHERE e.EmployeeID = d.DepartmentID
GROUP BY d.Name