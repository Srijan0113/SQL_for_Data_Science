/* 
find job postings from the first quarter that have a salary greater than $70k
-combine job posting tables form the first quarter of 2023(jan-mar)
-get job postings with an average yearly salary> $70k

*/

select 
    job_title_short, job_location, 
    job_via,
    job_posted_date::date,
    salary_year_avg 
from 
(
    Select * from january_jobs
    union all 
    select * from february_jobs
    union all
    select * from march_jobs
) as first_quarter_jobs

where
    salary_year_avg>70000 and  job_title_short='Data Analyst'
order by 
    salary_year_avg desc