CREATE TABLE Students (
    STUDENT_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    GPA DECIMAL(3, 2),
    ENROLLMENT_DATE DATE,
    MAJOR VARCHAR(50)
);
SELECT * FROM Students

INSERT INTO Students (STUDENT_ID, FIRST_NAME, LAST_NAME, GPA, ENROLLMENT_DATE, MAJOR) VALUES
(201, 'Shivansh', 'Mahajan', 8.79, '2021-09-01 09:30:00', 'Computer Science'),
(202, 'Umesh', 'Sharma', 8.44, '2021-09-01 08:30:00', 'Mathematics'),
(203, 'Rakesh', 'Kumar', 5.60, '2021-09-01 10:00:00', 'Biology'),
(204, 'Radha', 'Sharma', 9.20, '2021-09-01 12:45:00', 'Chemistry'),
(205, 'Kush', 'Kumar', 7.85, '2021-09-01 08:30:00', 'Physics'),
(206, 'Prem', 'Chopra', 9.56, '2021-09-01 09:24:00', 'History'),
(207, 'Pankaj', 'Vats', 9.78, '2021-09-01 02:30:00', 'English'),
(208, 'Navleen', 'Kaur', 7.00, '2021-09-01 06:30:00', 'Mathematics');

CREATE TABLE StudentPrograms (
    STUDENT_REF_ID INT,
    PROGRAM_NAME VARCHAR(50),
    PROGRAM_START_DATE DATE
);
SELECT * FROM StudentPrograms

INSERT INTO StudentPrograms (STUDENT_REF_ID, PROGRAM_NAME, PROGRAM_START_DATE) VALUES
(201, 'Computer Science', '2021-09-01 00:00:00'),
(202, 'Mathematics', '2021-09-01 00:00:00'),
(208, 'Mathematics', '2021-09-01 00:00:00'),
(205, 'Physics', '2021-09-01 00:00:00'),
(204, 'Chemistry', '2021-09-01 00:00:00'),
(207, 'Psychology', '2021-09-01 00:00:00'),
(206, 'History', '2021-09-01 00:00:00'),
(203, 'Biology', '2021-09-01 00:00:00');


CREATE TABLE Scholarships (
    STUDENT_REF_ID INT,
    SCHOLARSHIP_AMOUNT DECIMAL(10, 2),
    SCHOLARSHIP_DATE DATE
);
SELECT * FROM Scholarships


INSERT INTO Scholarships (STUDENT_REF_ID, SCHOLARSHIP_AMOUNT, SCHOLARSHIP_DATE) VALUES
(201, 5000, '2021-10-15 00:00:00'),
(202, 4500, '2022-08-18 00:00:00'),
(203, 3000, '2022-01-25 00:00:00'),
(201, 4000, '2021-10-15 00:00:00');

1. Write a SQL query to fetch “FIRST_NAME” from the Student table in upper case and 
	use ALIAS name as STUDENT_NAME.

	Select upper(first_name) as STUDENT_NAME from Students
	
2. Write a SQL query to fetch unique values of MAJOR Subjects from Student table.

	Select DISTINCT(major) from Students
	SELECT MAJOR FROM STUDENTS GROUP BY(MAJOR);

3. Write a SQL query to print the first 3 characters of FIRST_NAME from Student table.

	Select Substring(First_name,1,3) from Students

4. Write a SQL query to find the position of alphabet (‘a’) int the first name
	column ‘Shivansh’ from Student table.

	Select INSTR(First_name,'a') from Students where First_name ='Shivansh';
	SELECT POSITION('a' IN 'Shivansh') AS PositionOfA from Students
		where First_name ='Shivansh';

5. Write a SQL query that fetches the unique values of MAJOR Subjects from Student table and print its length.
	
	SELECT DISTINCT(MAJOR),LENGTH(Major) from Students
	SELECT MAJOR,LENGTH(Major) from Students group by Major

6. Write a SQL query to print FIRST_NAME from the Student table after replacing ‘a’ with ‘A’.

	Select replace(First_name,'a','A') from Students

