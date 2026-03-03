CREATE TABLE Faculties (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Departments (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    Financing MONEY NOT NULL DEFAULT 0 CHECK (Financing >= 0),
    Name NVARCHAR(100) NOT NULL UNIQUE,
    FacultyId INT NOT NULL,

    FOREIGN KEY (FacultyId) REFERENCES Faculties(Id)
);

CREATE TABLE Curators (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(MAX) NOT NULL CHECK (LEN(Name) > 0),
    Surname NVARCHAR(MAX) NOT NULL CHECK (LEN(Surname) > 0)
);

CREATE TABLE Teachers (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IsProfessor BIT NOT NULL DEFAULT 0,
    Name NVARCHAR(MAX) NOT NULL CHECK (LEN(Name) > 0),
    Salary MONEY NOT NULL CHECK (Salary > 0),
    Surname NVARCHAR(MAX) NOT NULL CHECK (LEN(Surname) > 0)
);

CREATE TABLE Subjects (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Groups (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(10) NOT NULL UNIQUE CHECK (LEN(Name) > 0),
    Year INT NOT NULL CHECK (Year BETWEEN 1 AND 5),
    DepartmentId INT NOT NULL,

    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

CREATE TABLE Students (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(MAX) NOT NULL CHECK (LEN(Name) > 0),
    Rating INT NOT NULL CHECK (Rating BETWEEN 0 AND 5),
    Surname NVARCHAR(MAX) NOT NULL CHECK (LEN(Surname) > 0)
);

CREATE TABLE GroupsStudents (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    GroupId INT NOT NULL,
    StudentId INT NOT NULL,

    FOREIGN KEY (GroupId) REFERENCES Groups(Id),
    FOREIGN KEY (StudentId) REFERENCES Students(Id)
);

CREATE TABLE GroupsCurators (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    CuratorId INT NOT NULL,
    GroupId INT NOT NULL,

    FOREIGN KEY (CuratorId) REFERENCES Curators(Id),
    FOREIGN KEY (GroupId) REFERENCES Groups(Id)
);

CREATE TABLE Lectures (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Date DATE NOT NULL CHECK (Date <= GETDATE()),
    SubjectId INT NOT NULL,
    TeacherId INT NOT NULL,

    FOREIGN KEY (SubjectId) REFERENCES Subjects(Id),
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

CREATE TABLE GroupsLectures (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    GroupId INT NOT NULL,
    LectureId INT NOT NULL,

    FOREIGN KEY (GroupId) REFERENCES Groups(Id),
    FOREIGN KEY (LectureId) REFERENCES Lectures(Id)
);

INSERT INTO Faculties (Name) VALUES
('Computer Science'),
('Software Engineering');

INSERT INTO Departments (Building, Financing, Name, FacultyId) VALUES
(1, 50000, 'Software Development', 1),
(2, 70000, 'Networking', 1),
(3, 80000, 'AI', 2),
(4, 60000, 'Databases', 2),
(2, 40000, 'Software Testing', 1),
(3, 30000, 'Cybersecurity', 2);

INSERT INTO Curators (Name, Surname) VALUES
('John', 'Doe'),
('Jane', 'Smith'),
('Alice', 'Brown');

INSERT INTO Teachers (IsProfessor, Name, Salary, Surname) VALUES
(1, 'Dave', 2000, 'McQueen'),
(1, 'Emily', 2200, 'Clark'),
(0, 'Tom', 1500, 'Wilson'),
(0, 'Anna', 1700, 'White');

INSERT INTO Subjects (Name) VALUES
('Databases'),
('Networking'),
('AI'),
('Software Testing');

INSERT INTO Groups (Name, Year, DepartmentId) VALUES
('D221', 5, 1),
('D222', 4, 1),
('N101', 5, 2),
('AI55', 5, 3),
('T202', 5, 5);

INSERT INTO Students (Name, Rating, Surname) VALUES
('Student1', 5, 'A'),
('Student2', 4, 'B'),
('Student3', 3, 'C'),
('Student4', 2, 'D'),
('Student5', 1, 'E'),
('Student6', 5, 'F'),
('Student7', 4, 'G'),
('Student8', 3, 'H'),
('Student9', 2, 'I'),
('Student10', 1, 'J'),
('Student11', 5, 'K'),
('Student12', 4, 'L');

INSERT INTO GroupsStudents (GroupId, StudentId) VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12);

INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES
(1,1),(2,1),(3,2),(1,3),(2,3);

INSERT INTO Lectures (Date, SubjectId, TeacherId) VALUES
('2026-02-01', 1, 1),
('2026-02-02', 2, 2),
('2026-02-03', 3, 3),
('2026-02-04', 4, 4),
('2026-02-05', 1, 1),
('2026-02-06', 2, 2),
('2026-02-07', 3, 3),
('2026-02-01', 4, 4),
('2026-02-02', 1, 1),
('2026-02-03', 2, 2),
('2026-02-04', 3, 3),
('2026-02-05', 4, 4);

INSERT INTO GroupsLectures (GroupId, LectureId) VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12);