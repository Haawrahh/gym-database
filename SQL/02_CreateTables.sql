USE GymDB;
GO

CREATE TABLE Members (
    MemberId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    JoinDate DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Trainers (
    TrainerId INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Specialty NVARCHAR(100) NOT NULL
);

CREATE TABLE Classes (
    ClassId INT IDENTITY(1,1) PRIMARY KEY,
    ClassName NVARCHAR(100) NOT NULL,
    StartTime DATETIME NOT NULL,
    TrainerId INT NOT NULL,
    CONSTRAINT FK_Classes_Trainers
        FOREIGN KEY (TrainerId) REFERENCES Trainers(TrainerId)
);

CREATE TABLE Memberships (
    MembershipId INT IDENTITY(1,1) PRIMARY KEY,
    MemberId INT NOT NULL UNIQUE,
    Type NVARCHAR(50) NOT NULL,
    MonthlyFee DECIMAL(10,2) NOT NULL CHECK (MonthlyFee > 0),
    CONSTRAINT FK_Memberships_Members
        FOREIGN KEY (MemberId) REFERENCES Members(MemberId)
);

CREATE TABLE Bookings (
    BookingId INT IDENTITY(1,1) PRIMARY KEY,
    MemberId INT NOT NULL,
    ClassId INT NOT NULL,
    BookingDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Bookings_Members
        FOREIGN KEY (MemberId) REFERENCES Members(MemberId),
    CONSTRAINT FK_Bookings_Classes
        FOREIGN KEY (ClassId) REFERENCES Classes(ClassId),
    CONSTRAINT UQ_Member_Class UNIQUE (MemberId, ClassId)
);

CREATE TABLE Invoices (
    InvoiceId INT IDENTITY(1,1) PRIMARY KEY,
    MemberId INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount > 0),
    IsPaid BIT NOT NULL DEFAULT 0,
    InvoiceDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Invoices_Members
        FOREIGN KEY (MemberId) REFERENCES Members(MemberId)
);
