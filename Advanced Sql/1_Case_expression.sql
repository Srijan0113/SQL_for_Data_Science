-- a case expression is used to evaluate a list of conditions and return one of multiple possible result expressions. It is similar to an IF-THEN-ELSE statement in programming languages.

/* Syntax:
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE resultN
END
*/

Select count(job_id) as number_of_jobs,
 case
   when job_location='Anywhere' then 'Remote'
   when job_location='New York, NY' then 'Local'
   Else 'Onsite'
   
End as location_category --new column name 
from job_postings_fact
where job_title_short='Data Analyst'
group by location_category;
