CREATE TABLE IF NOT EXISTS users 
(
    username VARCHAR(50) PRIMARY KEY,
    password CHAR(60) NOT NULL,
    degree VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL,
    minor VARCHAR(50)
);