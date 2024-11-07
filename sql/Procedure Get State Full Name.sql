USE DB480;

DELIMITER $$
-- This is done such that ; does not get parsed as the end of the CREATE PROCEDURE statement
CREATE PROCEDURE GetStateNames()
BEGIN
	SELECT distinct Codevalue, valueLabel FROM ipeds_2024_db.valuesets22
	where varName = "STABBR"
	order by Codevalue;
END$$
DELIMITER ;

CALL GetStateNames;