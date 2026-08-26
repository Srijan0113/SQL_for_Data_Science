/* CTEs are Common Table Expressions, which are temporary result sets that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement. They are defined using the WITH clause and can help simplify complex queries by breaking them down into more manageable parts. CTEs can also be recursive, allowing for hierarchical data processing. */

-- find companies with most job openings

with company_job_count as (
select company_id, count(*) as total_jobs
from job_postings_fact
group by company_id )

select company_dim.name as company_name,
company_job_count.total_jobs
from company_dim 
left join company_job_count on company_dim.company_id = company_job_count.company_id
order by total_jobs desc;

