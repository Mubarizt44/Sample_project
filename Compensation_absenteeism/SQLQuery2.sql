--create a join table
select * from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number;

--- find the healthiest
select * from Absenteeism_at_work 
where Social_drinker = 0 and Social_smoker = 0 
and Body_mass_index <25 and 
Absenteeism_time_in_hours < (select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work)

--- compernsation rate increase for non-smokers/ budget $983,221 so .68 increase per hour $1,414 extra per year 
select count(*) as nonsmokers from Absenteeism_at_work
where Social_smoker = 0

--- optimize query
select
a.ID,
r.Reason,
Month_of_absence,
Body_mass_index,
CASE WHEN 
CASE WHEN Month_of_absence IN (12,1,2) Then 'Winter'
	WHEN Month_of_absence IN (3,4,5) Then 'Spring'
	WHEN Month_of_absence IN (6,7,8) Then 'Summer'
	WHEN Month_of_absence IN (9,10,11) Then 'Fall'
	ELSE 'Unknown' END as Seasons_Names
from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number;