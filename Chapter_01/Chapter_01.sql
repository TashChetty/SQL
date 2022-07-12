--------------------------------------------------------------
-- Practical SQL: A Beginner's Guide to Storytelling with Data
-- by Anthony DeBarros

-- Chapter 1 Code Examples
--------------------------------------------------------------

-- Listing 1-1: Creating a database named analysis

CREATE DATABASE analysis;

-- Listing 1-2: Creating a table named teachers with six columns

CREATE TABLE teachers (
    id bigserial,
    first_name varchar(25),
    last_name varchar(50),
    school varchar(50),
    hire_date date,
    salary numeric
);

-- This command will remove (drop) the table.
-- DROP TABLE teachers;

-- Listing 1-3 Inserting data into the teachers table

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
       ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);

--Try it yourself Chapter 01
--Question 1
-- successfully created table with columns for TABLE animal_collection
CREATE TABLE animal_collection (
    id bigserial,
    animal_name varchar(10), 
    animal_species varchar(40),
    tracker_number numeric
    );
   
--Question 2
--inserting statements to load sample data
--unique key is tracker_number
 
 INSERT INTO animal_collection (animal_name, animal_species, tracker_number)
 VALUES ('Nala', 'Africa Forest Elephant',302),
        ('Jack', 'Amur Leopard', 517),
        ('Borris', 'Bornean Orangutan', 196);
        
--added additonal columns so I had to drop the table and start again
   DROP TABLE animal_collection;
--viewing all columns created and their data types
 SELECT * FROM animal_collection;
 
  --Question 1
 --animal specifics table creation

 CREATE TABLE animal_specifics (
 tracker_number numeric,
 date_received date,
 animal_sex varchar(1)
 );
 
 --Question 2
 --inserting statements to load sample data in animal specifics
 --unique key is tracker_number
 INSERT INTO animal_specifics(tracker_number, date_received, animal_sex)
 VALUES (302, '1996-10-11', 'F'),
        (196, '1989-03-17', 'M'),
        (517, '2003-06-19', 'M');
 
 --dropping table to ammend 
 DROP TABLE animal_specifics;
 --viewing all columns created in the animal_specific table
 SELECT * FROM animal_specifics;

--Question 2 continued below:
--Create an additional INSERT statement for one of your tables.
--Purposely omit one of the required commas separating the entries in the VALUES clause of the query
--What is the error message? Would it help you find the error in the code?

INSERT INTO animal_specifics(tracker_number, date_received, animal_sex)
 VALUES (302 '1996-10-11', 'F'),
        (196, '1989-03-17', 'M'),
        (517, '2003-06-19', 'M');
--above code shows error 
--syntax error at or near "'1196-10-11'"
--Line 2 values (302 ^ '1996-10-11, 'F'),