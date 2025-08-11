with hotels as (
select * from dbo.['2018$']
union all
select * from dbo.['2019$']
union all
select * from dbo.['2020$'])



select * from hotels h
left join market_segment$ m 
on h.market_segment = m.market_segment
left join meal_cost$ mc
on mc.meal = h.meal

--If the revenue is growing through years
select arrival_date_year, cast(sum((stays_in_week_nights+stays_in_weekend_nights)*adr/1000000) as decimal(15,2)) as [revenue in millions]
, hotel
from hotels
group by arrival_date_year,hotel
order by arrival_date_year
