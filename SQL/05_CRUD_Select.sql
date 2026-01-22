SELECT * FROM Members;

SELECT 
    Classes.ClassName,
    Trainers.FullName
FROM Classes
JOIN Trainers ON Classes.TrainerId = Trainers.TrainerId;

SELECT 
    Members.FirstName,
    Members.LastName,
    Classes.ClassName
FROM Bookings
JOIN Members ON Bookings.MemberId = Members.MemberId
JOIN Classes ON Bookings.ClassId = Classes.ClassId;
