SELECT e.FirstName,e.LastName, e.Salary FROM Employees e 
WHERE e.Salary <= (SELECT MIN(e.Salary)+MIN(e.Salary) / 10 FROM Employees e)
