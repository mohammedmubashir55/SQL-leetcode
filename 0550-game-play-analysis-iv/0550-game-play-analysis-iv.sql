-- Write your PostgreSQL query statement below
with first_login as (
select player_id,
    min(event_date) as first_date
    from Activity
group by player_id),next_day_login as (
    select distinct  a.player_id
    from Activity a
    join first_login f
    on a.player_id = f.player_id
       and a.event_date = f.first_date + interval '1 day')
select round (count (n.player_id)::numeric/ (select count (*) from first_login),2) as 
fraction
from next_day_login n;
