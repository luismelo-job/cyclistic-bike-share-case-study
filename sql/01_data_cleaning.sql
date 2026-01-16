/*
Project: Cyclistic Bike-Share Case Study
Purpose: Data cleaning and preparation
Dataset: Cyclistic bike-share (12 months)
Author: Luis Melo
*/

-- =====================================================
-- 1. Initial data inspection
-- =====================================================

-- Check total number of records
SELECT COUNT(*) AS total_records
FROM cyclistic_trips;

-- =====================================================
-- 2. Remove invalid ride durations
-- =====================================================

-- Remove trips with negative or zero duration
DELETE FROM cyclistic_trips
WHERE ride_length <= 0;

-- =====================================================
-- 3. Handle missing values
-- =====================================================

-- Check missing values in key columns
SELECT
  COUNTIF(started_at IS NULL) AS missing_started_at,
  COUNTIF(ended_at IS NULL) AS missing_ended_at,
  COUNTIF(member_casual IS NULL) AS missing_user_type
FROM cyclistic_trips;

-- =====================================================
-- 4. Feature engineering
-- =====================================================

-- Create ride_length in minutes
ALTER TABLE cyclistic_trips
ADD COLUMN ride_length_minutes FLOAT64;

UPDATE cyclistic_trips
SET ride_length_minutes = TIMESTAMP_DIFF(ended_at, started_at, MINUTE);

-- Create day of week column
ALTER TABLE cyclistic_trips
ADD COLUMN day_of_week STRING;

UPDATE cyclistic_trips
SET day_of_week = FORMAT_TIMESTAMP('%A', started_at);
