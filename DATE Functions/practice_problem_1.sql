-- Find the average yearly salary (salary_year_avg) and average hourly salary
-- (salary_hour_avg) for jobs posted after June 1, 2023, grouped by job schedule type.

Select * from job_postings_fact
limit 10;

select job_schedule_type, avg(salary_year_avg) as avg_salary from job_postings_fact
where job_posted_date > '2023-06-01'
group by job_schedule_type
order by avg_salary desc;


select job_schedule_type, avg(salary_hour_avg) as avg_salary from job_postings_fact
where job_posted_date > '2023-06-01'
group by job_schedule_type
order by avg_salary desc;

--main solution
select job_schedule_type, avg(salary_year_avg) as avg_yearly_salary, avg(salary_hour_avg) as avg_hourly_salary from job_postings_fact
where job_posted_date > '2023-06-01'
group by job_schedule_type
order by avg_yearly_salary desc;