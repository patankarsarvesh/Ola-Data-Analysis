/* 1. Retrieve all successful bookings:
 2. Find the average ride distance for each vehicle type:
 3. Get the total number of cancelled rides by customers:
 4. List the top 5 customers who booked the highest number of rides:
 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 7. Retrieve all rides where payment was made using UPI:
 8. Find the average customer rating per vehicle type:
 9. Calculate the total booking value of rides completed successfully:
 10. List all incomplete rides along with the reason*/
 
create view successful_bookings as 
select * from Bookingsola where Booking_Status = 'Success';

create view avgvehicledistance as
select Vehicle_Type, avg(Ride_Distance) from Bookingsola group by 1;

create view numofcancbycus as 
select count(Canceled_Rides_by_Customer) from Bookingsola;

create view Highcustomer as
select Customer_ID , count(*) from Bookingsola group by 1 order by 2 desc limit 5 ;

create view cancbydriverpersonal as 
select count(Canceled_Rides_by_Driver) from Bookingsola where Canceled_Rides_by_Driver = 'Personal & Car related issue';

create view sedanratings as
select max(Driver_Ratings), min(Driver_Ratings) from Bookingsola where Vehicle_Type = 'Prime Sedan' ;

create view UPIpayment as 
select * from Bookingsola where Payment_Method = 'UPI';

create view avgvehiclecusrating as
select Vehicle_Type, avg(Customer_Rating) from Bookingsola group by 1;

create view totalbookingforcompleterides as 
select sum(Booking_Value) from Bookingsola where Incomplete_Rides_Reason is null ;

create view incompleterides as 
select Booking_ID, Incomplete_Rides_Reason from Bookingsola where Incomplete_Rides_Reason is not null ;