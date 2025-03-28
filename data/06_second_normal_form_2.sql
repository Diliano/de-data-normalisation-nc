-- DO NOT CHANGE THIS CODE

DROP DATABASE IF EXISTS normalisationsql;
CREATE DATABASE normalisationsql;

\c normalisationsql;

CREATE TABLE nc_restaurant_staff_1NF
( 
    employee_no VARCHAR,
    full_name VARCHAR,
    job_title VARCHAR,
    employment VARCHAR,
    shift VARCHAR,
    PRIMARY KEY (employee_no, job_title)
);



INSERT INTO nc_restaurant_staff_1NF
    (employee_no, full_name, job_title, employment, shift)
VALUES
('NC0001', 'Gordon Ramsay', 'Head Chef', 'Full-time', 'All Day'),
('NC0001', 'Gordon Ramsay', 'Owner', 'Full-time', 'All Day'),
('NC0002', 'Jamie Oliver', 'Waiter', 'Part-time', 'Evening'),
('NC0003', 'Rachael Ray', 'Chef', 'Full-time', 'All Day'),
('NC0004', 'Wolfgang Puck', 'Bartender', 'Full-time', 'All Day'),
('NC0004', 'Wolfgang Puck', 'Dishwasher', 'Full-time', 'All Day'),
('NC0005', 'Giada De Laurentiis', 'Waiter', 'Full-time', 'All Day'),
('NC0005', 'Giada De Laurentiis', 'Dishwasher', 'Full-time', 'All Day'),
('NC0006', 'Alan Ducasse', 'Waiter', 'Part-time', 'Evening'),
('NC0006', 'Alan Ducasse', 'Bartender', 'Part-time', 'Evening'),
('NC0007', 'Anne Burrell', 'Chef', 'Full-time', 'All Day'),
('NC0008', 'David Chang', 'Chef', 'Part-time', 'Evening'),
('NC0009', 'Guy Fieri', 'Bartender', 'Part-time', 'Evening');


SELECT * FROM nc_restaurant_staff_1NF;

-- CREATE NEW TABLES HERE:

CREATE TABLE employee_nos_job_titles AS
SELECT employee_no, job_title
FROM nc_restaurant_staff_1NF;

ALTER TABLE employee_nos_job_titles
ADD PRIMARY KEY (employee_no, job_title);

SELECT * FROM employee_nos_job_titles;

CREATE TABLE nc_restaurant_staff_2nf AS
SELECT DISTINCT employee_no, full_name, employment, shift
FROM nc_restaurant_staff_1nf;

ALTER TABLE nc_restaurant_staff_2nf
ADD PRIMARY KEY (employee_no);

SELECT * FROM nc_restaurant_staff_2nf;

ALTER TABLE employee_nos_job_titles
ADD FOREIGN KEY (employee_no) REFERENCES nc_restaurant_staff_2nf(employee_no);