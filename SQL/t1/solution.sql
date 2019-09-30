with seller as (
    SELECT sum(t.value) as val, c.country from companies c, trades t
    where c.name = t.seller
    group by c.country
),
buyer as (
    SELECT sum(t.value) as val, c.country from companies c, trades t
    where c.name = t.buyer
    group by c.country
),
countries as (
    select distinct country from companies
), 
export as (
    select c.country, coalesce( s.val, 0) val from countries c
    left join seller s on c.country = s.country
),
import as (
    select c.country, coalesce( b.val, 0) val from countries c
    left join buyer b on c.country = b.country
)
   select e.country, e.val export, i.val import 
     from export e
left join import i on e.country = i.country
 order by e.country