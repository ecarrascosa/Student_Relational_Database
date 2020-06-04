# This is the final project of a "Database Management and Administration" class in my M.Sc. in Analytics program taken in the Spring 2019. 

## Repo includes
-Term.sql is the database implementation schema
-Term Paper Functional Dependency Diagram.docx 
-Power point presentation of project

## Below are the guidelines for the project

----------------------------------------------------------------------------------------------------------------------------------------

In a group of not more than 3 members, you will create a SCHEDULE database using SQL server DBMS. The database should contain following 12 mandatory attributes. You can add more attributes if needed.
 

### Conceptual and Logical Database Design

Create your own business rules and assumptions and identify all functional dependencies in the SCHEDULE database. For example, all the instructors who are teaching the same course are required to use the same course book. You need to remove all partial and transitive dependencies to create tables in 3NF. Give appropriate names to the tables. Create Entity-Relationship diagram using appropriate cardinality constraints. Map the ER diagram to a relational model showing appropriate referential integrity constraint.

### Physical Database Design

Decide the datatype and size of each attribute in each table. Decide which attribute should not have a null value. Using SQL server, create a SCHEDULE database. Create the schema of each table which you identified in the Logical Database Design step. Remember to create the referential integrity constraint for the tables. Create the database diagram showing the relationship between the tables.

### Implementation

Insert the information about the group members and the courses taken by each group member in year 2018 including the instructor details in the appropriate tables. Test the database using following queries:

1.	Count the number of students who are graduating in the same semester.
2.	Display the students name and major who have taken BAN 610.
3.	Display the NetID and student name of the students who have taken more than 8 courses in year 2018 (adjust the number of courses taken so that the query returns at least one result).
4.	Display the NetID and the total credit hours taken by each student in 2018.
5.	Display the instructors name and the number of course books prescribed by each instructor.

### Presentation Guidelines

Each member of the group should take turn in presentation. The first slide should contain the group name and group members name. Your presentation should contain following information:
1.	Business rules and assumptions.
2.	The functional dependency diagram.
3.	Relational model: both 2NF and 3NF
4.	Entity-Relationship diagram
5.	Screenshot of database diagram
6.	Screenshot of the content (columns and rows) of each table in the database
7.	The test queries and screenshot of the outputs.

### Deliverables:

You need to submit the presentation slides along with the SQL query file containing all the queries you have used to create, insert, and test the database. The query file should have .sql extension so that it can be directly opened in SSMS. The due date of this project will be provided by the instructor.
