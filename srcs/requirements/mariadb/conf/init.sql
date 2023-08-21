CREATE DATABASE IF NOT EXISTS db;
CREATE USER IF NOT EXISTS 'user'@'wordpress.inception_default' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON db.* TO 'user'@'wordpress.inception_default' IDENTIFIED BY 'pass';
FLUSH PRIVILEGES;
