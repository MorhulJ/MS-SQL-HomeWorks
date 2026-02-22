CREATE TABLE Faculties (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Financing MONEY NOT NULL DEFAULT 0 CHECK (Financing >= 0),
    Name NVARCHAR(100) NOT NULL CHECK (LEN(Name) > 0) UNIQUE
);

CREATE TABLE Departments (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Financing MONEY NOT NULL DEFAULT 0 CHECK (Financing >= 0),
    Name NVARCHAR(100) NOT NULL CHECK (LEN(Name) > 0) UNIQUE,
    FacultyId INT NOT NULL,

    FOREIGN KEY (FacultyId) 
    REFERENCES Faculties(Id)
);

CREATE TABLE Curators(
	Id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Name NVARCHAR(MAX) NOT NULL CHECK (LEN(Name) > 0), 
	Surname NVARCHAR(MAX) NOT NULL CHECK (LEN(Surname) > 0)
);

CREATE TABLE Groups (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name NVARCHAR(10) NOT NULL CHECK (LEN(Name) > 0) UNIQUE,
    Year INT NOT NULL CHECK (Year BETWEEN 1 AND 5),
    DepartmentId INT NOT NULL,

    FOREIGN KEY (DepartmentId) 
    REFERENCES Departments(Id)
);

CREATE TABLE Teachers (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name NVARCHAR(MAX) NOT NULL CHECK (LEN(Name) > 0),
    Surname NVARCHAR(MAX) NOT NULL CHECK (LEN(Surname) > 0),
    Salary MONEY NOT NULL CHECK (Salary > 0)
);

CREATE TABLE Subjects (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL CHECK (LEN(Name) > 0) UNIQUE
);

CREATE TABLE Lectures (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    LectureRoom NVARCHAR(MAX) NOT NULL CHECK (LEN(LectureRoom) > 0),
    SubjectId INT NOT NULL,
    TeacherId INT NOT NULL,

    FOREIGN KEY (SubjectId) 
    REFERENCES Subjects(Id),

    FOREIGN KEY (TeacherId) 
    REFERENCES Teachers(Id)
);

CREATE TABLE GroupsCurators (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CuratorId INT NOT NULL,
    GroupId INT NOT NULL,

    FOREIGN KEY (CuratorId) 
    REFERENCES Curators(Id),

    FOREIGN KEY (GroupId) 
    REFERENCES Groups(Id)
);

CREATE TABLE GroupsLectures (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    GroupId INT NOT NULL,
    LectureId INT NOT NULL,

    FOREIGN KEY (GroupId) 
    REFERENCES Groups(Id),

    FOREIGN KEY (LectureId) 
    REFERENCES Lectures(Id)
);

INSERT INTO Faculties (Financing, Name) VALUES
(100000, N'Комп''ютерні науки'),
(200000, N'Інженерія'),
(150000, N'Математика');

INSERT INTO Departments (Financing, Name, FacultyId) VALUES
(120000, N'Програмування', 1),
(30000, N'Інженерні системи', 2),
(40000, N'Алгебра', 3);

INSERT INTO Curators (Name, Surname) VALUES
('Ivan', 'Petrenko'),
('Olga', 'Shevchenko'),
('Andrii', 'Koval');

INSERT INTO Groups (Name, Year, DepartmentId) VALUES
('P107', 1, 1),
('P205', 2, 1),
('E301', 3, 2),
('M501', 5, 3);

INSERT INTO Teachers (Name, Surname, Salary) VALUES
('Samantha', 'Adams', 5000),
('John', 'Smith', 4500),
('Emily', 'Clark', 4700);

INSERT INTO Subjects (Name) VALUES
(N'Теорія баз даних'),
(N'Алгоритми'),
(N'Вища математика');

INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES
('B103', 1, 1),
('A201', 2, 2),
('B103', 3, 3);

INSERT INTO GroupsLectures (GroupId, LectureId) VALUES
(1, 1),
(2, 2),
(4, 3);

INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES
(1, 1),
(2, 2),
(3, 4);