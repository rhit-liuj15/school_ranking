
CREATE USER 'ProcedureRunner'@'localhost' IDENTIFIED BY '480ProcedureRunner';
GRANT EXECUTE ON DB480.* TO 'ProcedureRunner'@'localhost';
GRANT SELECT ON DB480.* TO 'ProcedureRunner'@'localhost';
Flush privileges;