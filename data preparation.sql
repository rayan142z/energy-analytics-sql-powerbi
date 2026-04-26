with totavg as (
select avg([Germany [€/MWh]]]) as costavg 
from [dbo].[market]
)

select 
m.Datum, m.[Germany [€/MWh]]] as cost ,

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
end as 'b,a_avrg', w.temperature,
ROUND(CAST(biomass + hydro_pumped_storage + wind_onshore + wind_offshore + photovoltaics + other_renewable AS FLOAT) 
/ (biomass + hydro_pumped_storage + wind_onshore + wind_offshore + photovoltaics + other_renewable + lignite + hardcoal + fossilgas + other_conventional) * 100, 2) as 'green energy',
case
when w.temperature < 10 then 'cold'
when w.temperature between 10 and 25 then 'normal'
else 'hot'
end as temp_category

from [dbo].[market] m

join [dbo].[weather] w 
on m.datum=w.datum

join [dbo].[generation] g
on m.datum=g.datum

cross join totavg t

order by condition desc



