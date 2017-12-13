

USE MASTER;

IF (Select COUNT(*) from sys.databases where name = 'Jobsearch') >0

 BEGIN
 DROP DATABASE Jobsearch
END

 CREATE DATABASE Jobsearch;
 
 GO

 Use Jobsearch;



 PRINT '**Database Created**
 ';

 exec sp_changedbowner 'sa'

  IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Businesstypes') > 0 
 BEGIN
 DROP TABLE Businesstypes
 END 
 
 CREATE TABLE businesstypes
 (
	Businesstype nvarchar(100), 
	PRIMARY KEY (businesstype),
)
PRINT 'Businesstypes table created'

Insert into businesstypes (businesstype)
values
('Accounting'),
('Advertising/Marketing'),
('Agriculture'),
('Architecture'),
('Arts/Entertainment'),
('Aviation'),
('Beauty/Fitness'),
('Business Services'),
('Communications'),
('Computer/Hardware'),
('Computer/Services'),
('Computer/Software'),
('Computer/Training'),
('Construction'),
('Consulting'),
('Crafts/Hobbies'),
('Education'),
('Electrical'),
('Electronics'),
('Employment'),
('Engineering'),
('Environmental'),
('Fashion'),
('Financial'),
('Food/Beverage'),
('Government'),
('Health/Medicine'),
('Home & Garden'),
('Immigration'),
('Import/Export'),
('Industrial'),
('Industrial Medicine'),
('Information Services'),
('Insurance'),
('Internet'),
('Legal & Law'),
('Logistics'),
('Manufacturing'),
('Mapping/Surveying'),
('Marine/Maritime'),
('Motor Vehicle'),
('Multimedia'),
('Network Marketing'),
('News & Weather'),
('Non-Profit'),
('Petrochemical'),
('Pharmaceutical'),
('Printing/Publishing'),
('Real Estate'),
('Restaurants'),
('Restaurants Services'),
('Service Clubs'),
('Service Industry'),
('Shopping/Retail'),
('Spiritual/Religious'),
('Sports/Recreation'),
('Storage/Warehousing'),
('Technologies'),
('Transportation'),
('Travel'),
('Test'),
('Utilities'),
('Venture Capital'),
('Wholesale')


PRINT '>Businesstype Table Populated'

go
CREATE TRIGGER TRG_Businesstype_FKP1
on businesstypes
after delete
AS
BEGIN
		IF EXISTS (SELECT businesstype from deleted group by businesstype having businesstype in 
	(select businesstype from Companies where businesstype is not null))

				BEGIN
						RAISERROR ('ERROR: Cannot delete from from businesstypes without first deleting from Companies ', 16, 1) ROLLBACK TRANSACTION 
											END


END
go


CREATE TRIGGER TRG_Businesstype_FKP2
on businesstypes
AFTER INSERT,UPDATE
AS
BEGIN
		IF EXISTS (SELECT * 
					FROM Deleted D, businesstypes B 
					WHERE D.businesstype = B.businesstype)

				BEGIN
					Declare @Inserted INT = (Select I.businesstype from Inserted I) 

					UPDATE Businesstypes
					Set businesstype = @Inserted
					FROM Deleted D, businesstypes B
					WHERE D.businesstype = B.businesstype
END
END


go


CREATE TRIGGER TRG_Businesstype_FKP3
on Businesstypes
AFTER INSERT,UPDATE
AS
BEGIN
		IF EXISTS (Select businesstype from inserted group by businesstype having businesstype not in 
		(select businesstype from businesstypes where businesstype is not null))

						BEGIN
		RAISERROR ('ERROR: The businesstype you have entered does not match our records. Please Check that your information is correct.', 16, 1) ROLLBACK TRANSACTION	END
END
go




  IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Companies') > 0 
 BEGIN
 DROP TABLE Companies
 END 
 
 CREATE TABLE Companies
 (
	CompanyID INT NOT NULL Identity(1,1),
	Companyname varchar(100),
	Address1 nchar(50),
	Address2 nchar(50),
	city nchar(20), 
	[state] nchar(2), 
	zip nvarchar(9), 
	phone nvarchar(15),
	FAX nvarchar(15),
	Email nvarchar(50), 
	Website nchar(50), 
	[description] nchar(100), 
	Businesstype nvarchar(100),
	Agency Bit,
	PRIMARY KEY (CompanyID)


)

PRINT 'Companies Table Created';
print 'table updated'


