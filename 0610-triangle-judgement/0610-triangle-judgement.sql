-- Write your PostgreSQL query statement below
select  x,y,z,
case  when x + y > z 
and x + z > y 
and y + z > x 
then  'Yes'ELSE 'No'
end as triangle
from Triangle;
