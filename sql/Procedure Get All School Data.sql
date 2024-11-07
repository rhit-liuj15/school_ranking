USE DB480;

DELIMITER $$
-- This is done such that ; does not get parsed as the end of the CREATE PROCEDURE statement
CREATE PROCEDURE GetAllSchoolData()
BEGIN
	SELECT `School ID`, `School Name`, `State Abbreviation`, `Total Students`
	from SCHOOLINFO;
END$$
DELIMITER ;

CALL GetAllSchoolData;

