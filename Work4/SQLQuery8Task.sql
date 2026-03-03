--Task 1
SELECT COUNT(DISTINCT T.Id) AS TeachersCount
FROM Teachers AS T
JOIN Lectures AS L ON T.Id = L.TeacherId
JOIN GroupsLectures AS GL ON L.Id = GL.LectureId
JOIN Groups AS G ON GL.GroupId = G.Id
JOIN Departments AS D ON G.DepartmentId = D.Id
WHERE D.Name = 'Software Development';

--Task 2
SELECT COUNT(DISTINCT L.Id) AS LecturesCount
FROM Lectures AS L
JOIN Teachers AS T ON T.Id = L.TeacherId
WHERE T.Name = 'Dave' AND T.Surname = 'McQueen';

--Task 3
SELECT COUNT(L.Id) AS LecturesCount
FROM Lectures AS L
WHERE L.LectureRoom = 'D201';

--Task 4
SELECT L.LectureRoom AS RoomName, COUNT(L.Id) AS LecturesCount 
FROM Lectures AS L
GROUP BY L.LectureRoom

--Task 5
SELECT COUNT(DISTINCT S.Id) AS StudentsCount
FROM Teachers AS T
JOIN Lectures AS L ON T.Id = L.TeacherId
JOIN GroupsLectures AS GL ON L.Id = GL.LectureId
JOIN Groups AS G ON GL.GroupId = G.Id
JOIN Students AS S ON G.Id = S.GroupId
WHERE T.Name = 'Jack' AND T.Surname = 'Underhill';

--Task 6
SELECT AVG(DISTINCT T.Salary) AS AverageSalary
FROM Teachers AS T
JOIN Lectures AS L ON T.Id = L.TeacherId
JOIN GroupsLectures AS GL ON L.Id = GL.LectureId
JOIN Groups AS G ON GL.GroupId = G.Id
JOIN Departments AS D ON G.DepartmentId = D.Id
JOIN Faculties AS F ON D.FacultyId = F.Id
WHERE F.Name = 'Computer Science';

--Task 7
SELECT MIN(StudentCount) AS MinStudents, MAX(StudentCount) AS MaxStudents
FROM (
    SELECT G.Id, COUNT(S.Id) AS StudentCount
    FROM Groups AS G
    LEFT JOIN Students AS S ON G.Id = S.GroupId
    GROUP BY G.Id
    )
    AS GroupStats;

--Task 8
SELECT AVG(D.Financing) AS AverageFinancing
FROM Departments AS D;

--Task 9
SELECT T.Name + ' ' + T.Surname AS FullName, COUNT(DISTINCT L.SubjectId) AS SubjectsCount
FROM Teachers AS T
LEFT JOIN Lectures AS L ON T.Id = L.TeacherId
GROUP BY T.Name, T.Surname;

--Task 10
SELECT L.DayOfWeek,COUNT(L.Id) AS LecturesCount
FROM Lectures AS L
GROUP BY L.DayOfWeek
ORDER BY L.DayOfWeek;

--Task 11
SELECT L.LectureRoom, COUNT(DISTINCT G.DepartmentId) AS DepartmentsCount
FROM Lectures AS L
JOIN GroupsLectures AS GL ON L.Id = GL.LectureId
JOIN Groups AS G ON GL.GroupId = G.Id
GROUP BY L.LectureRoom;

--Task 12
SELECT F.Name AS FacultyName, COUNT(DISTINCT L.SubjectId) AS SubjectsCount
FROM Faculties AS F
JOIN Departments AS D ON F.Id = D.FacultyId
JOIN Groups AS G ON D.Id = G.DepartmentId
JOIN GroupsLectures AS GL ON G.Id = GL.GroupId
JOIN Lectures AS L ON GL.LectureId = L.Id
GROUP BY F.Name;

--Task 13
SELECT COUNT(L.Id) AS LecturesCount
FROM Teachers AS T
JOIN Lectures AS L ON T.Id = L.TeacherId
GROUP BY T.Name, T.Surname, L.LectureRoom