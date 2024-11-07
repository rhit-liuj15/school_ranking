
CREATE USER 'Ryan'@'%' IDENTIFIED BY 'GenderFair2024';
GRANT EXECUTE ON DB480.* TO 'Ryan'@'%';
GRANT SELECT ON DB480.* TO 'Ryan'@'%';
GRANT SHOW DATABASES ON *.* TO 'Ryan'@'%';
Flush privileges;