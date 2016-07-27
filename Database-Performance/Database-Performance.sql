--01 Your task is to create a table in SQL Server with 
--10 000 000 entries (date + text). Search in the table by date range. Check the speed (without caching).
CREATE TABLE Games(
	Id int IDENTITY,
	Description nvarchar(40) NOT NULL,
	GameDate datetime NOT NULL,
	CONSTRAINT PK_Id_Games PRIMARY KEY(Id)
)
GO

BEGIN TRANSACTION
DECLARE @index int,
		@description nvarchar(40);
SET @index = 0;
SET	@description = 'Test description...';

WHILE @index < 10000000
BEGIN
	INSERT INTO Games(Description, GameDate)
		VALUES(@description, DATEADD(MINUTE, @index, GETDATE()))	

	SET @index = @index + 1
END
COMMIT TRANSACTION
GO

-- clear cache
DBCC DROPCLEANBUFFERS;

SET STATISTICS IO  ON
SET STATISTICS TIME  ON

SELECT * FROM Games
WHERE GameDate BETWEEN GETDATE() AND DATEADD(HOUR, 5, GETDATE())

--02.Your task is to add an index to speed-up the search by date. Test the search speed (after cleaning the cache).
--You should submit a SQL file with queries and screenshot of speed comparison as a part of your homework

CREATE INDEX IX_Games_GameDate
ON Games (GameDate)

-- clear cache
DBCC DROPCLEANBUFFERS;

SET STATISTICS IO  ON
SET STATISTICS TIME  ON

SELECT * FROM Games
WHERE GameDate BETWEEN GETDATE() AND DATEADD(HOUR, 5, GETDATE())

--03 
-- Create the table

CREATE TABLE games (
    
	id int NOT NULL AUTO_INCREMENT,

	date datetime NOT NULL,

	description varchar(50) NOT NULL,

	PRIMARY KEY (id, date)
)

PARTITION BY RANGE( YEAR(date) ) (

	PARTITION till1990 VALUES LESS THAN (1990),

	PARTITION till2000 VALUES LESS THAN (2000),

	PARTITION till2010 VALUES LESS THAN (2010),

	PARTITION tilltoday VALUES LESS THAN MAXVALUE
);



-- Create stored procedure to insert test data

DELIMITER //



CREATE PROCEDURE insert_test_games_data () 

BEGIN



DECLARE while_index int DEFAULT 0;

DECLARE	start_date datetime;


SET while_index = 0;

SET start_date = STR_TO_DATE('19850708', '%Y%m%d %h%i');



START TRANSACTION;



WHILE while_index < 1000000 DO
	
	INSERT INTO games(date, description)
	
	VALUES(date_add(start_date, INTERVAL while_index hour), 'my description...');


	SET while_index = while_index + 1;

END WHILE;



COMMIT;


END; 

//


DELIMITER ;


-- Call the procedure



CALL insert_test_games_data()



-- Reset the cache

RESET QUERY CACHE;



-- Select rows from single partition

SELECT id, date, description

FROM games

WHERE date BETWEEN '1991-06-06' AND '1996-06-06'




-- Reset the cache

RESET QUERY CACHE;


-- Select rows from multiple partitions

SELECT id, date, description 

FROM games

WHERE date BETWEEN '1997-06-06' AND '2002-06-06'



-- Add index to date column

ALTER TABLE `games` 

ADD INDEX `ind_date` (`date`)



-- Reset the cache

RESET QUERY CACHE;


-- Select rows from single partition

SELECT id, date, description

FROM games

WHERE date BETWEEN '1991-06-06' AND '1996-06-06'




-- Reset the cache

RESET QUERY CACHE;


-- Select rows from multiple partitions

SELECT id, date, description 

FROM games

WHERE date BETWEEN '1997-06-06' AND '2002-06-06'


