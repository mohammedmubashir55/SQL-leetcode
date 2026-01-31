

select max (num) as num 
from mynumbers where num in (
    select num
    from myNumbers
    group by num
    having count(*) =1
)