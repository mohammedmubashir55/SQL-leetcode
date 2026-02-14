-- Write your PostgreSQL query statement below
SELECT 
    d.name AS "Department",
    e.name AS "Employee",
    e.salary AS "Salary"
FROM (
    SELECT *,
           DENSE_RANK() OVER (
               PARTITION BY departmentid
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employee
) e
JOIN department d
    ON e.departmentid = d.id
WHERE e.salary_rank <= 3;
