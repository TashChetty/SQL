-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."Employees"
(
    emp_id bigserial NOT NULL,
    first_name character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    gender character(1) NOT NULL,
    address character varying(100) NOT NULL,
    email character varying(50) NOT NULL,
    depart_id bigint NOT NULL,
    role_id bigint NOT NULL,
    salary_id bigint NOT NULL,
    overtime_id bigint NOT NULL,
    PRIMARY KEY (emp_id)
);

CREATE TABLE IF NOT EXISTS public."Department"
(
    depart_id bigserial NOT NULL,
    depart_name character varying(50) NOT NULL,
    depart_city character varying(50) NOT NULL,
    PRIMARY KEY (depart_id)
);

CREATE TABLE IF NOT EXISTS public."Roles"
(
    role_id bigserial NOT NULL,
    role character varying(50) NOT NULL,
    PRIMARY KEY (role_id)
);

CREATE TABLE IF NOT EXISTS public."Salaries"
(
    salary_id bigserial NOT NULL,
    salary_pa integer NOT NULL,
    PRIMARY KEY (salary_id)
);

CREATE TABLE IF NOT EXISTS public."Overtime Hours"
(
    overtime_id bigserial NOT NULL,
    overtime_hours numeric(5, 2) NOT NULL,
    PRIMARY KEY (overtime_id)
);

ALTER TABLE IF EXISTS public."Employees"
    ADD FOREIGN KEY (depart_id)
    REFERENCES public."Department" (depart_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Employees"
    ADD FOREIGN KEY (role_id)
    REFERENCES public."Roles" (role_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Employees"
    ADD FOREIGN KEY (salary_id)
    REFERENCES public."Salaries" (salary_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Employees"
    ADD FOREIGN KEY (overtime_id)
    REFERENCES public."Overtime Hours" (overtime_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

SELECT 
e.emp_id,
e.first_name,
e.surname,
e.gender,
e.address,
e.email,
d.depart_id,
d.depart_name,
r.role_id,
r.role,
s.salary_id,
s.salary_pa,
o.overtime_id,
o.overtime_hours

FROM "Employees" AS e

LEFT JOIN "Department" AS d
ON e.depart_id = d.depart_id

LEFT JOIN "Roles" AS r
ON e.role_id = r.role_id

LEFT JOIN "Salaries" AS s
ON e.salary_id = s.salary_id

LEFT JOIN "Overtime Hours" AS o
ON e.overtime_id = o.overtime_id;

INSERT INTO "Employees" (first_name, surname, gender, address, email, depart_id, role_id, salary_id, overtime_id)
VALUES ('Justin', 'Tonder', 'M', '3, Apple Street, Eastern Cape', 'justin@cool.com', 1, 1, 1, 1),
        ('Sharon', 'Ramdean', 'F', '16 Lemon Crescent, Durban', 'sharon@cool.com', 2,2,2,2),
        ('Kurt', 'Septon', 'M', '43 Fig Place, Cape Town', 'kurt@cool.com', 3,3,3,3),
        ('Lonwabo', 'Hobb', 'M', '54 Orange Rd, Pretoria', 'lonwabo@cool.com', 4,4,4,4);
        
INSERT INTO "Department" (depart_name, depart_city)
VALUES ('Product', 'East London'),
        ('Sales', 'Durban'),
        ('Innovation', 'Cape Town'),
        ('Business Development', 'Pretoria');
        
INSERT INTO "Roles" (role) 
VALUES ('Product Owner'),
        ('Sales Manager'),
        ('Innovation Specialist'),
        ('Channel Manager');
        

INSERT INTO "Salaries" (salary_pa)
VALUES (76000),
        (45000),
        (54000),
        (32000);

INSERT INTO "Overtime Hours" (overtime_hours)
VALUES (10.5),
        (6),
        (9.75),
        (2);

SELECT * from "Employees";
SELECT * from "Department";
SELECT * from "Roles";
SELECT * from "Salaries";
SELECT * from "Overtime Hours";

END;