/* 
Question: WHat are the top paying data analyst jobs?
 - Identify the top 10 highest padying Data Analyst roles that are available remotely.
 - Focus ont job postings with specified salaries(remove  nulls)
 - Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employments skills and salary expectations in the field. This information can be valuable for job seekers looking to maximize their earning potential in the data analytics domain.
*/

Select 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
from job_postings_fact
left join company_dim ON job_postings_fact.company_id = company_dim.company_id
where job_title_short = 'Data Analyst' AND
      job_location='Anywhere' AND
      salary_year_avg IS NOT NULL 
order by salary_year_avg desc
limit 10

