select job_title_short, job_location, company_id 
from january_jobs

UNION all

select job_title_short, job_location, company_id 
from february_jobs

union all
select job_title_short, job_location, company_id
from march_jobs