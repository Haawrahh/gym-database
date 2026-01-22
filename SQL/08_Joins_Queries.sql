SELECT 
    Trainers.FullName,
    COUNT(Bookings.BookingId) AS TotalBookings
FROM Trainers
JOIN Classes ON Trainers.TrainerId = Classes.TrainerId
JOIN Bookings ON Classes.ClassId = Bookings.ClassId
GROUP BY Trainers.FullName;
