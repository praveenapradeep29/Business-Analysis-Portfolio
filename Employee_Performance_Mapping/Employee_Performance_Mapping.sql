/*1.Create a database named employee, then import data_science_team.csv proj_table.csv and 
emp_record_table.csv into the employee database from the given resources.*/

USE employee;

/*3.Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, 
and make a list of employees and details of their department.*/


SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT
FROM emp_record_table;

-- 4.Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is:
-- less than two
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING < 2;

-- greater than four 
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING > 4;

-- between two and four
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING BETWEEN 2 AND 4;

/*5.Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department from the employee table
and then give the resultant column alias as NAME.*/

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME
FROM emp_record_table
WHERE DEPT = 'Finance';

-- 6.Write a query to list only those employees who have someone reporting to them. Also, show the number of reporters (including the President).

SELECT 
    m.EMP_ID,
    m.FIRST_NAME,
    m.LAST_NAME,
    COUNT(e.EMP_ID) AS NO_OF_REPORTERS
FROM emp_record_table m
LEFT JOIN emp_record_table e
    ON m.EMP_ID = e.MANAGER_ID
WHERE m.ROLE = 'President'
   OR m.EMP_ID IN (
        SELECT MANAGER_ID
        FROM emp_record_table
        WHERE MANAGER_ID IS NOT NULL
   )
GROUP BY m.EMP_ID, m.FIRST_NAME, m.LAST_NAME;

/*7.Write a query to list down all the employees from the healthcare and finance departments using union.
 Take data from the employee record table.*/

SELECT * FROM emp_record_table WHERE DEPT = 'Healthcare'
UNION
SELECT * FROM emp_record_table WHERE DEPT = 'Finance';

/*8.Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. 
Also include the respective employee rating along with the max emp rating for the department.*/

SELECT EMP_ID,
       FIRST_NAME,
       LAST_NAME,
       ROLE,
       DEPT,
       EMP_RATING,
       MAX(EMP_RATING) OVER (PARTITION BY DEPT) AS MAX_DEPT_RATING
FROM emp_record_table;

-- 9.Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.

SELECT ROLE,
       MIN(SALARY) AS MIN_SALARY,
       MAX(SALARY) AS MAX_SALARY
FROM emp_record_table
GROUP BY ROLE;

-- 10.Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.

SELECT EMP_ID,
       FIRST_NAME,
       LAST_NAME,
       EXP,
       RANK() OVER (ORDER BY EXP DESC) AS EXP_RANK
FROM emp_record_table;

/*11.Write a query to create a view that displays employees in various countries whose salary is more than six thousand.
 Take data from the employee record table.*/

CREATE OR REPLACE VIEW high_salary_employees AS
SELECT EMP_ID, FIRST_NAME, LAST_NAME, COUNTRY, SALARY
FROM emp_record_table
WHERE SALARY > 6000;

SELECT * FROM high_salary_employees;

-- 12.Write a nested query to find employees with experience of more than ten years. Take data from the employee record table.

SELECT *
FROM emp_record_table
WHERE EMP_ID IN (
    SELECT EMP_ID
    FROM emp_record_table
    WHERE EXP > 10
);

/*Write a query to create a stored procedure to retrieve the details of the employees whose experience is more than three years.
 Take data from the employee record table.*/

DELIMITER $$

CREATE PROCEDURE get_experienced_employees()
BEGIN
    SELECT *
    FROM emp_record_table
    WHERE EXP > 3;
END$$

DELIMITER ;
CALL get_experienced_employees();

/*Write a query using stored functions in the project table to check whether the job profile assigned to
 each employee in the data science team matches the organization’s set standard.*/

DELIMITER $$

CREATE FUNCTION job_profile(exp INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE profile VARCHAR(50);

    IF exp <= 2 THEN
        SET profile = 'JUNIOR DATA SCIENTIST';
    ELSEIF exp > 2 AND exp <= 5 THEN
        SET profile = 'ASSOCIATE DATA SCIENTIST';
    ELSEIF exp > 5 AND exp <= 10 THEN
        SET profile = 'SENIOR DATA SCIENTIST';
    ELSEIF exp > 10 AND exp <= 12 THEN
        SET profile = 'LEAD DATA SCIENTIST';
    ELSEIF exp > 12 AND exp <= 16 THEN
        SET profile = 'MANAGER';
    END IF;

    RETURN profile;
END$$

DELIMITER ;

SELECT EMP_ID, FIRST_NAME, EXP, ROLE, job_profile(EXP) AS STANDARD_ROLE
FROM data_science_team;









