# Employee Performance Mapping Using SQL – ScienceQtech Case Study

## Overview
ScienceQtech is a data science startup working across multiple domains such as fraud detection, market basket analysis, self-driving cars, healthcare analytics, customer sentiment, and drug discovery.  
This project focuses on analyzing the employee database using SQL to support HR and management during the annual appraisal cycle.

As a Junior Database Administrator, the objective is to generate structured reports on employee details, performance ratings, salaries, roles, and project assignments to enable effective employee performance mapping and cost analysis.

## Objectives
- Analyze employee performance using ratings and experience  
- Identify maximum and minimum salaries across roles  
- Validate job roles against organizational standards  
- Calculate bonuses and additional expense impact  
- Support HR decision-making through data-driven insights  

## Database & Tables
A database named **`employee`** is created using the following tables:

### emp_record_table
Contains detailed employee information:
- EMP_ID
- FIRST_NAME
- LAST_NAME
- GENDER
- ROLE
- DEPT
- EXP
- COUNTRY
- CONTINENT
- SALARY
- EMP_RATING
- MANAGER_ID
- PROJ_ID

### proj_table
Contains project-related information:
- PROJECT_ID
- PROJ_NAME
- DOMAIN
- START_DATE
- CLOSURE_DATE
- DEV_QTR
- STATUS

### data_science_team
Contains details of employees in the Data Science team:
- EMP_ID
- FIRST_NAME
- LAST_NAME
- GENDER
- ROLE
- DEPT
- EXP
- COUNTRY
- CONTINENT

## Tools & Technologies
- SQL (Joins, Subqueries, Aggregations, Window Functions)
- MySQL / PostgreSQL
- ER Diagram Modeling
- Views, Indexes, Stored Procedures, Stored Functions

## Key Tasks Performed
- Created employee database and imported CSV datasets  
- Designed ER diagram for database relationships  
- Retrieved employee details and department mappings  
- Analyzed employee ratings (low, medium, high performers)  
- Identified managers and reporting structures  
- Performed department-wise and role-wise analysis  
- Calculated salary ranges and experience-based rankings  
- Created views, indexes, stored procedures, and functions  
- Validated job roles against organizational standards  
- Calculated employee bonuses and average salary distribution  

## SQL Concepts Demonstrated
- SELECT queries with filtering and conditions  
- JOINs and UNION operations  
- GROUP BY with aggregations  
- Window functions for ranking  
- Nested queries  
- Views and Indexes  
- Stored Procedures and Functions  
- Performance optimization using execution plans  

## Job Role Standard Validation
Employee roles are validated using experience-based rules:
- ≤ 2 years → Junior Data Scientist  
- 2–5 years → Associate Data Scientist  
- 5–10 years → Senior Data Scientist  
- 10–12 years → Lead Data Scientist  
- 12–16 years → Manager  

## Business Impact
- Enables fair and transparent performance evaluation  
- Supports HR in appraisal and promotion decisions  
- Identifies training needs and skill gaps  
- Improves workforce cost planning through bonus analysis  
- Ensures role alignment with organizational standards  

## Deliverables
- SQL queries for analysis and reporting  
- ER diagram of the employee database  
- Views, stored procedures, and stored functions  
- Performance and salary insights  

## Author
Praveena Pradeep
