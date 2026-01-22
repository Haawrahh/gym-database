USE GymDB;
GO

INSERT INTO Members (FirstName, LastName, Email) VALUES
('Anna', 'Karlsson', 'anna@mail.se'),
('Erik', 'Svensson', 'erik@mail.se'),
('Sara', 'Nilsson', 'sara@mail.se'),
('Johan', 'Andersson', 'johan@mail.se'),
('Lina', 'Berg', 'lina@mail.se');

INSERT INTO Trainers (FullName, Specialty) VALUES
('Emma Johansson', 'Yoga'),
('Daniel Persson', 'Strength'),
('Maria Lind', 'Cardio');

INSERT INTO Classes (ClassName, StartTime, TrainerId) VALUES
('Morning Yoga', '2026-02-01 08:00', 1),
('Strength Training', '2026-02-01 10:00', 2),
('Evening Cardio', '2026-02-01 18:00', 3);

INSERT INTO Memberships (MemberId, Type, MonthlyFee) VALUES
(1, 'Basic', 299),
(2, 'Premium', 499),
(3, 'Basic', 299),
(4, 'Premium', 499),
(5, 'Basic', 299);

INSERT INTO Bookings (MemberId, ClassId) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 2);

INSERT INTO Invoices (MemberId, Amount) VALUES
(1, 299),
(2, 499),
(3, 299),
(4, 499),
(5, 299);
