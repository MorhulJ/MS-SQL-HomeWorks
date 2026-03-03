--Task 1
SELECT D.Building AS BuildingNumber
FROM Departments AS D
GROUP BY D.Building
HAVING SUM(D.Financing) > 100000;

--Task 2
SELECT G.Name AS GroupName
FROM Groups AS G
INNER JOIN Departments AS D ON G.DepartmentId = D.Id
INNER JOIN GroupsLectures AS GL ON G.Id = GL.GroupId
INNER JOIN Lectures AS L ON GL.LectureId = L.Id
WHERE G.Year = 5 AND D.Name = 'Software Development' AND L.Date BETWEEN '2026-02-01' AND '2026-02-07'
GROUP BY G.Id, G.Name
HAVING COUNT(L.Id) > 10;

--Task 3
WITH GroupAvgRating AS (
    SELECT G.Id, G.Name, AVG(S.Rating * 1.0) AS AvgRating
    FROM Groups AS G
    INNER JOIN GroupsStudents AS GS ON G.Id = GS.GroupId
    INNER JOIN Students AS S ON GS.StudentId = S.Id
    GROUP BY G.Id, G.Name
),
D221Rating AS (
    SELECT AvgRating
    FROM GroupAvgRating
    WHERE Name = 'D221'
)
SELECT Name
FROM GroupAvgRating
WHERE AvgRating > (SELECT AvgRating FROM D221Rating);

--Task 4
SELECT Surname, Name
FROM Teachers
WHERE Salary > (SELECT AVG(Salary) 
                FROM Teachers 
                WHERE IsProfessor = 1);

--Task 5
SELECT G.Name
FROM Groups AS G
INNER JOIN GroupsCurators AS GC ON G.Id = GC.GroupId
GROUP BY G.Id, G.Name
HAVING COUNT(GC.CuratorId) > 1;

--Task 6
WITH GroupAvgRating AS (
    SELECT G.Id, G.Name, AVG(S.Rating * 1.0) AS AvgRating
    FROM Groups AS G
    INNER JOIN GroupsStudents AS GS ON G.Id = GS.GroupId
    INNER JOIN Students AS S ON GS.StudentId = S.Id
    GROUP BY G.Id, G.Name, G.Year
),
Min5Course AS (
    SELECT MIN(AvgRating) AS MinRating
    FROM GroupAvgRating
    WHERE Name IN (SELECT Name FROM Groups WHERE Year = 5)
)
SELECT Name
FROM GroupAvgRating
WHERE AvgRating < (SELECT MinRating 
                   FROM Min5Course);

--Task 7
WITH CSFinancing AS (
    SELECT SUM(Financing) AS TotalFinancing
    FROM Departments AS D
    INNER JOIN Faculties AS F ON D.FacultyId = F.Id
    WHERE F.Name = 'Computer Science'
)
SELECT F.Name
FROM Faculties AS F
INNER JOIN Departments AS D ON D.FacultyId = F.Id
GROUP BY F.Id, F.Name
HAVING SUM(D.Financing) > (SELECT TotalFinancing 
                           FROM CSFinancing);

--Task 8
WITH LectureCount AS (
    SELECT S.Name AS SubjectName, T.Name AS TeacherName, T.Surname AS TeacherSurname, COUNT(L.Id) AS LecturesNum
    FROM Lectures AS L
    INNER JOIN Subjects AS S ON L.SubjectId = S.Id
    INNER JOIN Teachers AS T ON L.TeacherId = T.Id
    GROUP BY S.Name, T.Name, T.Surname
),
MaxCount AS (
    SELECT SubjectName, MAX(LecturesNum) AS MaxLectures
    FROM LectureCount
    GROUP BY SubjectName
)
SELECT LC.SubjectName, LC.TeacherName + ' ' + LC.TeacherSurname AS FullName
FROM LectureCount AS LC
INNER JOIN MaxCount AS MC
    ON LC.SubjectName = MC.SubjectName AND LC.LecturesNum = MC.MaxLectures;

--Task 9
SELECT TOP 1 S.Name AS SubjectName, COUNT(L.Id) AS LectureCount
FROM Lectures AS L
INNER JOIN Subjects AS S ON L.SubjectId = S.Id
GROUP BY S.Name
ORDER BY COUNT(L.Id) ASC;

--Task 10
SELECT COUNT(DISTINCT GS.StudentId) AS StudentCount, COUNT(DISTINCT L.SubjectId) AS SubjectCount
FROM Groups AS G
INNER JOIN Departments AS D ON G.DepartmentId = D.Id
INNER JOIN GroupsStudents AS GS ON G.Id = GS.GroupId
INNER JOIN GroupsLectures AS GL ON G.Id = GL.GroupId
INNER JOIN Lectures AS L ON GL.LectureId = L.Id
WHERE D.Name = 'Software Development';