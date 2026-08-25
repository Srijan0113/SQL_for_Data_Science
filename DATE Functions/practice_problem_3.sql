-- Find companies (including the company name) that posted jobs offering health insurance
-- during Q2 (second quarter) of 2023. Use date extraction to filter by quarter.

Select name, job_title, job_posted_date from company_dim as c
join job_postings_fact as j
on c.company_id = j.company_id
where extract(quarter from j.job_posted_date) = 2
and extract(year from j.job_posted_date) = 2023
and job_health_insurance= True;

