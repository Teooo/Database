CREATE TABLE Persons (
personId INT PRIMARY KEY IDENTITY,
firstName NVARCHAR(50) NOT NULL,
lastName NVARCHAR(50) NOT NULL,
SSN NVARCHAR(50) NOT NULL)

GO

CREATE TABLE Acounts(
id INT PRIMARY KEY IDENTITY,
balance INT NOT NULL,
personId INT FOREIGN KEY REFERENCES Persons(personId) NOT NULL)

GO 
INSERT INTO Persons(firstName,lastName,SSN) VALUES('Pesho','Peshev','ssn1')
INSERT INTO Persons(firstName,lastName,SSN) VALUES('Gosho','Goshev','ssn2')
INSERT INTO Persons(firstName,lastName,SSN) VALUES('Stamat','Stamatov','ssn3')
INSERT INTO Persons(firstName,lastName,SSN) VALUES('Dinko','Dinkov','ssn4')
INSERT INTO Persons(firstName,lastName,SSN) VALUES('BaiIvan','Ivanov','ssn5')

INSERT INTO Acounts(balance,personId) VALUES(200,1)
INSERT INTO Acounts(balance,personId) VALUES(300,2)
INSERT INTO Acounts(balance,personId) VALUES(500,2)
INSERT INTO Acounts(balance,personId) VALUES(100,3)
INSERT INTO Acounts(balance,personId) VALUES(500,4)
INSERT INTO Acounts(balance,personId) VALUES(250,5)

GO

CREATE PROC dbo.usp_printFullname 

AS
	SELECT firstName +' '+lastName AS [Full name]
	FROM Persons

GO

EXEC dbo.usp_printFullname 