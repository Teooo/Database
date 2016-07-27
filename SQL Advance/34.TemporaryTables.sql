DECLARE @temporaryEmployeesProjTable TABLE
(
        EmployeeID INT NOT NULL,
        ProjectID INT NOT NULL
)
 
INSERT INTO @temporaryEmployeesProjTable
        SELECT
                EmployeeID,
                ProjectID
        FROM EmployeesProjects
 
DROP TABLE EmployeesProjects
 
CREATE TABLE EmployeesProjects
(
        EmployeeID INT NOT NULL,
        ProjectID INT NOT NULL
)
INSERT INTO EmployeesProjects
        SELECT
                *
        FROM @temporaryEmployeesProjTable
GO