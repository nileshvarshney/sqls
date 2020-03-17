-- mysql (split a comma seperated script )

with recursive cte(n) as 
( 
	select 1 as n
	union all
	select n +1 from cte where n < 5
)
select  c.addressline1, 
        substring_index(substring_index(c.addressline1,',',n),',',-1) as address_values 
from cte inner join customers c 
on (cte.n <= (length(c.addressline1) - length(replace(c.addressline1,',','')))+1)
order by c.addressline1;
					     
-- postgres
select regexp_split_to_table('red,green,blue',',');
					     

					      
