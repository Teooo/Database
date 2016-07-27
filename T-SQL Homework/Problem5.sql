CREATE PROC usp_withdrow(@acountId int = 1,@amount float = 40)
AS 
DECLARE @userAmount float 
SET @userAmount  = (SELECT balance
FROM  Acounts  
WHERE id = @acountId)
if(@amount > @userAmount)
BEGIN
      RAISERROR('Nedostaty4na nali4nost.', 16, 1)
      RETURN
    END
UPDATE Acounts
SET balance = @userAmount - @amount
WHERE id = @acountId

SELECT a.id,@userAmount as [Amount Before Withdrow],a.balance as [Balance after withdrow],a.personId,
p.personId,p.firstName +' '+ p.lastName as [Name]   
FROM Persons p JOIN Acounts a ON p.personId = a.personId
WHERE a.id = @acountId
GO
EXEC usp_withdrow 
GO
CREATE PROC usp_deposit(@acountId int = 1,@amount float = 40)
AS 
DECLARE @userAmount float 
SET @userAmount  = (SELECT balance
FROM  Acounts  
WHERE id = @acountId)

UPDATE Acounts
SET balance = @userAmount + @amount
WHERE id = @acountId

SELECT a.id,@userAmount as [Amount Before Deposit],a.balance as [Balance after deposit],a.personId,
p.personId,p.firstName +' '+ p.lastName as [Name]   
FROM Persons p JOIN Acounts a ON p.personId = a.personId
WHERE a.id = @acountId
GO
EXEC usp_deposit 2,50
