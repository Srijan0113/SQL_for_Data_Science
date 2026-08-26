-- Subqueries are queries nested inside another query. They can be used in various clauses like SELECT, FROM, and WHERE. In this example, we will use a subquery in the WHERE clause to filter companies based on job postings that mention no degree.

select company_id, name as company_name
from company_dim
where 
company_id in (
    select company_id
    from job_postings_fact
    where job_no_degree_mention= TRUE
    order by company_id
)

/*
select company_id
    from job_postings_fact
    where job_no_degree_mention= TRUE
    order by company_id

This gives duplicate values for company_id because there are multiple job postings for the same company that mention no degree. but running the whole query will give us unique company_id values because we are using the IN operator which will filter out duplicates.


So, we saw that subqueries can be used to filter data based on the results of another query. In this case, we are selecting company IDs and names from the company_dim table where the company ID exists in the results of a subquery that checks for job postings mentioning no degree.

*/