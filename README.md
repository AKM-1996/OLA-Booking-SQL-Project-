# 🚕 Ola Ride Analytics — SQL Project
This project demonstrates a comprehensive SQL-based analysis of ride booking data for Ola, focusing on customer behavior, driver performance, payment methods, and ride outcomes. It includes a series of optimized SQL views and queries designed to help managers and analysts extract actionable insights with minimal effort.
# 📂 Database Setup
CREATE DATABASE Ola;

USE Ola;

All views are created from a central bookings table, assuming it contains relevant fields such as Booking_ID, Customer_ID, Vehicle_Type, Booking_Status, Ride_Distance, Driver_Ratings, Customer_Rating, Payment_Method, Booking_Value, Incomplete_Rides, Incomplete_Rides_Reason, and cancelled_Rides_by_Driver.

# 📊 Views Created
- Successful_Bookings : Retrieves all bookings marked as successful
- ride_distance_for_each_vehicle : Calculates average ride distance per vehicle type
- cancelled_rides_by_customers : Counts rides cancelled by customers
- Top_5_Customers : Lists top 5 customers by number of rides booked
- Rides_cancelled_by_Drivers_P_C_Issues : Counts driver cancellations due to personal/car issues
- Max_Min_Driver_Rating : Finds max and min driver ratings for Prime Sedan rides
- UPI_Payment : Retrieves rides paid via UPI
- AVG_Cust_Rating : Calculates average customer rating per vehicle type
- total_successful_ride_value : Sums booking value of successful rides
- Incomplete_Rides_Reason : Lists incomplete rides with their reasons

# 📂 SQL query that I write for Retrieving Questions Answers
-- 1. Retrieve all successful bookings:
Create View Successful_Bookings As
SELECT * FROM bookings
WHERE Booking_Status = 'Success';

-- 2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle As
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings
GROUP BY Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers:
Create View cancelled_rides_by_customers As
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'cancelled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings
WHERE cancelled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';

-- 10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';


# 📌 Manager-Friendly Queries
Each view is designed for one-line retrieval, enabling managers to access insights quickly:
-- 1. Successful bookings
SELECT * FROM Successful_Bookings;

-- 2. Average ride distance by vehicle
SELECT * FROM ride_distance_for_each_vehicle;

-- 3. Cancelled rides by customers
SELECT * FROM cancelled_rides_by_customers;

-- 4. Top 5 customers by ride count
SELECT * FROM Top_5_Customers;

-- 5. Driver cancellations due to personal/car issues
SELECT * FROM Rides_cancelled_by_Drivers_P_C_Issues;

-- 6. Max and min driver ratings for Prime Sedan
SELECT * FROM Max_Min_Driver_Rating;

-- 7. Rides paid via UPI
SELECT * FROM UPI_Payment;

-- 8. Average customer rating per vehicle type
SELECT * FROM AVG_Cust_Rating;

-- 9. Total booking value of successful rides
SELECT * FROM total_successful_ride_value;

-- 10. Incomplete rides and their reasons
SELECT * FROM Incomplete_Rides_Reason;



# 🧠 Use Case
This project is ideal for:
- Business Intelligence dashboards
- Operational reporting
- Customer and driver behavior analysis
- Payment method tracking
- Ride quality and cancellation diagnostics
