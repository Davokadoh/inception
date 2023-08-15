CREATE DATABASE IF NOT EXISTS sql_db;
CREATE USER IF NOT EXISTS 'sql_user'@'wordpress.srcs_incNet' IDENTIFIED BY 'osddept';
GRANT ALL PRIVILEGES ON sql_db.* TO 'sql_user'@'wordpress.srcs_incNet' IDENTIFIED BY 'osddept';
FLUSH PRIVILEGES;
