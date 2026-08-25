Select max(salary_year_avg),min(salary_year_avg),avg(salary_year_avg)
from job_postings_fact
where salary_year_avg is not null
limit 1000;

Select job_title_short, salary_year_avg,
case
when salary_year_avg>= 150000 then 'High Salary'
when salary_year_avg>= 70000 then 'Medium Salary'
Else 'Low Salary'
End as salary_category
from job_postings_fact
where job_title_short='Data Analyst' and salary_year_avg is not null
order by 
case
when salary_year_avg>= 150000 then 1
when salary_year_avg>= 70000 then 2
Else 3
End;