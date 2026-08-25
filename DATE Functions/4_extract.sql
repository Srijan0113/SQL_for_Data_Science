select job_title_short as title,
job_location as location,
job_posted_date at time zone 'UTC' at time zone 'EST' as date,
extract(month from job_posted_date) as month,
extract(year from job_posted_date) as year
from job_postings_fact
limit 10;

Select count(job_id) as total_jobs,
extract(month from job_posted_date) as month
from job_postings_fact
where job_title_short = 'Data Scientist'
group by month
order by total_jobs desc;