-- CREATE DATABASE OLA;
USE OLA;
-- 1. Retrieve all successful bookings:
CREATE VIEW Successful_booking As
SELECT *FROM Bookings 
WHERE Booking_Status='Success';
-- same in view form for execute for the manager 
select*from Successful_booking;

-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW Average_distance As
SELECT Vehicle_Type,AVG(Ride_Distance) AS
Avg_distance FROM Bookings 
Group By Vehicle_Type;
-- same in view form for execute for the manager
SELECT* FROM Average_distance;

-- 3. Get the total number of cancelled rides by customers:
SELECT COUNT(*) FROM Bookings 
WHERE Booking_Status='Canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Highest_booking As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings
GROUP BY Customer_ID 
ORDER BY total_rides DESC LIMIT 5;
-- same in view form for execute for the manager
SELECT *FROM Highest_booking;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW Canceled_booking_by_drivers As
SELECT COUNT(*) FROM Bookings 
WHERE Canceled_Rides_by_Driver='Personal & Car related issue';
-- same method in view form for execute for the manager
SELECT * FROM Canceled_booking_by_drivers;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM Bookings
WHERE Vehicle_Type='Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_payment As
SELECT*FROM Bookings
WHERE Payment_Method='UPI';
-- same method in view form for execute for the manager
SELECT*FROM UPI_payment;

-- 8. Find the average customer rating per vehicle type:
SELECT Vehicle_Type,AVG(Customer_Rating) AS Avg_Customer_ratings FROM Bookings
GROUP BY Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
SELECT SUM(Booking_Value) as total_booking_value FROM Bookings
WHERE Booking_Status='Success';

-- 10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_rides As
SELECT Booking_ID,Incomplete_Rides_Reason FROM Bookings 
WHERE Incomplete_Rides='Yes';
-- same method in view form for execute for the manager
SELECT*FROM Incomplete_rides;