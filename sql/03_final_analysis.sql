/*
Project: Cyclistic Bike-Share Case Study
Purpose: Final analysis and business insights
Dataset: Cyclistic bike-share (12 months)
Author: Luis Melo
*/

-- =====================================================
-- 1. Peak usage by user type
-- =====================================================

SELECT
  member_casual,
  COUNT(*) AS total_rides
FROM cyclistic_trips
WHERE day_of_week IN ('Saturday', 'Sunday')
GROUP BY member_casual;

-- =====================================================
-- 2. Average ride duration on weekends
-- =====================================================

SELECT
  member_casual,
  AVG(ride_length_minutes) AS avg_ride_duration_weekend
FROM cyclistic_trips
WHERE day_of_week IN ('Saturday', 'Sunday')
GROUP BY member_casual;

-- =====================================================
-- 3. Long rides analysis (potential leisure usage)
-- =====================================================

SELECT
  member_casual,
  COUNT(*) AS long_rides
FROM cyclistic_trips
WHERE ride_length_minutes > 30
GROUP BY member_casual;

-- =====================================================
-- 4. Key insight preparation
-- =====================================================

-- Casual riders tend to take longer rides and use bikes more on weekends
-- Members show more consistent usage throughout the week
