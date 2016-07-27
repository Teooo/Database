sp_configure 'clr enabled', 1
GO
RECONFIGURE
GO
CREATE ASSEMBLY 
--assembly name for references from SQL script
SqlRegularExpressions 
-- assembly name and full path to assembly dll,
-- SqlRegularExpressions in this case
from 'C:\SQL Server\SqlRegularExpression_AssemblyDLL_SQLScripts_Sources\SqlRegularExpressions\SqlRegularExpressions\bin\Release\SqlRegularExpressions.dll' 
WITH PERMISSION_SET = SAFE


GO

CREATE FUNCTION RegExpLike(@Text nvarchar(max), @Pattern nvarchar(255)) RETURNS BIT
--function external name
AS EXTERNAL NAME SqlRegularExpressions.SqlRegularExpressions.[Like]


GO

select Name from Towns
where 1 = dbo.RegExpLike(LOWER(Name), 's[a-z]+')




