7. Write a SQL query to print the FIRST_NAME and LAST_NAME from Student table into single column COMPLETE_NAME.

	Select CONCAT(FIRST_NAME,' ', LAST_NAME)as Full_Name from Students

8. Write a SQL query to print all Student details from Student table order by FIRST_NAME Ascending and 
	MAJOR Subject descending .

	Select * from Students order by First_name, Major DESC

9. Write a SQL query to print details of the Students with the FIRST_NAME as ‘Prem’ and ‘Shivansh’ from Student table.

	Select * from Students where First_name  in('Prem', 'Shivansh');

10. Write a SQL query to print details of the Students excluding FIRST_NAME as ‘Prem’ and ‘Shivansh’ from Student table.
	
  Select * from Students where First_name NOT in('Prem','Shivansh')

11. Write a SQL query to print details of the Students whose FIRST_NAME ends with ‘a’.
	
  Select * from Students where First_name Like '%a'

12. Write an SQL query to print details of the Students whose FIRST_NAME ends with ‘a’ and contains six alphabets.

	Select * from Students where First_name Like '______a' 

13. Write an SQL query to print details of the Students whose GPA lies between 9.00 and 9.99.
	
	Select * from Students where GPA between 9.0 and 9.9

14. Write an SQL query to fetch the count of Students having Major Subject ‘Computer Science’.
	
SELECT Major, COUNT(*) as TOTAL_COUNT FROM Students WHERE MAJOR = 'Computer Science'
	group by Major;


15. Write an SQL query to fetch Students full names with GPA >= 8.5 and <= 9.5.

	Select CONCAT(FIRST_NAME,' ', LAST_NAME)as Full_Name,GPA from Students where GPA between 8.5 and 9.5

16. Write an SQL query to fetch the no. of Students for each MAJOR subject in the descending order.

	Select Major,Count(*)from Students group by Major order by Count(Major) DESC

17. Display the details of students who have received scholarships, including their names,
	scholarship amounts, and scholarship dates.

	Select 
		Students.First_name,
		Students.First_name,
		scholarships.scholarship_amount,
		scholarships.scholarship_date
	from Students 
	join scholarships 
	on Students.student_id= scholarships.Student_ref_id

18. Write an SQL query to show only odd rows from Student table.

	Select * from Students where Student_id %2 !=0

19. Write an SQL query to show only even rows from Student table.
	
	Select * from Students where Student_id %2 =0

20. List all students and their scholarship amounts if they have received any. 
	If a student has not received a scholarship, display NULL for the scholarship details.

	Select 
		Students.First_name,
		Students.First_name,
		scholarships.scholarship_amount,
		scholarships.scholarship_date
	from Students 
	LEFT join scholarships 
	on Students.student_id= scholarships.Student_ref_id

21. Write an SQL query to show the top n (say 5) records of Student table order by descending GPA.

	Select * from Students order by GPA DESC LIMIT 5

22. Write an SQL query to determine the nth (say n=5) highest GPA from a table.

SELECT First_name,GPA
FROM (
    SELECT First_name,GPA, ROW_NUMBER() OVER (ORDER BY GPA DESC) AS rank
    FROM Students
) AS ranked
WHERE rank = 5;


23. Write an SQL query to fetch the list of Students with the same GPA.

	Select s1.* from Students s1, Students s2 where s1.gpa= s2.gpa 
	AND s1.student_id!=s2.student_id

24. Write an SQL query to fetch the list of Students with the same first_name.

	Select s1.* from Students s1, Students s2 where s1.First_name= s2.First_name
	AND s1.student_id!=s2.student_id

25. Write an SQL query to show the second highest GPA from a Student table using sub-query.

	Select First_name,GPA from(
	Select First_name,GPA, Row_Number() over(order by GPA DESC) as rank
from students)
where rank =2

SELECT MAX(GPA) FROM Students
WHERE GPA NOT IN(SELECT MAX(GPA) FROM Students);

26. Write an SQL query to show one row twice in results from a table.

	SELECT * FROM scholarships 
