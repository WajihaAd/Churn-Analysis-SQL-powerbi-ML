create view vw_churn_data as
select * from dbo.prod_churn  where Customer_Status in ('Churned' , 'Stayed')

create view vw_join_data as
select * from dbo.prod_churn  where Customer_Status = 'Joined'

