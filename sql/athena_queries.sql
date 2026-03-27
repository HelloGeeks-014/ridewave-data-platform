-- Standard Query 1: Which city has most rides and revenue?
-- Business use: Operations team tracks city performance daily
SELECT
    city,
    COUNT(*)                   AS total_rides,
    ROUND(SUM(fare_amount), 2) AS total_revenue
FROM ridewave_raw_YOUR_NAME.rides
WHERE fare_amount IS NOT NULL
GROUP BY city
ORDER BY total_rides DESC;

-- Standard Query 2: What is the ride status breakdown?
-- Business use: Operations monitors cancellation rates
SELECT
    ride_status,
    COUNT(*) AS count
FROM ridewave_raw_YOUR_NAME.rides
GROUP BY ride_status
ORDER BY count DESC;

-- Standard Query 3: Top 5 earners (drivers)
-- Business use: Incentive and rewards programme
SELECT
    driver_id,
    COUNT(*)                   AS total_rides,
    ROUND(SUM(fare_amount), 2) AS total_earned
FROM ridewave_raw_YOUR_NAME.rides
WHERE fare_amount IS NOT NULL
GROUP BY driver_id
ORDER BY total_earned DESC
LIMIT 5;