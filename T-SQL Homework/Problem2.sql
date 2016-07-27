CREATE PROC usp_amountChecker(@amount int = 160)
AS 
SELECT p.firstName,p.lastName,a.balance
FROM Persons p 
JOIN Acounts a on p.personId = a.personId
WHERE a.balance > @amount
GO

EXEC usp_amountChecker 