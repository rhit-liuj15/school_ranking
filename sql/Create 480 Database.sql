-- DROP SCHEMA `DB480`;
-- CREATE SCHEMA `DB480`;
USE DB480;

DROP TABLE IF EXISTS SCHOOLINFO;

CREATE TABLE SCHOOLINFO AS
SELECT DRVEF2022.UNITID AS "School ID", 
       INSTNM AS "School Name", 
       STABBR AS "State Abbreviation", 
       -- valueLabel AS "State Name", 
       ENRTOT AS "Total Students" 
FROM ipeds_2024_db.DRVEF2022 
JOIN ipeds_2024_db.HD2022 USING (UNITID)
-- JOIN (
-- 	SELECT distinct Codevalue, varName, valueLabel FROM ipeds_2024_db.valuesets22
-- 	where varName = "STABBR"
-- 	order by Codevalue
-- ) as subquery on STABBR = subquery.CodeValue
ORDER BY ENRTOT desc;

select * from SCHOOLINFO;

