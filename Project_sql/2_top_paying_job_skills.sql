/*
  Question: What skills are required for the top paying data analyst jobs?
  - Use the top 10 highest paying Data Analyst roles identified in the previous query.
  - Add the specific skills required for these roles
  - Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand the qualifications needed to secure these lucrative positions.
  */

With top_paying_jobs as (

    Select 
        job_id,
        job_title,
        salary_year_avg,
        name as company_name
    from job_postings_fact
    left join company_dim ON job_postings_fact.company_id = company_dim.company_id
    where job_title_short = 'Data Analyst' AND
        job_location='Anywhere' AND
        salary_year_avg IS NOT NULL 
    order by salary_year_avg desc
    limit 10

)

Select top_paying_jobs.*,
       skills
from top_paying_jobs
inner join skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
order by 
salary_year_avg desc



/*
Skills Breakdown:
- SQL appeared in all top-paying Data Analyst roles.
- Python and Tableau were the next most in-demand skills.
- R, Excel, Pandas, and Snowflake also appeared frequently.
- Cloud and database technologies such as AWS, Azure, and Oracle
  were required in several roles.

Key Insight:
SQL, Python, and Tableau form the strongest core skill combination
for high-paying Data Analyst positions.
*/