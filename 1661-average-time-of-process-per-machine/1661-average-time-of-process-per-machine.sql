-- Write your PostgreSQL query statement below
select machine_id ,
    ROUND(AVG(end_time-start_time)::numeric, 3) as processing_time 
from (
    select
      machine_id,
      process_id,
      avg(case when activity_type = 'start' 
      then timestamp end) as start_time,
      avg (case when activity_type = 'end'
      then timestamp end ) as end_time 
    from activity
    group by machine_id,process_id )t
    group by machine_id ;



