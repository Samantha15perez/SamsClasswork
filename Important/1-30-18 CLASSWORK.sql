use adventureworks2012

----1

--SELECT concat(p.firstname, ' ',p.lastname) [Name]
--from humanresources.employee e
--Inner join person.Person P
--on p.BusinessEntityID = e.BusinessEntityID
--INTERSECT
--SELECT concat(p.firstname, ' ',p.lastname) [Name]
--from sales.salesperson SP
--Inner join person.Person P
--on p.BusinessEntityID = sp.BusinessEntityID


--SELECT		concat(p.firstname, ' ',p.lastname) [Name]
--FROM		Person.Person p
--INNER JOIN	HumanResources.Employee e
--ON			e.BusinessEntityID = p.BusinessEntityID
--INNER JOIN	Sales.SalesPerson sp
--ON			sp.BusinessEntityID = e.BusinessEntityID
--order by concat(p.firstname, ' ',p.lastname)

--2

--BEGIN TRANSACTION

--insert into person.BusinessEntity (modifieddate)
--values (getdate())

--Insert into person.person (businessentityid, persontype, namestyle, firstname, middlename, lastname, emailpromotion)
--VALUES ('20778', 'EM', 0, 'Sam', 'N', 'Perez', 0)

--Insert into HumanResources.Employee (BusinessEntityID, NationalIdNumber, LoginID, Jobtitle, Birthdate, Maritalstatus,
--gender, hiredate, salariedflag, vacationhours, sickleavehours, currentflag)
--VALUES ('20778', '245797968', 'adventure-works\sam0', 'Sales Representative', '1996-07-29', 'S', 'F', '2016-01-01', 1, '20', '38', 1)

--insert into person.[address] (addressline1, city, stateprovinceid, postalcode)
--values ('1234 test blvd', 'Bothell','79','98011')

--Insert into person.BusinessEntityAddress (BusinessEntityID, addressid, addresstypeid)
--values ('20778', (select addressid from person.[address] where addressline1 = '1234 test blvd'), 2)

--insert into humanresources.EmployeeDepartmentHistory (businessentityid, departmentid, shiftid, startdate, enddate)
--values ('20778','3', 1, '2016-01-01', '2017-01-01')

--insert into humanresources.EmployeePayHistory (businessentityid, ratechangedate, rate, PayFrequency)
--values ('20778', '2017-01-01', '125.50', 2)

--Insert into Sales.SalesPerson (BusinessEntityID, territoryid, SalesQuota, bonus, CommissionPct, SalesYTD, SalesLastYear)
--values ('20778', '2', '250000.00','2000.00','0.015','4251368.5497','1439156.0291')

--insert into sales.SalesPersonQuotaHistory (businessentityid, quotadate, salesquota)
--values 
--('20778', '2017-01-01', '7000.00'),
--('20778', '2017-04-01', '14000.00'),
--('20778', '2017-07-01', '28000.00'),
--('20778', '2017-10-01', '56000.00')

--insert into sales.SalesTerritoryHistory (BusinessEntityID, TerritoryID, StartDate, EndDate)
--values ('20778', '2', '2016-01-01', '2017-01-01')


--COMMIT TRANSACTION

--3

--GO
--  IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'VendorIssues') > 0 
-- BEGIN
-- DROP TABLE VendorIssues
-- END 

--Create table Purchasing.VendorIssues 
--(
--ReportID INT Identity(1,1), 
--PurchaseOrderID INT,
--Entrydate DATETIME DEFAULT GETDATE(), 
--issuedetails varchar(max), 
--vendorresponse varchar(max),
--resolved bit DEFAULT (0),
--PRIMARY KEY (ReportID),
--CONSTRAINT FK_VendorIssues_PurchaseOrderHeader FOREIGN KEY (PurchaseOrderID) REFERENCES purchasing.PurchaseOrderHeader (PurchaseOrderid)
--)

--SET IDENTITY_INSERT Adventureworks2012.Purchasing.VendorIssues ON 

--Insert into purchasing.PurchaseOrderHeader (RevisionNumber, [status], employeeid, VendorID, ShipMethodID, orderdate, shipdate, subtotal, TaxAmt, freight)
--values ('6', '2', '254', '1636', '3', '2018-07-25 00:00:00.000', '2018-08-19 00:00:00.000', '997680.00', '79814.40', '19953.60')


--INSERT INTO Purchasing.VendorIssues (ReportID, Purchaseorderid, entrydate, issuedetails, vendorresponse, resolved)
--VALUES ('5', '4013', '2018-01-30', 'test', 'test', 1)

--SET IDENTITY_INSERT Adventureworks2012.Purchasing.VendorIssues OFF

