use TSQLHomework
go
 
CREATE FUNCTION fn_interestCalc(@sum FLOAT,@interest FLOAT,@month FLOAT)RETURNS float
		
		AS
			BEGIN
				RETURN(@sum*(1+(@interest/12)*@month))
			END
		GO
	
SELECT dbo.fn_interestCalc(100,1.2,10) as [Amount with interest]

CREATE PROC [dbo].[usp_interestForOneMonth](@id int, @interest float)
AS 
DECLARE @amount float 
SET @amount  = (SELECT balance
FROM  Acounts  
 WHERE id = @id)
SELECT   a.id,a.balance,dbo.fn_interestCalc(@amount,@interest,1) as [Interest per month],a.personId,
p.personId,p.firstName +' '+ p.lastName as [Name]  
FROM Acounts a join Persons p
on a.personId = p.personId
WHERE a.id = @id