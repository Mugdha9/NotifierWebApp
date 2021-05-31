CREATE DATABASE notifier;
USE notifier_application;

CREATE TABLE sign_up
(user_id INT PRIMARY KEY auto_increment,
name VARCHAR(250) NOT NULL, username VARCHAR(50) NOT NULL,
mobile_number VARCHAR(15) NOT NULL, 
email_id VARCHAR(50) NOT NULL UNIQUE,
 password VARCHAR(50) NOT NULL,
 reset_password VARCHAR(50) NOT NULL);
 
 CREATE TABLE notebook
 (notebook_id int AUTO_INCREMENT PRIMARY KEY,
 notebook_name VARCHAR(250) NOT NULL UNIQUE);
 
 ALTER TABLE notebook ADD column user_id INT;
 
 CREATE TABLE note(note_id INT PRIMARY KEY auto_increment,
 note_name VARCHAR(250) NOT NULL UNIQUE,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL,
 reminder_date DATE NOT NULL,
 status VARCHAR(50) NOT NULL,
 tag VARCHAR(50) NOT NULL,
 description VARCHAR(500) NOT NULL,
 notebook_id INT,
 CONSTRAINT CheckEndLaterThanStart CHECK (end_date >= start_date));
 
 ALTER TABLE note ADD FOREIGN KEY(notebook_id) REFERENCES notebook(notebook_id);
 
 ALTER TABLE note ADD COLUMN user_id INT;