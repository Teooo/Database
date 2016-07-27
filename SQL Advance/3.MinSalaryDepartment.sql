SELECT FirstName + ' ' + LastName [Full Name],  Salary,d.Name
FROM Employees e
JOIN Departments d 
on e.DepartmentID = d.DepartmentID
WHERE Salary = 
  (SELECT MIN(Salary) FROM Employees 
   WHERE DepartmentID = e.DepartmentID)
ORDER BY e.DepartmentID
