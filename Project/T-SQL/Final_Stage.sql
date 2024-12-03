/*
-- Drop existing College_Staging database (optional, ensures clean slate)
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'College_Completion_Staging')
  DROP DATABASE College_Completion_Staging;
GO

-- Create College_Staging database
CREATE DATABASE College_Completion_Staging;
GO
*/
-- Use College_Staging database
--CREATE DATABASE College_Completion_Staging
--USE College_Completion_Staging;
--GO

-- Create Institution table
CREATE TABLE Institution (
  unitid int,
  city varchar(50),
  state varchar(50),
  basic varchar(255),
  chronname varchar(max),
  level varchar(50),
  control varchar(50),
  hbcu bit,
  flagship smallint,
  long_x real,
  lat_y real,
  site varchar(max),
  student_count int,
  awards_per_value real,
  awards_per_state_value real,
  awards_per_natl_value real,
  exp_award_value int,
  exp_award_state_value int,
  exp_award_natl_value int,
  exp_award_percentile int,
  ft_pct real,
  fte_value int,
  fte_percentile smallint,
  med_sat_value real,
  grad_100_value real,
  grad_100_percentile real,
  grad_150_value real,
  grad_150_percentile real,
  pell_value real,
  pell_percentile real,
  retain_value real,
  retain_percentile real,
  cohort_size real
);

-- Create InstitutionGrad table
CREATE TABLE InstitutionGraduation (
  unitid int,
  year int,
  gender varchar(50),
  race varchar(50),
  cohort varchar(255),
  grad_cohort int,
  grad_100 float,
  grad_150 float,
  grad_100_rate float,
  grad_150_rate float
);

-- Create State table
CREATE TABLE State (
  state varchar(255),
  state_abbr varchar(50),
  state_post varchar(50),
  state_code varchar(50)
);

-- Create Location table
CREATE TABLE Location (
  state varchar(255),
  city varchar(50)
);

-- Create Carnegie table with auto-incrementing primary key
CREATE TABLE Carnegie (
  id int IDENTITY(1, 1) PRIMARY KEY,
  institutionType varchar(255),
  programSize varchar(255),
  basic varchar(255)
);

-- Create Cohort table
CREATE TABLE Cohort (
  cohort varchar(255),
  race varchar(50),
  gender varchar(50),
  year int
);