UNION ALL
	SELECT * FROM Students ORDER BY STUDENT_ID;

27. Write an SQL query to list STUDENT_ID who does not get Scholarship.

	SELECT STUDENT_ID FROM Students
WHERE STUDENT_ID NOT IN (SELECT STUDENT_REF_ID FROM Scholarships);

28. Write an SQL query to fetch the first 50% records from a table.

	SELECT * FROM Students WHERE STUDENT_ID <= (SELECT COUNT(STUDENT_ID)/2 FROM Students);

29. Write an SQL query to fetch the MAJOR subject that have less than 4 people in it.

	SELECT MAJOR, COUNT(MAJOR) AS MAJOR_COUNT FROM Students GROUP BY MAJOR HAVING COUNT(MAJOR) < 4;

30. Write an SQL query to show all MAJOR subject along with the number of people in there.

	SELECT MAJOR, COUNT(MAJOR) AS ALL_MAJOR FROM Student GROUP BY MAJOR;

31. Write an SQL query to show the last record from a table.

	SELECT * FROM Students WHERE STUDENT_ID = (SELECT MAX(STUDENT_ID) FROM STUDENTs);

32. Write an SQL query to fetch the first row of a table.

	SELECT * FROM Students Limit 1

33. Write an SQL query to fetch the last five records from a table.

	SELECT * FROM Students Limit 5

34. Write an SQL query to fetch three max GPA from a table using co-related subquery.

	SELECT DISTINCT GPA FROM Students S1 
WHERE 3 >= (SELECT COUNT(DISTINCT GPA) FROM Students S2 WHERE S1.GPA <= S2.GPA) ORDER BY S1.GPA DESC;

35. Write an SQL query to fetch three min GPA from a table using co-related subquery.

	SELECT DISTINCT GPA FROM Students S1 
WHERE 3 >= (SELECT COUNT(DISTINCT GPA) FROM Students S2 WHERE S1.GPA <= S2.GPA) ORDER BY S1.GPA;

36. Write an SQL query to fetch nth max GPA from a table.

	SELECT DISTINCT GPA
FROM Students
ORDER BY GPA DESC
OFFSET 3 ROWS
LIMIT 1;

37. Write an SQL query to fetch MAJOR subjects along with the max GPA in each of these MAJOR subjects.

	Select major,max(gpa) as Max_GPA from students group by major

38. Write an SQL query to fetch the names of Students who has highest GPA

	Select first_name,gpa from Students order by gpa DESC limit 1
	SELECT FIRST_NAME, GPA FROM Student WHERE GPA = (SELECT MAX(GPA) FROM Student);

39. Write an SQL query to show the current date and time.

Query to get current date : 
SELECT CURRENT_DATE;
Query to get current date and time : 
SELECT NOW();

40. Write a query to create a new table which consists of data and structure copied from the other table
	(say Student) or clone the table named Student.

	CREATE TABLE CloneTable AS SELECT * FROM Students;

41. Write an SQL query to update the GPA of all the students in ‘Computer Science’ MAJOR subject to 7.1.

	UPDATE Students set GPA=7.1 WHERE major='Computer Science'

42. Write an SQL query to find the average GPA for each major.

	SELECT MAJOR, AVG(GPA) AS AVERAGE_GPA FROM Student GROUP BY MAJOR;

43. Write an SQL query to show the top 3 students with the highest GPA.

	Select * from Students order by gpa DESC limit 3

44. Write an SQL query to find the number of students in each major who have a GPA greater than 7.5.

	SELECT MAJOR, COUNT(STUDENT_ID) AS HIGH_GPA_COUNT FROM Student WHERE GPA > 3.5 GROUP BY MAJOR;

45. Write an SQL query to find the students who have the same GPA as ‘Shivansh Mahajan’.

	SELECT * FROM Students where gpa = (Select gpa from students where first_name = 'Shivansh' and last_name = 'Mahajan')

	SELECT * FROM Students WHERE GPA = (SELECT GPA FROM Students WHERE FIRST_NAME = 'Shivansh' 
AND LAST_NAME = 'Mahajan');