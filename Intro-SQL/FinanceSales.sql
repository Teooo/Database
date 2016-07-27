SELECT e.FirstName, e.LastName, d.Name as DeptName,e.HireDate
FROM Employees e
  INNER JOIN Departments d
  ON (e.DepartmentId = d.DepartmentId
  AND e.HireDate > '1/1/1995' 
  AND e.HireDate < '12/31/2005'
  AND d.Name IN ('Sales', 'Finance'))