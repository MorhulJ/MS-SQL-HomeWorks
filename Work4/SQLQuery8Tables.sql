CREATE TABLE Faculties (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL CHECK (LEN(Name) > 0) UNIQUE
);
GO

CREATE TABLE Departments (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Financing MONEY NOT NULL CHECK (Financing >= 0) DEFAULT 0,
    Name NVARCHAR(100) NOT NULL CHECK (LEN(Name) > 0) UNIQUE,
    FacultyId INT NOT NULL,

    FOREIGN KEY (FacultyId) REFERENCES Faculties(Id)
);
GO

CREATE TABLE Groups (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(10) NOT NULL CHECK (LEN(Name) > 0) UNIQUE,
    Year INT NOT NULL CHECK (Year BETWEEN 1 AND 5),
    DepartmentId INT NOT NULL,

    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);
GO

CREATE TABLE Teachers (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(MAX) NOT NULL CHECK (LEN(Name) > 0),
    Salary MONEY NOT NULL CHECK (Salary > 0),
    Surname NVARCHAR(MAX) NOT NULL CHECK (LEN(Surname) > 0)
);
GO

CREATE TABLE Subjects (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL CHECK(LEN(Name) > 0) UNIQUE
);
GO

CREATE TABLE Lectures (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    DayOfWeek INT NOT NULL CHECK (DayOfWeek BETWEEN 1 AND 7),
    LectureRoom NVARCHAR(MAX) NOT NULL CHECK(LEN(LectureRoom) > 0),
    SubjectId INT NOT NULL,
    TeacherId INT NOT NULL,

    FOREIGN KEY (SubjectId) REFERENCES Subjects(Id),
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);
GO

CREATE TABLE Students (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL CHECK (LEN(Name) > 0),
    Surname NVARCHAR(100) NOT NULL CHECK (LEN(Surname) > 0),
    GroupId INT NOT NULL,
    FOREIGN KEY (GroupId) REFERENCES Groups(Id)
);
GO

CREATE TABLE GroupsLectures (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    GroupId INT NOT NULL,
    LectureId INT NOT NULL,

    FOREIGN KEY (GroupId) REFERENCES Groups(Id),
    FOREIGN KEY (LectureId) REFERENCES Lectures(Id)
);

--Увага: Інсерти створені штучним інтелектом!!!

INSERT INTO Faculties (Name)
VALUES 
('Computer Science'),
('Business');

INSERT INTO Departments (Name, Financing, FacultyId)
VALUES
('Software Development', 100000, 1),
('Artificial Intelligence', 150000, 1),
('Marketing', 80000, 2);

INSERT INTO Groups (Name, Year, DepartmentId)
VALUES
('SD-21', 2, 1),
('SD-31', 3, 1),
('AI-11', 1, 2),
('MK-11', 1, 3);

INSERT INTO Teachers (Name, Surname, Salary)
VALUES
('Dave', 'McQueen', 3000),
('Jack', 'Underhill', 3500),
('Emma', 'Stone', 2800),
('John', 'Carter', 2500);

INSERT INTO Subjects (Name)
VALUES
('C# Programming'),
('Databases'),
('Machine Learning'),
('Marketing Basics');

INSERT INTO Lectures (DayOfWeek, LectureRoom, SubjectId, TeacherId)
VALUES
(1, 'D201', 1, 1),
(2, 'D201', 2, 1),
(3, 'A101', 2, 2),
(4, 'B202', 3, 3),
(5, 'D201', 1, 2),
(1, 'C303', 4, 4),
(2, 'A101', 3, 3);

INSERT INTO GroupsLectures (GroupId, LectureId)
VALUES
(1,1),
(1,2),
(2,1),
(2,3),
(3,4),
(1,5),
(4,6),
(3,7);

INSERT INTO Students (Name, Surname, GroupId)
VALUES
('Ivan','Petrenko',1),
('Oleh','Shevchenko',1),
('Anna','Koval',1),
('Max','Bondar',2),
('Ira','Tkachenko',2),
('Den','Melnyk',3),
('Olga','Kravets',3),
('Taras','Polishchuk',3),
('Nadia','Boyko',3),
('Roman','Lysenko',4);