go
CREATE TRIGGER TRG_FK_Companies_Businesstype
on Companies
AFTER INSERT,UPDATE
AS
BEGIN
		IF EXISTS (SELECT businesstype from inserted group by businesstype having businesstype not in 
	(select businesstype from businesstypes where businesstype is not null))

				BEGIN
						RAISERROR ('ERROR: The businesstype you have entered is incorrect', 16, 1) ROLLBACK TRANSACTION 
											END


END
go






Insert companies (companyname, address1, address2, city, [state], zip, phone, fax, email, website, description, businesstype, agency)
values
('Exeter Employment', '123 Test Lane', NULL, 'Orlando', 'FL', '33321-', '(904) 555-5555', '(904) 555-5555','drone@vinergys.com', 'http://www.vinergys.com', 'Test', 'Consulting', 1),
('Drewslair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Andrewcomeau.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Microsoft.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Vinergys inc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Liberty Software', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

PRINT '>Companies Table Populated'

  IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Contacts') > 0 
 BEGIN
 DROP TABLE Contacts
 END 
 PRINT 'Contacts Table Created'

 
 CREATE TABLE Contacts
 (
	Contactid INT NOT NULL Identity(1,1),
	Companyid Nvarchar(50), 
	Courtesytitle nvarchar (4),
	Contactfirstname nvarchar(20),
	contactlastname nvarchar(20),
	Title nvarchar(30),
	Phone nvarchar(15),
	Extension nvarchar(5),
	Fax nvarchar(15),
	email nvarchar(50),
	comments nvarchar(100),
	active bit,
	PRIMARY KEY (Contactid)

	
)



insert Contacts (CompanyID, Courtesytitle, contactfirstname, contactlastname)
values 
('Vinergys, inc.', 'Mr.', 'John', 'Smith'), 
('Exeter Employment', 'Ms.', 'Jane', 'Doe'), 
('Liberty Software', 'Mr.', 'Bill', 'Hunt')



PRINT '>Contacts Table Populated'


  IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Sources') > 0 
 BEGIN
 DROP TABLE Sources
 END 
 
 CREATE TABLE Sources
 (
	SourceID INT NOT NULL Identity(1,1),
	Sourcename nvarchar(50),
	sourcetype nvarchar(50),
	sourcelink nvarchar(50), 
	[description] nvarchar(50),
	PRIMARY KEY (SourceID)
)
PRINT 'Sources table created'



Insert Sources (Sourcename, sourcetype, sourcelink, [description])
values
('Monster.com', 'Online', 'http://www.monster.com', 'Test')

--Add More Sources Here

PRINT '>Sources Table Populated'



  IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Agencies') > 0 
 BEGIN
 DROP TABLE Agencies
 END 

 CREATE TABLE Agencies
 (
 Agencyid INT NOT NULL Identity(1,1),
 Agencyname Nvarchar(50),
 PRIMARY KEY (Agencyid)
 )
 PRINT 'Agencies table created'

 INSERT into Agencies (agencyname)
 values 
 ('Exeter Employment')

 PRINT '>Agencies table populated'


  IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Leads') > 0 
 BEGIN
 DROP TABLE Leads
 END 

 CREATE TABLE Leads
 (
	leadid INT NOT NULL Identity(1,1),
	Recorddate date,
	Jobtitle nvarchar(50),
	[Description] nvarchar(4000),
	employmenttype nvarchar(50), 
	location nvarchar(50),
	LeadOpen bit, 
	Companyid INT,
	Agencyid INT,
	Contactid INT,
	sourceid INT,
	selected bit,
	PRIMARY KEY (LeadID),
		--CONSTRAINT FK_Leads_Companies FOREIGN KEY (Companyid) REFERENCES Companies(Companyid),
		--CONSTRAINT FK_Leads_Contacts FOREIGN KEY (Contactid) REFERENCES Contacts(Contactid),
		--CONSTRAINT FK_Leads_Sources FOREIGN KEY (Sourceid) REFERENCES Sources(Sourceid),
		--CONSTRAINT FK_Leads_Agencyid FOREIGN KEY (Agencyid) REFERENCES Agencies(Agencyid)
)
 PRINT 'Leads Table Created'






 Insert Leads (Recorddate, Jobtitle, [Description], Employmenttype, Location, Leadopen, Companyid, Agencyid, contactid, sourceid) 
 values
 ('7/26/2012', 'Programmer', 'Test', 'Full-time', 'Ocala, FL', 1, (Select Companyid from Companies WHERE Companyname = 'Drewslair.com'), NULL, NULL, NULL),
 ('7/26/2012', 'Developer', NULL, NULL, 'Ocala, FL', 1, (Select Companyid from Companies WHERE Companyname = 'Andrewcomeau.com'), NULL, NULL, NULL),
 ('7/26/2012', 'Programmer', NULL, 'Full-time', 'Redmond, WA', 0, (Select Companyid from Companies WHERE Companyname = 'Microsoft'), NULL, NULL, NULL),
 ('8/2/2012', 'Software developer', 'test', 'Full-Time', 'Gainesville, FL', 0, (Select Companyid from Companies WHERE Companyname = 'Vinergys, Inc.'), (Select Agencyid from Agencies WHERE Agencyname = 'Exeter Employment'), (Select Contactid from Contacts WHERE contactlastname = 'Doe'), (Select Sourceid from Sources where Sourcename = 'Monster.com'))

 PRINT '>Leads Table Populated'

 
 IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Activities') > 0 
 BEGIN
 DROP TABLE Activities
 END 
 
 CREATE TABLE Activities
 (
	Activityid INT NOT NULL Identity(1,1),
	Leadid INT,
	Activitydate datetime, 
	activitytype nvarchar,
	Activitydetails nvarchar,
	complete bit,
	referencelink nvarchar
	PRIMARY KEY (Activityid)
		/*CONSTRAINT FK_Activities_Leadid FOREIGN KEY (leadid) REFERENCES Leads(Leadid)
		*/
)
PRINT 'Activities table created'
go


CREATE TRIGGER TRG_FK_Activities_Leadid
on Leads
AFTER INSERT,UPDATE
AS
BEGIN
		IF EXISTS (Select leadid from inserted group by leadid having leadid not in 
		(select leadid from leads where leadid is not null))

						BEGIN
		RAISERROR ('ERROR: The leadID you have entered is incorrect', 16, 1) ROLLBACK TRANSACTION	END
END
go


--------------------------------

 PRINT '>Activities Table Populated'

PRINT '**BASE DATABASE RESET SUCCESSFUL**'


--NEW STUFF



INSERT Companies (Companyname, city, [state], website, businesstype)
values
('Pinnacle Executive Search, LLC', 'Oviedo', 'FL', 'Employflorida.com', 'Computer/Software'),
('Sentry data systems, inc', 'Deerfield Beach', 'FL', 'Employflorida.com', 'Computer/Software'),
('Pronto Progress', 'Saint Petersburg', 'FL', 'Employflorida.com', 'Computer/Software'),
('Katmai Government Services', 'Orlando', 'FL', 'Employflorida.com', 'Computer/Software'),
('Information Systems of Florida', 'Tallahassee', 'FL', 'Employflorida.com', 'Computer/Software'),
('Shadow Health Inc. ', 'Gainsville', 'FL', 'Employflorida.com', 'Computer/Software'),
('Andromeda Systems Incorporated', 'Orange Park', 'FL', 'Employflorida.com', 'Computer/Software'),
('City Of Jacksonville', 'Jacksonville', 'FL', 'Employflorida.com', 'Computer/Software')


Insert Sources (sourcename, Sourcetype, Sourcelink)
values ('Employflorida.com', 'Online', 'Https://Employflorida.com')


INSERT Leads (Recorddate, Jobtitle, [description], employmenttype, location, companyid, leadopen, sourceid)
values 
('12/04/2017', 'Software developer', 'Required to perform software engineering analyses to identify and select the most suitable integration and installation, requirements analysis, design, test, interface testing, resource planning and scheduling, system maintenance, reliability, and system evolution. ', 'Full-time', 'Oviedo', (Select Companyid from Companies where Companyname = 'Pinnacle Executive Search, LLC'), 1, (select sourceid from sources where sourcename = 'Employflorida.com')),
('11/30/2017', 'Software developer', 'This is a highly technical position that involves designing, testing, implementing, and maintaining our products and internal systems. Developers are expected to be independently motivated, smart, and productive. Developers are involved with, and responsible for, all aspects of the product lifecycle. Developers are expected to be able to quickly solve problems, write maintainable code, and adhere to quality standards. Developers must be able to work independently as well as in a team environment. ', 'Full-time', 'Deerfield Beach', (Select Companyid from Companies where Companyname = 'Sentry Data Systems, Inc'), 1, (select sourceid from sources where sourcename = 'Employflorida.com')),
('11/29/2017', 'Software developer', NULL, 'Full-time', 'Saint Petersburg', (Select Companyid from Companies where Companyname = 'Pronto Progress'), 1, (select sourceid from sources where sourcename = 'Employflorida.com')),
('11/21/2017', 'Software developer', 'The Software Developer is responsible for contributing to development of an enterprise portal serving 1M users. Developers will work closely with Information Architects, Senior Developers and Product Owners to address user needs, and with Creative Technologists to produce effective and functional solutions while maintaining design integrity across all project phases. ', 'Full-time', 'Orlando', (Select Companyid from Companies where Companyname = 'Katmai Government Services'), 1, (select sourceid from sources where sourcename = 'Employflorida.com')),
('11/21/2017', 'Software developer', 'Programming component-based applications using the .Net framework within established project schedules, adhering to established methodologies. Continuously analyzing processes for improved performance and adaptability. Developing test scripts and conducting unit testing. Cultivating and maintaining strong relationships with the project team. ', 'Full-time', 'Tallahassee', (Select Companyid from Companies where Companyname = 'Information Systems of florida'), 1, (select sourceid from sources where sourcename = 'Employflorida.com')),
('11/20/2017', 'Software developer', 'The Software Developer creates applications and tools that host and support Shadow Health products and data. ', 'Full-time', 'Gainsville', (Select Companyid from Companies where Companyname = 'Shadow Health Inc.'), 1, (select sourceid from sources where sourcename = 'Employflorida.com')),
('11/02/2017', 'Software developer', 'Andromeda Systems Incorporated (ASI) develops enterprise software used by physical asset managers to keep their equipment and fleets performing at their highest levels. Our customers include the Department of Defense, commercial fleet operators, and industrial facilities. We meet our customers challenges by developing state of the art solutions that bring together the fields of computer science, operations research, data science, and reliability engineering using the latest industry technologies. ', 'Full-time', 'Orange Park', (Select Companyid from Companies where Companyname = 'Andromeda Systems Incorporated'), 1, (select sourceid from sources where sourcename = 'Employflorida.com')),
('10/19/2017', 'Software developer', 'The Software Developer Senior report to the Assistant Information Technology Officer and will be responsible for developing and maintaining mission critical .NET applications in a fast paced environment. This individual is required to work in a collaborative environment with other developers, designers, testers, and project managers. The primary function of this role will be to assist, design, build and support customized as well as vendor applications using the Microsoft technologies. ', 'Full-time', 'Jacksonville', (Select Companyid from Companies where Companyname = 'City Of Jacksonville'), 1, (select sourceid from sources where sourcename = 'Employflorida.com'))



Print '**MOCK DATA ENTERED**'

--Select  Jobtitle, Recorddate, L.[Description], Employmenttype, Location, Companyname, City, Website, Sourcelink
--From Leads L
--Left join agencies AG
--on L.Agencyid = AG.Agencyid
--Left join Companies COM
--on L.Companyid = Com.CompanyID
--Left join Sources S
--on L.sourceid = S.SourceID
--Left join Businesstypes B
--on COM.Businesstype = B.Businesstype
--WHERE L.Jobtitle = 'Software developer' AND Leadopen = 1

go
CREATE TRIGGER TRG_SourceID_FKP1
on Sources
after delete
AS
BEGIN
		IF EXISTS (SELECT Sourceid from deleted group by Sourceid having Sourceid in 
	(select Sourceid from Leads where sourceid is not null))

				BEGIN
						RAISERROR ('ERROR: Cannot delete from from Sources without first deleting from Leads ', 16, 1) ROLLBACK TRANSACTION 
											END


END
go


CREATE TRIGGER TRG_SourceID_FKP2
on sources
AFTER INSERT,UPDATE
AS
BEGIN
		IF EXISTS (SELECT * 
					FROM Deleted D, Sources S 
					WHERE D.SourceID = S.SourceID)

				BEGIN
					Declare @Inserted INT = (Select I.SourceID from Inserted I) 

					UPDATE Leads
					Set Sourceid = @Inserted
					FROM Deleted D, Sources S
					WHERE D.Sourceid = S.Sourceid
END
END


go


CREATE TRIGGER TRG_SourceID_FKP3
on Leads
AFTER INSERT,UPDATE
AS
BEGIN
		IF EXISTS (Select sourceid from inserted group by sourceid having sourceid not in 
		(select sourceid from sources where sourceid is not null))

						BEGIN
		RAISERROR ('ERROR: The SourceID you have entered does not match our records. Please Check that your information is correct.', 16, 1) ROLLBACK TRANSACTION	END
END
go


CREATE TRIGGER TRG_Agencyid_FKP1
on Agencies
after delete
AS
BEGIN
		IF EXISTS (SELECT Agencyid from deleted group by Agencyid having Agencyid in 
	(select Agencyid from Leads where Agencyid is not null))

				BEGIN
						RAISERROR ('ERROR: Cannot delete from from Agencies without first deleting from Leads ', 16, 1) ROLLBACK TRANSACTION 
											


END END
go

CREATE TRIGGER TRG_AgencyID_FKP2
on Agencies
AFTER INSERT,UPDATE
AS
BEGIN
		IF EXISTS (SELECT * 
					FROM Deleted D, Agencies A 
					WHERE D.AgencyID = A.AgencyID)

				BEGIN
					Declare @Inserted INT = (Select I.AgencyID from Inserted I) 

					UPDATE Leads
					Set Agencyid = @Inserted
					FROM Deleted D, Agencies S
					WHERE D.Agencyid = S.Agencyid

END END


go


CREATE TRIGGER TRG_AgencyID_FKP3
on Leads
AFTER INSERT,UPDATE
AS
BEGIN
		IF EXISTS (Select Agencyid from inserted group by Agencyid having Agencyid not in 
		(select Agencyid from Agencies where Agencyid is not null))

						BEGIN
		RAISERROR ('ERROR: The AgencyID you have entered does not match our records. Please Check that your information is correct.', 16, 1) ROLLBACK TRANSACTION	END
END
go




CREATE TRIGGER TRG_ContactID_FKP1
on Contacts
after delete
AS
BEGIN
		IF EXISTS (SELECT ContactID from deleted group by ContactID having ContactID in 
	(select ContactID from Leads where ContactID is not null))

				BEGIN
						RAISERROR ('ERROR: Cannot delete from from Contacts without first deleting from Leads ', 16, 1) ROLLBACK TRANSACTION 
											END


END
go


CREATE TRIGGER TRG_ContactID_FKP2
on Contacts
AFTER INSERT,UPDATE
AS
BEGIN
		IF EXISTS (SELECT * 
					FROM Deleted D, Contacts S 
					WHERE D.ContactID = S.ContactID)

				BEGIN
					Declare @Inserted INT = (Select I.ContactID from Inserted I) 

					UPDATE Leads
					Set Contactid = @Inserted
					FROM Deleted D, Contacts S
					WHERE D.Contactid = S.Contactid

END END
go


CREATE TRIGGER TRG_ContactID_FKP3
on Leads
AFTER INSERT,UPDATE
AS
BEGIN
		IF EXISTS (Select contactid from inserted group by contactid having contactid not in 
		(select contactid from contacts where contactid is not null))

						BEGIN
		RAISERROR ('ERROR: The ContactID you have entered does not match our records. Please Check that your information is correct.', 16, 1) ROLLBACK TRANSACTION	END
END 

go

CREATE TRIGGER TRG_CompanyID_FKP1
on Companies
after delete
AS
BEGIN
		IF EXISTS (SELECT CompanyID from deleted group by CompanyID having CompanyID in 
	(select CompanyID from Leads where CompanyID is not null))

				BEGIN
						RAISERROR ('ERROR: Cannot delete from from Companies without first deleting from Leads ', 16, 1) ROLLBACK TRANSACTION 
											END


END
go


CREATE TRIGGER TRG_CompanyID_FKP2
on companies
AFTER INSERT,UPDATE
AS
BEGIN
		IF EXISTS (SELECT * 
					FROM Deleted D, companies S 
					WHERE D.CompanyID = S.CompanyID)

				BEGIN
					Declare @Inserted INT = (Select I.CompanyID from Inserted I) 

					UPDATE Leads
					Set Companyid = @Inserted
					FROM Deleted D, companies S
					WHERE D.Companyid = S.Companyid
END
END

go
CREATE TRIGGER TRG_CompanyID_FKP3
on Leads
AFTER INSERT,UPDATE
as
BEGIN
		IF EXISTS (Select companyid from inserted group by companyid having companyid not in 
		(select companyid from companies where companyid is not null))

						BEGIN
		RAISERROR ('ERROR: The CompanyID you have entered does not match our records. Please Check that your information is correct.', 16, 1) ROLLBACK TRANSACTION	
		

		END


END


----TEST TRIGGER FK1


--UPDATE Companies
--SET Businesstype = 'Diddlydoo'
--WHERE Companyid = 2

--select * from companies


----TEST TRIGGER FK2

--insert into leads (Companyid)
--values (24)

--select * from companies


----TEST TRIGGER FK3


--UPDATE sources 
--set sourcename = 'Snagajob.com' WHERE Sourceid = 2




--select L.Sourceid, Sourcename 
--from sources S
--inner join leads L
--on S.sourceid = L.Sourceid