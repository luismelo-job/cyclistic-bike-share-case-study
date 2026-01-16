/*
Project: Cyclistic Bike-Share Case Study
Purpose: Exploratory data analysis
Dataset: Cyclistic bike-share (12 months)
Author: Luis Melo
*/

-- =====================================================
-- 1. Ride volume by user type
-- =====================================================

SELECT
  member_casual,
  COUNT(*) AS total_rides
FROM cyclistic_trips
GROUP BY member_casual
ORDER BY total_rides DESC;

-- =====================================================
-- 2. Average ride duration by user type
-- =====================================================

SELECT
  member_casual,
  AVG(ride_length_minutes) AS avg_ride_duration_minutes
FROM cyclistic_trips
GROUP BY member_casual;

-- =====================================================
-- 3. Ride volume by day of week
-- =====================================================

SELECT
  day_of_week,
  COUNT(*) AS total_rides
FROM cyclistic_trips
GROUP BY day_of_week
ORDER BY total_rides DESC;

-- =====================================================
-- 4. Ride volume by user type and day of week
-- =====================================================

SELECT
  member_casual,
  day_of_week,
  COUNT(*) AS total_rides
FROM cyclistic_trips
GROUP BY member_casual, day_of_week
ORDER BY member_casual, total_rides DESC;
