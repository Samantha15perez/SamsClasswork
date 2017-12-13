select recorddate [Date Added], count(leadid) [Leads Entered] from leads group by recorddate

select count(leadid) [Leads Entered], datepart(week, recorddate) [date]  from leads group by datepart(week, recorddate)

select * from leads
where leadopen = 1