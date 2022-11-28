CREATE DATABASE IF NOT EXISTS nodelogin;
USE nodelogin;

CREATE TABLE IF NOT EXISTS  users (
    email VARCHAR(100) NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

INSERT INTO users (email, name, password) VALUES ('alexjs415@outlook.com', 'alex', 'Grey117');

SELECT * FROM users;