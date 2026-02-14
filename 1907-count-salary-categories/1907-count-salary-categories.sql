-- Write your PostgreSQL query statement below
select category,
count(a.account_id) as accounts_count
from (values 
('Low Salary'),
('Average Salary'),
('High Salary')) as categories(category)
left join accounts a on (
(category = 'Low Salary' AND a.income < 20000) OR
(category = 'Average Salary' AND a.income BETWEEN 20000 AND 50000) OR
(category = 'High Salary' AND a.income > 50000))
GROUP BY category;
