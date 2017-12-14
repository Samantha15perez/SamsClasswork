use jobsearch

-- Number of job leads entered per day

 CREATE VIEW [Leads Per Day]
  AS 
  select recorddate [Date Added], count(leadid) [Leads Entered] from leads group by recorddate 
  
  GO
-- Number of job leads entered per week (the DATEPART function can be used to determine the week). This query should show the date of the Monday for that week and the number of leads.

CREATE VIEW [Leads per week] 
AS
SELECT DATEADD(DAY, 1 - Datepart(weekday, recorddate), recorddate) [Date], count (recorddate) [# of job leads]
FROM Leads
GROUP BY Dateadd(Day, 1 - datepart(weekday, recorddate), recorddate)
go
-- Active leads with no activities recorded for seven days or more - Job Title, Company, primary contact name, phone number and e-mail. ** Report View **

CREATE VIEW [Active Leads with no activities recorded in a week]-------------------------------------------------NOT DONE
AS
select * from leads
where leadopen = 1, AND recorddate > (getdate() - datepart(day, 7))



go
-- Number of leads by Source.
CREATE VIEW [# OF LEADS BY SOURCE]
AS
select sourceid, count(Leadid) from leads group by sourceid

go
-- Active contact list: All information on Active contacts with company name and agency checkmark. ** Report View **
create view [Active Contact List]
as
select * from contacts C
right join leads L
on L.Contactid = C.Contactid
where L.leadopen = 1 and Agencyid is not null

go
-- Call list for active leads with Job Title, Company Name, Job Title, Job Description, Location, primary contact name, phone number and number of days since last activity. Sort by number of days descending. ** Report View **
create view [call list]
as
select C.Companyname, Jobtitle, L.[Description], location, CON.Contactfirstname, CON.Phone
From Leads L
Inner join companies C
on L.companyid = c.CompanyID
Inner join contacts CON
on L.Contactid = CON.Contactid
where leadopen = 1

go
-- Search Log:  All activities for the previous 30 days. Include Activity Date, Activity Type, Job Title, Contact Company Name, Complete (Y/N)  (For Contact Company Name, return the company name for the primary contact on the lead.)  ** Report View **
create view [search log]


go
-- Lead Report: All information from the Leads table with Company Name, Agency Name, Contact Name, Title and contact information and Source Name.
create view [lead report]


go