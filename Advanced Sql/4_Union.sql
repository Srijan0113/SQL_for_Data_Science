-- Union combines the results of two or more SELECT statements into a single result set. Each SELECT statement within the UNION must have the same number of columns in the result sets with similar data types. It gets rid of duplicate records (only distinct values are selected). To allow duplicate values, use UNION ALL.

select job_title_short, job_location, company_id 
from january_jobs

UNION

select job_title_short, job_location, company_id 
from february_jobs

union
select job_title_short, job_location, company_id
from march_jobs