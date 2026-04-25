create database hr_analytics;
use hr_analytics;

SELECT COUNT(*) FROM employee_attrition;

-- 1. Overall Attrition Rate
SELECT 
COUNT(*) AS total_employees,
SUM(Attrition_Flag) AS employees_left,
ROUND(AVG(Attrition_Flag)*100,2) AS attrition_rate_percent
FROM employee_attrition;

-- 2. Attrition by Job Role
SELECT Job_Role,
COUNT(*) AS total_employees,
SUM(Attrition_Flag) AS employees_left,
ROUND(AVG(Attrition_Flag)*100,2) AS attrition_rate_percent
FROM employee_attrition
GROUP BY Job_Role
ORDER BY attrition_rate_percent DESC;

-- 3. Attrition by Salary Group
SELECT Salary_Group,
COUNT(*) AS total_employees,
ROUND(AVG(Attrition_Flag)*100,2) AS attrition_rate_percent
FROM employee_attrition
GROUP BY Salary_Group
ORDER BY attrition_rate_percent DESC;

-- 4. Overtime Impact on Attrition
SELECT Overtime,
COUNT(*) AS employees,
ROUND(AVG(Attrition_Flag)*100,2) AS attrition_rate_percent
FROM employee_attrition
GROUP BY Overtime;

-- 5. Experience Level vs Attrition
SELECT Experience_Group,
COUNT(*) AS employees,
ROUND(AVG(Attrition_Flag)*100,2) AS attrition_rate_percent
FROM employee_attrition
GROUP BY Experience_Group
ORDER BY attrition_rate_percent DESC;

-- 6. Work-Life Balance Impact
SELECT Work_Life_Balance,
COUNT(*) AS employees,
ROUND(AVG(Attrition_Flag)*100,2) AS attrition_rate_percent
FROM employee_attrition
GROUP BY Work_Life_Balance
ORDER BY Work_Life_Balance;

-- 7. Promotion Impact on Retention
SELECT Number_of_Promotions,
COUNT(*) AS employees,
ROUND(AVG(Attrition_Flag)*100,2) AS attrition_rate_percent
FROM employee_attrition
GROUP BY Number_of_Promotions
ORDER BY Number_of_Promotions;

-- 8. Average Salary of Employees Who Left vs Stayed
SELECT Attrition,
COUNT(*) AS employees,
ROUND(AVG(Monthly_Income),0) AS avg_salary
FROM employee_attrition
GROUP BY Attrition;

-- 9. Rank Job Roles by Attrition Rate
SELECT Job_Role,
COUNT(*) AS total_employees,
ROUND(AVG(Attrition_Flag)*100,2) AS attrition_rate_percent,
RANK() OVER (ORDER BY AVG(Attrition_Flag) DESC) AS attrition_rank
FROM employee_attrition
GROUP BY Job_Role;

-- 10. Attrition Rate Difference from Company Average
SELECT Salary_Group,
ROUND(AVG(Attrition_Flag)*100,2) AS group_attrition_rate,
ROUND(AVG(AVG(Attrition_Flag)) OVER()*100,2) AS company_avg_attrition,
ROUND((AVG(Attrition_Flag) - AVG(AVG(Attrition_Flag)) OVER())*100,2) AS difference_percent
FROM employee_attrition
GROUP BY Salary_Group;

-- 11. High risk segments using CTE
WITH attrition_summary AS ( SELECT Salary_Group, Overtime, Experience_Group,
ROUND(AVG(Attrition_Flag)*100,2) AS attrition_rate
FROM employee_attrition
GROUP BY Salary_Group, Overtime, Experience_Group )
SELECT *
FROM attrition_summary
WHERE attrition_rate > 40
ORDER BY attrition_rate DESC;