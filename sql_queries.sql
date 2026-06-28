Create Database Uber;
use Uber;
select * from Booking;
#1.Retrive all successful Bookings:
Create view Successful_Booking as
select * from booking
where Booking_Status = 'Success'; 

select * from Successful_Booking;

#2. Find the average ride distance for each vehicle type:
Create view ride_distance_for_each_vehicle as
select vehicle_type, avg(ride_distance)
as avg_distance from booking
group by vehicle_type;

SELECT * FROM ride_distance_for_each_vehicle;

#3. Get the total number of canceled rides by customer:
Create view canceled_rides_by_customers as
select count(*) from booking
where booking_status='Canceled by customer';

select * from canceled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
Create view top_5_customers as
select Customer_ID, count(Booking_ID) AS total_rides from booking
group by customer_ID
order by total_rides desc limit 5;

select * from top_5_customers;

#5. Get the number of rides canceled by drivers due to personal and car-related issues:
Create view canceled_by_drivers_p_c_issues as
select count(*) from booking c
where canceled_rides_by_driver = 'Personal & Car related issue';

select * from canceled_by_drivers_p_c_issues;

#. Find the maximum and minimum driver ratings for prime sedan bookings:
Create view max_min_driver_rating as
select max(driver_ratings) as max_Rating,
min(driver_ratings) as min_rating from booking
where vehicle_type='Prime Sedan';

select * from max_min_driver_rating;

#7. Retrive all rides where payment was made using UPI:
Create view UPI_Payment as
SELECT * from booking 
where payment_method='UPI';

select * from UPI_Payment;

#8. Find the average customer rating per vehicle type:
Create view avg_cust_rating as
select vehicle_type, avg(customer_rating) as avg_customer_rating from booking
group by vehicle_type;

select * from avg_cust_rating;

#9. Calculate the total booking value of completed successfully:
Create view total_successful_ride_value as
select sum(booking_value) as total_successful_value from booking
where booking_status='Success';

select * from total_successful_ride_value;

#10. List all incomplete rides along with the reason:
Create view Incomplete_Rides_Reason as
select booking_id, incomplete_rides_reason from booking
where incomplete_rides='Yes';

select * from Incomplete_Rides_Reason;