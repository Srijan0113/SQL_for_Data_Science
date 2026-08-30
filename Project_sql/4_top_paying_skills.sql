/* 
  What are the top skills based on salary?
  - look at the avg salary associated with each skill for Data Analyst position
  - Focuses on roles with specified salaries, regardless of location
  - Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve
*/

Select skills,
       round(avg(salary_year_avg), 0) as avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short= 'Data Analyst' and 
      salary_year_avg is NOT NULL and job_work_from_home='True'
group by skills
order by  avg_salary desc
limit 30
