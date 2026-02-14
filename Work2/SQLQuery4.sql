USE HomeWork
GO

--Task 1
SELECT * FROM Departments
ORDER BY Id DESC

--Task 2
SELECT Name AS 'Group Name', Rating AS 'Group Rating' FROM Groups

--Task 3
SELECT Surname, (Salary * 100.0 / Premium) AS PercentOfPremium, (Salary * 100.0 / (Salary + Premium)) AS PercentOfTotalSalary FROM Teachers

--Task 4
SELECT CONCAT('The dean of faculty ', Name, ' is ', Dean, '.') AS FacultyInfo FROM Faculties

--Task 5 
SELECT Surname FROM Teachers
WHERE IsProfessor = 1 AND Salary > 1050

--Task 6
SELECT * FROM Departments
WHERE Financing < 11000 OR Financing > 25000

--Task 7
SELECT Name FROM Faculties
WHERE Name != 'Computer Science'

--Task 8
SELECT Surname, Position FROM Teachers
WHERE IsProfessor = 0

--Task 9
SELECT Surname, Position, Salary, Premium FROM Teachers
WHERE IsAssistant = 1

--Task 10
SELECT Surname, Salary FROM Teachers
WHERE IsAssistant = 1

--Task 11
SELECT Surname, Position FROM Teachers
WHERE EmploymentDate < '2000-01-01'

--Task 12
SELECT Name AS 'Name Of Departament' FROM Departments
WHERE Name < 'Software Development'
ORDER BY Name ASC

--Task 13
SELECT Surname FROM Teachers
WHERE IsAssistant = 1 AND (Salary + Premium <= 1200)

--Task 14
SELECT Name FROM Groups
WHERE Year = 5 AND Rating BETWEEN 2 AND 4

--Task 15
SELECT Surname FROM Teachers
WHERE IsAssistant = 1 AND Salary < 550 OR Premium < 200