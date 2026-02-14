-- Write your PostgreSQL query statement below
select sell_date,
count(DISTINCT product) as num_sold,
STRING_AGG(DISTINCT product, ',' order by  product) as products
from activities
group by  sell_date
order by sell_date;
