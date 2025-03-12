-- What is the total count and percentage distribution of each Gender in the dataset?
select Gender , count(Gender) as 'Total_Count',
CAST(ROUND((COUNT(Gender) * 100.0 / (SELECT COUNT(*) FROM dbo.stg_churn)), 2) AS DECIMAL(10,2)) AS Percentage
from dbo.stg_churn 
group by Gender;


--  What is the total count and percentage distribution of each Contract type in the dataset?
select Contract , count(Contract) as Total_count , 
CAST(ROUND((COUNT(Contract) * 100.0 / (SELECT COUNT(*) FROM dbo.stg_churn)), 2) AS DECIMAL(10,2))AS Percentage 
from dbo.stg_churn 
group by Contract


-- What is the total count of customers, total revenue, and the percentage contribution of total revenue for each Customer_Status (Stayed, Joined, Churned)?"
select Customer_Status , count(Customer_Status) as Total_count,SUM(Total_Revenue) as TotalRev,
CAST(ROUND((SUM(Total_Revenue) * 100.0 / (SELECT SUM(Total_Revenue) FROM dbo.stg_churn)), 2) AS DECIMAL(10,2))AS Percentage 
from dbo.stg_churn 
group by Customer_Status 


--What is the total count and percentage distribution of customers across different states?
select top 5
state , count(state) as Total_Count , 
CAST(ROUND((count(state) * 100.0 / (SELECT count(state) FROM dbo.stg_churn)), 2) AS DECIMAL(10,2))AS Percentage
from dbo.stg_churn
group by state
order by percentage desc

select distinct(Internet_Type) from dbo.stg_churn


--What is the total count of customers per state, and what is the percentage share of each state relative to the
--total customer base?"
SELECT TOP 8 
    State, 
    COUNT(Customer_ID) AS Total_Customers, 
    CAST(ROUND(COUNT(Customer_ID) * 100.0 / (SELECT COUNT(*) FROM dbo.stg_churn), 2) AS DECIMAL(10,2)) AS Percentage
FROM dbo.stg_churn
GROUP BY State
ORDER BY Percentage desc

USE db_churn;
GO
SELECT * FROM dbo.stg_churn;

--What is the average age of customers grouped by their Customer_Status?
select Customer_Status , avg(age) as Average_Age
from dbo.stg_churn
group by Customer_Status


-- For each Customer_Status, what are the minimum, maximum, and average Tenure_in_Months?"
select Customer_Status,
min(Tenure_in_Months) as min_tenure, max(Tenure_in_Months) as max_tenure,avg(Tenure_in_Months) as avg_tenure
from dbo.stg_churn
group by  Customer_Status






