with totavg as (
select avg([Germany [€/MWh]]]) as costavg 
from [dbo].[market]
),

final as (
select 
m.Datum, m.[Germany [€/MWh]]] ,

case
when temperature>10 
AND ROUND(CAST(biomass + hydro_pumped_storage + wind_onshore + wind_offshore + photovoltaics + other_renewable AS FLOAT) 
/ (biomass + hydro_pumped_storage + wind_onshore + wind_offshore + photovoltaics + other_renewable + lignite + hardcoal + fossilgas + other_conventional) * 100, 2) > 60 
or ROUND(CAST(biomass + hydro_pumped_storage + wind_onshore + wind_offshore + photovoltaics + other_renewable AS FLOAT) 
/ (biomass + hydro_pumped_storage + wind_onshore + wind_offshore + photovoltaics + other_renewable + lignite + hardcoal + fossilgas + other_conventional) * 100, 2) >= 69.5
then 'safe' else 'risk'
end as condition,

case
when [Germany [€/MWh]]]< t.costavg then 'below'else 'above'
end as cost


from [dbo].[market] m

join [dbo].[weather] w 
on m.datum=w.datum

join [dbo].[generation] g
on m.datum=g.datum

cross join totavg t
)

select 
condition,
round(cast(count(*) * 100.0/ sum(count(*)) over () as float),2)  as percentage

from final 

group by condition;