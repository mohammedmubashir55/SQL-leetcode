select employee_id, department_id
from Employee
where primary_flag = 'Y'
or employee_id in (
 select employee_id
FROM Employee
group by employee_id having COUNT(*) = 1
   );
