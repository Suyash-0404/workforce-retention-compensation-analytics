CREATE EXTERNAL TABLE `employee_attrition`(
  `employee_id` int, 
  `age` int, 
  `gender` string, 
  `marital_status` string, 
  `department` string, 
  `job_role` string, 
  `job_level` int, 
  `monthly_income` int, 
  `hourly_rate` int, 
  `years_at_company` int, 
  `years_in_current_role` int, 
  `years_since_last_promotion` int, 
  `work_life_balance` int, 
  `job_satisfaction` int, 
  `performance_rating` int, 
  `training_hours_last_year` int, 
  `overtime` string, 
  `project_count` int, 
  `average_hours_worked_per_week` int, 
  `absenteeism` int, 
  `work_environment_satisfaction` int, 
  `relationship_with_manager` int, 
  `job_involvement` int, 
  `distance_from_home` int, 
  `number_of_companies_worked` int, 
  `attrition` string)
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ',' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://hr-analysis-suyash/'
TBLPROPERTIES (
  'classification'='csv', 
  'transient_lastDdlTime'='1791280757')
