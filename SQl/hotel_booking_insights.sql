-- Cancellation rate by hotel
SELECT hotel, 
       ROUND(SUM(is_canceled)/COUNT(*) * 100, 2) AS cancellation_rate
FROM hotel_cleaned
GROUP BY hotel;

-- Average daily rate by month
SELECT arrival_date_month, 
       ROUND(AVG(adr), 2) AS avg_rate
FROM hotel_cleaned
GROUP BY arrival_date_month
ORDER BY avg_rate desc;

-- Bookings by lead time buckets
SELECT CASE 
         WHEN lead_time < 30 THEN '0-29 days'
         WHEN lead_time < 90 THEN '30-89 days'
         ELSE '90+ days'
       END AS lead_time_group,
       COUNT(*) AS bookings
FROM hotel_cleaned
GROUP BY lead_time_group
ORDER BY lead_time_group desc;