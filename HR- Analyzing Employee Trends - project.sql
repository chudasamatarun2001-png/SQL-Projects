create Database HR;
use Hr; 
SELECT * FROM hr.`analyzing employee trends`;


-- - 1. Count the number of employees in each department---

select department, count(*) as Employee_count
 from hr.`analyzing employee trends`
 group by department;

-- --- 2.Calculate the average age for each department ---
select department, avg(age) as Avg_age
from hr.`analyzing employee trends`
group by department;

-- ---- 3. Identify the most common job roles in each department ---
select department, job_role, count(*) as Job_Role_count
from hr.`analyzing employee trends`
group by department, job_role
order by department, Job_Role_count asc;

-- - 4. Calculate the average job satisfaction for each education level ---

select education, avg(job_satisfaction) as Average_job_satisfaction
from  hr.`analyzing employee trends`
group by education;

-- - 5.Determine the average age for employees with different levels of job satisfaction ---
select job_satisfaction, avg(age) as Average_Age
from hr.`analyzing employee trends`
group by job_satisfaction;

-- --- 6. Calculate the attrition rate for each age band --
SELECT age_band, SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS attrition_rate
FROM hr.`analyzing employee trends`
GROUP BY age_band;

-- - 7. Identify the departments with the highest and lowest average job satisfaction ---
select department, avg(job_satisfaction) as Average_Job_Satisfaction
from hr.`analyzing employee trends`
group by department
order by Average_Job_Satisfaction desc;

-- - 8. Find the age band with the highest attrition rate among employees with a specific education level---
select  education, age_band, SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS attrition_rate
FROM hr.`analyzing employee trends`
group by education, age_band 
ORDER BY attrition_rate DESC limit 1;

-- - 9.Find the education level with the highest average job satisfaction among employees who travel frequently ---

select education, business_travel, avg(job_satisfaction) as Average_Job_Statifaction
from hr.`analyzing employee trends`
where business_travel = "Travel_Frequently"
group by education
order by  Average_Job_Statifaction desc
limit 1;

-- - 10. Identify the age band with the highest average job satisfaction among married employees ----
select age_band, marital_status, avg(job_satisfaction) as Average_Job_Satisfaction
from hr.`analyzing employee trends`
where  marital_status = "Married"
group by age_band
order by Average_Job_Satisfaction desc
limit 3;




