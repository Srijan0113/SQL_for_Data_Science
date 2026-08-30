/*
  What are the most optimal skills to learn (aka it's in high demand and a high paying skill)?
  - identify skills in high demand and associated with high avg salaries for Data Analyst roles
  - Concentrates on remote position with specified salaries
  - Why? Targets skills that offer job security(high demand) and financial benefits(high salaries), offering strategic insights for career development in data analysis
*/

With skills_demand as (
    Select skills_dim.skill_id,
           skills_dim.skills,
           count(*) as demand_count
    from job_postings_fact
    inner join 
    skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    inner join 
    skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    where 
    job_title_short= 'Data Analyst' and job_work_from_home='True' AND
    salary_year_avg is NOT NULL
    group by 
    skills_dim.skill_id
),
avg_salary as (

    Select skills_job_dim.skill_id,
           round(avg(salary_year_avg), 0) as avg_salary
    from 
    job_postings_fact
    inner join
     skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    inner join 
    skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    where 
        job_title_short= 'Data Analyst' and 
        salary_year_avg is NOT NULL and job_work_from_home='True'
    group by 
    skills_job_dim.skill_id
)

select
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
from
    skills_demand
inner join 
    avg_salary on skills_demand.skill_id=avg_salary.skill_id
where demand_count>10
order BY
    demand_count DESC,
    avg_salary desc
limit 30;


-- Rewriting all this in a single query
select skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count,
    round(avg(job_postings_fact.salary_year_avg),0) as avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short='Data Analyst' 
    and salary_year_avg IS NOT NULL
    and job_work_from_home= TRUE
group by skills_dim.skill_id
having count(skills_job_dim.job_id)>10
order BY
    demand_count desc,
    avg_salary DESC
limit 30

