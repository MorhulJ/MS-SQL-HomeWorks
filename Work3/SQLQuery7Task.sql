--Task 1
SELECT T.Name AS TeacherName, T.Surname AS TeacherSurname, G.Name AS GroupName
FROM Teachers AS T
CROSS JOIN Groups AS G;

--Task 2
SELECT F.Name AS FacultyName
FROM Faculties AS F
WHERE F.Financing < (
    SELECT SUM(D.Financing)
    FROM Departments AS D
    WHERE D.FacultyId = F.Id
);

--Task 3
SELECT C.Surname AS CuratorSurname,G.Name AS GroupName
FROM Curators AS C
INNER JOIN GroupsCurators AS GC ON C.Id = GC.CuratorId
INNER JOIN Groups AS G ON GC.GroupId = G.Id;

--Task 4
SELECT T.Surname AS TeacherSurname
FROM Teachers AS T
INNER JOIN Lectures AS L ON T.Id = L.TeacherId
INNER JOIN GroupsLectures AS GL ON L.Id = GL.LectureId
INNER JOIN Groups AS G ON GL.GroupId = G.Id
WHERE G.Name = 'P107';

--Task 5
SELECT T.Surname AS TeacherSurname, F.Name AS FacultyName
FROM Teachers AS T
INNER JOIN Lectures AS L ON T.Id = L.TeacherId
INNER JOIN GroupsLectures AS GL ON L.Id = GL.LectureId
INNER JOIN Groups AS G ON GL.GroupId = G.Id
INNER JOIN Departments AS D ON G.DepartmentId = D.Id
INNER JOIN Faculties AS F ON D.FacultyId = F.Id;

--Task 6
SELECT D.Name AS DepartmentName, G.Name AS GroupName
FROM Departments AS D
INNER JOIN Groups AS G ON D.Id = G.DepartmentId;

--Task 7
SELECT S.Name AS SubjectName
FROM Teachers AS T
INNER JOIN Lectures AS L ON T.Id = L.TeacherId
INNER JOIN Subjects AS S ON S.Id = L.SubjectId
WHERE T.Name = 'Samantha' AND T.Surname = 'Adams';

--Task 8
SELECT D.Name AS DepartmentName
FROM Subjects AS S
INNER JOIN Lectures AS L ON S.Id = L.SubjectId
INNER JOIN GroupsLectures AS GL ON L.Id = GL.LectureId
INNER JOIN Groups AS G ON GL.GroupId = G.Id
INNER JOIN Departments AS D ON G.DepartmentId = D.Id
WHERE S.Name = 'Теорія баз даних';

--Task 9
SELECT G.Name AS GroupName
FROM Faculties AS F
INNER JOIN Departments AS D ON F.Id = D.FacultyId
INNER JOIN Groups AS G ON D.Id = G.DepartmentId
WHERE F.Name = 'Комп''ютерні науки';

--Task 10
SELECT G.Name AS GroupName, F.Name AS FacultyName
FROM Groups AS G
INNER JOIN Departments AS D ON D.Id = G.DepartmentId
INNER JOIN Faculties AS F ON F.Id = D.FacultyId
WHERE G.Year = 5;

--Task 11
SELECT T.Surname, (S.Name + ' - ' + G.Name) AS Lecture
FROM Teachers AS T
INNER JOIN Lectures AS L ON T.Id = L.TeacherId
INNER JOIN Subjects AS S ON S.Id = L.SubjectId
INNER JOIN GroupsLectures AS GL ON L.Id = GL.LectureId
INNER JOIN Groups AS G ON G.Id = GL.GroupId
WHERE L.LectureRoom = 'B103'
