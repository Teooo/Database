CREATE TABLE WorkHours
(
        Id INT PRIMARY KEY IDENTITY NOT NULL,
                EmployeeId INT FOREIGN KEY REFERENCES Employees(EmployeeId)  NOT NULL,
        DATE datetime NULL,
        Task nvarchar(150) NOT NULL,
        Hours INT NOT NULL,
        Comments ntext NULL
 
)
GO