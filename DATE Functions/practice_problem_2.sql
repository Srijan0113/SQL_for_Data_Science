-- Count the number of job postings for each month in 2023.
-- Adjust job_posted_date from UTC to America/New_York before extracting the month.

select * from job_postings_fact
limit 10;

select count(*) as number_of_job_postings,
extract(month from job_posted_date at time zone 'UTC' at time zone 'America/New_York') as month
from job_postings_fact
where job_posted_date >= '2023-01-01' and job_posted_date < '2024-01-01'
group by month
order by month;