CREATE TABLE Logs(
LogsId INT PRIMARY KEY IDENTITY,
AcountId INT FOREIGN KEY REFERENCES Acounts(id)  NULL,
OldBalance INT NULL,
NewBalance INT NULL,
Operation NVARCHAR(50) NOT NULL)

GO

CREATE TRIGGER tr_deleteBalance ON Acounts FOR DELETE
AS
	DECLARE @operation NVARCHAR = 'DELETE'
	BEGIN
		INSERT INTO Logs(AcountId,OldBalance,Operation)
		SELECT d.id,d.balance,@operation
		FROM deleted d
		 
	END
GO

CREATE TRIGGER tr_updateBalance ON Acounts FOR UPDATE
AS
	DECLARE @operation NVARCHAR = 'UPDATE'
	BEGIN
		INSERT INTO Logs(AcountId,OldBalance,NewBalance,Operation)
		SELECT d.id,d.balance,i.balance,@operation
		FROM deleted d, inserted i
		 
	END
GO

CREATE TRIGGER tr_insertBalance ON Acounts FOR INSERT
AS
	DECLARE @operation NVARCHAR = 'INSERT'
	BEGIN
		INSERT INTO Logs(AcountId,NewBalance,Operation)
		SELECT i.id,i.balance,@operation
		FROM inserted i
		 
	END
GO