--INSERT INTO Purchasing.VendorIssues ( Purchaseorderid, entrydate, issuedetails, vendorresponse, resolved)
--Values 
--('4012', '2018-01-30', 'test2', 'test2', 1),
--('324', '2018-01-30', 'test3', 'test3', 0),
--('529', '2018-01-30', 'test4', 'test4', 1),
--('52', '2018-01-30', 'test5', 'test5', 0)

--4


--ALTER VIEW AdventureWorks2012MailingList
--AS

--Select  P.Title, Firstname, Middlename, Lastname, EA.EmailAddress, PP.PhoneNumber, A.AddressLine1, A.City, A.PostalCode, CR.Name [Country]
--FROM Sales.SalesPerson SP
--INNER JOIN Person.Person P
--ON P.BusinessEntityID = SP.BusinessEntityID
--INNER JOIN Person.EmailAddress EA
--ON EA.BusinessEntityID = SP.BusinessEntityID
--INNER JOIN Person.PersonPhone PP
--ON PP.BusinessEntityID = P.BusinessEntityID
--INNER JOIN Person.BusinessEntityAddress BEA
--ON BEA.BusinessEntityID = PP.BusinessEntityID
--INNER JOIN Person.[Address] A
--ON A.AddressID = BEA.AddressID
--INNER JOIN Person.StateProvince PSP
--ON A.StateProvinceID = PSP.StateProvinceID
--INNER JOIN Person.CountryRegion CR
--ON PSP.CountryRegionCode = CR.CountryRegionCode
--INNER JOIN HumanResources.Employee E
--ON E.BusinessEntityID = P.BusinessEntityID
--WHERE E.currentflag = 1

--WITH CHECK OPTION 


--5

--GO 

--Create VIEW AdventureWorks2012MailingList2ElectricBoogaloo
--AS

--Select  P.Title, Firstname, Middlename, Lastname, EA.EmailAddress, PP.PhoneNumber, A.AddressLine1, A.City, A.PostalCode, CR.Name [Country]
--FROM Sales.SalesPerson SP
--INNER JOIN Person.Person P
--ON P.BusinessEntityID = SP.BusinessEntityID
--INNER JOIN Person.EmailAddress EA
--ON EA.BusinessEntityID = SP.BusinessEntityID
--INNER JOIN Person.PersonPhone PP
--ON PP.BusinessEntityID = P.BusinessEntityID
--INNER JOIN Person.BusinessEntityAddress BEA
--ON BEA.BusinessEntityID = PP.BusinessEntityID
--INNER JOIN Person.[Address] A
--ON A.AddressID = BEA.AddressID
--INNER JOIN Person.StateProvince PSP
--ON A.StateProvinceID = PSP.StateProvinceID
--INNER JOIN Person.CountryRegion CR
--ON PSP.CountryRegionCode = CR.CountryRegionCode
--INNER JOIN HumanResources.Employee E
--ON E.BusinessEntityID = P.BusinessEntityID
--WHERE E.currentflag = 0

--WITH CHECK OPTION 

--GO 

--6

--ALTER TABLE Humanresources.Employee

--ADD Title Nvarchar(8),
--Firstname NVARCHAR(50),
--Middlename NVARCHAR(50),
--LastName NVARCHAR(50)

--GO

--UPDATE Humanresources.Employee
--SET Title = P.Title, Firstname = P.Firstname, MiddleName = P.Middlename, Lastname = P.Lastname
--From Person.Person P
--WHERE Humanresources.Employee.BusinessEntityID = P.BusinessEntityID


--7

--CREATE TABLE Humanresources.EmployeeAddresses
--(
--Businessentityid INT,
--AddressLine1 VARCHAR(50),
--AddressLine2 VARCHAR(50),
--City VARCHAR(50),
--[State] Varchar(50), 
--Postalcode Nvarchar(50),
--Country varchar (50)
--PRIMARY KEY (Businessentityid)
--)


--Insert INTO Humanresources.EmployeeAddresses (Businessentityid, AddressLine1, AddressLine2, City, [State], Postalcode, country)
--Select P.businessentityid, A.Addressline1, A.Addressline2, A.City, PSP.Name, A.Postalcode,CR.Name
--From Person.Person P
--INNER JOIN Person.EmailAddress EA
--ON EA.BusinessEntityID = P.BusinessEntityID
--INNER JOIN Person.PersonPhone PP
--ON PP.BusinessEntityID = P.BusinessEntityID
--INNER JOIN Person.BusinessEntityAddress BEA
--ON BEA.BusinessEntityID = PP.BusinessEntityID
--INNER JOIN Person.[Address] A
--ON A.AddressID = BEA.AddressID
--INNER JOIN Person.StateProvince PSP
--ON A.StateProvinceID = PSP.StateProvinceID
--INNER JOIN Person.CountryRegion CR
--ON PSP.CountryRegionCode = CR.CountryRegionCode
--INNER JOIN HumanResources.Employee E
--ON E.BusinessEntityID = P.BusinessEntityID
--WHERE E.BusinessEntityID = P.BusinessEntityID
