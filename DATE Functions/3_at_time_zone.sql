select job_title_short as title,
job_location as location,
job_posted_date at time zone 'UTC' at time zone 'EST' as date
from job_postings_fact
limit 10;