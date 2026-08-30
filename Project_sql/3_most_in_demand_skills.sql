/* 
   Question: What are the most in_demand skills for data analysts?
   - JOin job postings to inner job table similar to query 2
   - identify the top 5 in-demand skills for a data analyst.
   - focus on all job postings
   - Why? Retrieves the top 5 skills with the highest demand in the job market, providing insights into the most valuable skills for job seekers.
*/

Select skills,
      count(*) as total_jobs
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short= 'Data Analyst' and job_work_from_home='True'
group by skills
order by total_jobs desc
limit 5
