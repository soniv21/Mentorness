use hotel_res;

-- Total no of resevations
SELECT COUNT(Booking_ID) AS total_reservations
FROM `hotel reservation dataset`;

-- popular meal plan
SELECT type_of_meal_plan, COUNT(type_of_meal_plan) AS meal_plan_count
FROM `hotel reservation dataset`
GROUP BY type_of_meal_plan
ORDER BY meal_plan_count DESC
LIMIT 1;

-- average price per room for reservations involving children
select avg(avg_price_per_room) from `hotel_res`.`hotel reservation dataset`  where no_of_children != 0;

-- Count the number of reservations for the year 2023
SELECT COUNT(Booking_ID) AS total_reservations_2018
FROM `hotel reservation dataset`
WHERE YEAR(arrival_date) = 2018;

-- most commonly booked room type
select room_type_reserved, count(room_type_reserved) as most_common_room
 FROM `hotel reservation dataset`
GROUP BY room_type_reserved
ORDER BY most_common_room DESC
LIMIT 1;

-- reservations fall on a weekend
select count(no_of_weekend_nights) as reservations_on_weekend_night
FROM `hotel reservation dataset` 
where no_of_weekend_nights > 0;

-- highest lead 
SELECT 
    MAX(lead_time) AS highest_lead_time,
    MIN(lead_time) AS lowest_lead_time
FROM 
    `hotel reservation dataset`;

-- most common market segment
select market_segment_type, count( market_segment_type) as count
FROM `hotel reservation dataset`  
group by market_segment_type
order by count desc 
limit 1;

-- reservations have a booking status of "Confirmed"
select count(booking_status) as Confirmed
FROM `hotel reservation dataset` 
where booking_status  like 'Not_Canceled';

-- total number of adults and children across all reservations
select sum(no_of_adults) as Adults, sum(no_of_children) as Children
FROM `hotel reservation dataset` ;

-- average number of weekend nights for reservations involving children
select avg(no_of_week_nights) as weekend_nights_for_reservations_involving_children
FROM `hotel reservation dataset`
where no_of_children > 0;

-- Count the number of reservations made in each month of each year
SELECT 
    YEAR(arrival_date) AS year,
    MONTH(arrival_date) AS month,
    COUNT(Booking_ID) AS total_reservations
FROM 
    `hotel reservation dataset`
GROUP BY 
    YEAR(arrival_date), MONTH(arrival_date)
ORDER BY 
    year, month;

-- average no nights for each room type
select  room_type_reserved as room_type,avg(no_of_weekend_nights)+ avg(no_of_week_nights) as total_nights
FROM `hotel reservation dataset`
group by room_type
order by room_type ;

-- Most common room for childeren and price
select room_type_reserved,
    SUM(no_of_children) AS total_children,
    AVG(avg_price_per_room) AS average_price_per_room
FROM `hotel reservation dataset`
group by room_type_reserved
order by total_children desc
limit 1;

-- most common segment type
select market_segment_type as market_segment, avg(avg_price_per_room) as avg_price
FROM `hotel reservation dataset`
group by market_segment
order by avg_price Desc
limit 1;




