USE MASTER;

IF (Select COUNT(*) from sys.databases where name = 'VeterinaryDB') >0

 BEGIN
 DROP DATABASE VeterinaryDB
END

 CREATE DATABASE VeterinaryDB;
 
 GO

 Use VeterinaryDB;

 PRINT '-- Database Reset';

     IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Clients') > 0 
 BEGIN
 DROP TABLE Clients
 END 
 
 CREATE TABLE Clients
 (
 ClientID INT NOT NULL Identity(1,1),
 FirstName Varchar(25) NOT NULL, 
 LastName Varchar(25) NOT NULL,
 MiddleName Varchar(25),
 CreateDate DATE
 PRIMARY KEY (ClientID)
 )

 Print '--  Clients Table Created'


  IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'ClientContacts') > 0 
 BEGIN
 DROP TABLE ClientContacts
 END 
 
 CREATE TABLE ClientContacts
 (
 AddressID INT NOT NULL Identity(1,1),
 ClientID INT Not NULL,
 AddressType INT NOT NULL,
 AddressLine1 Varchar(50) NOT NULL,
 Addressline2 Varchar(50),
 City Varchar(35) NOT NULL,
 StateProvince Varchar(25) NOT NULL,
 PostalCode Varchar(15) NOT NULL,
 Phone Varchar(15) NOT NULL,
 AltPhone Varchar(15) NOT NULL,
 Email Varchar(35) NOT NULL
 PRIMARY KEY (AddressID)
 CONSTRAINT FK_ClientContacts_Clients FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
 )

  PRINT '--  ClientContacts Table Created'

  INSERT INTO Clients (Firstname, Lastname, Middlename, CreateDate)
  VALUES 
  ('Dave', 'Strider', 'Arthur', getdate()),
  ('Rose', 'Lalonde', NULL, getdate()),
  ('John', 'Egbert', 'James', getdate()),
  ('Jade', 'Harley', NULL, getdate()),
  ('Jake', 'English', NULL, getdate())

  PRINT '--  Clients Table Populated'
  INSERT INTO ClientContacts (Clientid, Addresstype, Addressline1, Addressline2, City, Stateprovince, Postalcode, Phone, Altphone, Email)
  VALUES 
  ((Select Clientid from CLients where lastname = 'Strider'), 1, '1234 test Blvd', NULL, 'Silver Springs', 'FL', '32134', '(352) 299-3716', '(352) 856-9233', 'DStride@Gmail.com'),
  ((Select Clientid from CLients where lastname = 'Lalonde'), 2, '7257 Radial Ct', NULL, 'Ocala', 'FL', '34470', '(352) 725-3886', '(352) 826-0742', 'Roxxy96@hotmail.com'),
  ((Select Clientid from CLients where lastname = 'Egbert'), 1, '102 Buena Vista Blvd', NULL, 'Ocala', 'FL', '34472', '(352) 713-6244', '(352) 723-1264', 'Egghead@gmail.com'),
  ((Select Clientid from CLients where lastname = 'Harley'), 1, '303 SW Wenona Ave', NULL, 'Ocala', 'FL', '34474', '(352) 162-7723', '(352) 826-2009', 'DoggoFriend@mail.com'),
  ((Select Clientid from CLients where lastname = 'English'), 1, '112 Adventure Way', NULL, 'Ocala', 'FL', '34471', '(352) 920-1524', '(352) 141-1569', 'DualWieldingPistols@hotmail.com')

  PRINT '--  ClientContacts Table Populated'



        IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Employees') > 0 
 BEGIN
 DROP TABLE Employees
 END 

 CREATE TABLE Employees
 (
 EmployeeID INT IDENTITY(1,1),
 LastName varchar(25) NOT NULL,
 Firstname varchar(25) NOT NULL,
 MiddleName varchar(25),
 Hiredate DATE not null,
 Title varchar(50) not null
 PRIMARY KEY (EmployeeID)
 )


  PRINT '--  Employees Table Created'


      IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'EmployeeContactInfo') > 0 
 BEGIN
 DROP TABLE EmployeeContactInfo
 END 

 CREATE TABLE EmployeeContactInfo
 (
 AddressID INT Identity(1,1),
 AddressLine1 Varchar(50) NOT NULL,
 Addressline2 Varchar(50),
 City Varchar(35) NOT NULL,
 StateProvince Varchar(25) NOT NULL,
 PostalCode Varchar(15) NOT NULL,
 Phone Varchar(15) NOT NULL,
 AltPhone Varchar(15) NOT NULL,
 EmployeeID INT NOT NULL
 PRIMARY KEY (AddressID)
 CONSTRAINT FK_EmployeeContactInfo_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
 )

 PRINT '--  EmployeeContactInfo Table Created'

INSERT INTO Employees (Lastname, Firstname, MiddleName, Hiredate, Title)
Values 
('Smith', 'John', NULL, '07-29-1998', 'Veterinarian'),
('Conrad', 'Holly', NULL, '12-15-2012', 'Avian Specialist'),
('Newman', 'Chelsea', NULL, '08-08-2005', 'Assistant'),
('Burke', 'Victoria', 'Shawn', '01-23-2002', 'Radiologist'),
('Beck', 'Percy', 'Levi', '11-30-2009', 'Veterinary Surgeon'),
('Stone', 'Andy', 'Frank', '05-12-2013', 'Parasitologist'),
('Hale', 'Allen', 'Bailey', '04-28-2011', 'Veterinarian')

 PRINT '--  Employees Table Populated'

 INSERT INTO EmployeeContactInfo (AddressLine1, AddressLine2, City, StateProvince, PostalCode, Phone, AltPhone, EmployeeID)
 VALUES 
 ('3266 Bagwell Avenue', NULL, 'Ocala', 'FL', '34471', '352-804-1718', '352-266-8720', (Select EmployeeID from employees WHERE lastname = 'Smith')),
 ('3156 Long Street', NULL, 'Ocala', 'FL', '34471', '352-201-2330', '352-875-8270', (Select EmployeeID from employees WHERE lastname = 'Conrad')),
 ('3465 Rhapsody Street', NULL, 'Ocala', 'FL', '34470', '352-266-7354', '352-572-2181', (Select EmployeeID from employees WHERE lastname = 'Newman')),
 ('1793 Grant View Drive', NULL, 'Ocala', 'FL', '34471', '352-276-9976', '352-836-5853', (Select EmployeeID from employees WHERE lastname = 'Burke')),
 ('250 Olen Thomas Drive', NULL, 'Ocala', 'FL', '34472', '352-233-7357', '352-424-3634', (Select EmployeeID from employees WHERE lastname = 'Beck')),
 ('2771 Broaddus Avenue', NULL, 'Ocala', 'FL', '34470', '352-757-7572', '352-342-2334', (Select EmployeeID from employees WHERE lastname = 'Stone')),
 ('1020 Charack Road', NULL, 'Ocala', 'FL', '34474', '352-123-0562', '352-424-2888', (Select EmployeeID from employees WHERE lastname = 'Hale'))

 PRINT '--  EmployeeContactInfo Table Populated'


          IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'AnimalTypeReference') > 0 
 BEGIN
 DROP TABLE AnimalTypeReference
 END 

 CREATE TABLE AnimalTypeReference
 (
 AnimalTypeID INT IDENTITY(1,1),
 Species Varchar(35) NOT NULL,
 Breed Varchar(35) NOT NULL
 PRIMARY KEY (AnimalTypeID)
 )


 
 PRINT '--  AnimalTypeReference Table Created'

 INSERT INTO Animaltypereference (Species, Breed)
 VALUES
('Horse', 'Pasofino'),
('Parrot','Parakeet'),
('Hamster','Russian'),
('Cat','Scottish Fold'),
('Cat','Siamese'),
('Tortoise','Leopard Tortoise'),
('Dog','Samoyed')

 PRINT '--  AnimalTypeReference Table Populated'


        IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Patients') > 0 
 BEGIN
 DROP TABLE Patients
 END 

 CREATE TABLE Patients
 (
PatientID INT IDENTITY(1,1),
ClientID INT NOT NULL,
PatientName Varchar(35) NOT NULL,
AnimalType INT NOT NULL,
Color Varchar(25),
Gender Varchar(2) NOT NULL,
BirthYear Varchar(4),
[Weight] Decimal(6) NOT NULL,
[Description] varchar(1024), 
GeneralNotes varchar(2048) NOT NULL,
Chipped BIT NOT NULL, 
RabiesVacc datetime
PRIMARY KEY (PatientID)
 CONSTRAINT FK_Patients_Clients FOREIGN KEY (clientID) REFERENCES Clients(ClientID),
 CONSTRAINT FK_Patients_AnimalType FOREIGN KEY (AnimalType) REFERENCES AnimalTypeReference(AnimalTypeID)
 )


 
 PRINT '--  Patients Table Created'

INSERT INTO Patients (Clientid, Patientname, animaltype, color, gender, birthyear, [weight], [description], generalnotes, chipped, rabiesvacc)
VALUES
((Select Clientid from CLients where lastname = 'Strider'), 'Pandamonium', 7, 'White/Black', 'M', '2013', '88.7', 'Large dog, Mostly White with Panda-Like Markings', 'Large dog. Non-Aggressive. Peanut Allergy.', 1, getdate()),
((Select Clientid from CLients where lastname = 'Strider'), 'Lord Voldetort', 6, 'Standard', 'M', '1998', '8.4', 'Medium Sized Tortoise, Light Coloration', 'Very Aggressive. Handle with care.', 0, '09-09-2001'),
((Select Clientid from CLients where lastname = 'Lalonde'), 'Socket Wrench', 5, 'Siamese', 'F', '2010', '10.2', NULL, 'Overweight female. Good temperment but food aggressive.', 1, '12-21-2011'),
((Select Clientid from CLients where lastname = 'Lalonde'), 'Antonio', 2, 'Blue', 'M', '2007', '.132', NULL, 'Anxious Male. Prone to Feather-Pulling.', 0, '03-29-2009'),
((Select Clientid from CLients where lastname = 'Egbert'), 'Jeremy', 4, 'Orange Tabby', 'M', '2014', '8.9', NULL, 'Juvenile Male, non-aggressive', 1, '11-30-2015'),
((Select Clientid from CLients where lastname = 'Harley'), 'Poptart', 3, 'Gray', 'F', '2015', '.24', NULL, 'Previous Abcess on inner right cheek', 0, '08-24-2015'),
((Select Clientid from CLients where lastname = 'English'), 'Luna', 1, 'Brown', 'F', '2007', '850', NULL, 'Unbred Female', 0, '09-12-2008') 




 PRINT '--  Patients Table Populated'




         IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Visits') > 0 
 BEGIN
 DROP TABLE Visits
 END 

 CREATE TABLE Visits
 (
 VisitID INT Identity(1,1),
 StartTime datetime NOT NULL,
 Endtime datetime NOT NULL,
 Appointment BIT NOT NULL,
 DiagnosisCode varchar(12) NOT NULL,
 ProcedureCode varchar(12) NOT NULL,
 VisitNotes varchar(2048) NOT NULL,
 PatientID Int NOT NULL,
 EmployeeID INT NOT NULL
 PRIMARY KEY (VisitID)
 CONSTRAINT FK_Visits_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
 CONSTRAINT CK_Starttime_endtime CHECK (Endtime > Starttime)
 )


 PRINT '--  Visits Table Created'

INSERT INTO Visits (Starttime, Endtime, Appointment, Diagnosiscode, Procedurecode, VisitNotes, PatientID, EmployeeID)
VALUES
('2017-01-02 12:00:00', (SELECT dateadd(mi, (rand() * 100), '2017-01-02 12:00:00')), 1, '36E79', '00ED2', 'Routine Wellness Check', 6, 1),
('2017-05-07 11:00:00', (SELECT dateadd(mi, (rand() * 100), '2018-05-07 11:00:00')), 1, '82BK9', '28H82', 'Patient has sore paw', 3, 7), 
('2017-05-21 12:00:00', (SELECT dateadd(mi, (rand() * 100), '2018-05-21 12:00:00')), 1, '36E79', '02ED3', 'Routine Wellness Check: Patient diagnosed with athsma', 4, 7),
('2017-09-24 12:00:00', (SELECT dateadd(mi, (rand() * 1000), '2018-09-24 12:00:00')), 0, '86GH2', '92H12', 'Emergency visit: Patient diagnosed with Colic; promptly treated', 1, 1),
('2018-11-12 12:00:00', (SELECT dateadd(mi, (rand() * 100), '2018-11-12 12:00:00')), 1, 'H12H9', 'QA0AH', 'Standard Appt: Sprained tail from wagging too hard', 7, 7)





 PRINT '--  Visits Table Populated'
 


      IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Billing') > 0 
 BEGIN
 DROP TABLE Billing
 END 

 CREATE TABLE Billing
 (
 BillID INT Not Null Identity(1,1),
 Billdate DATE NOT NULL,
 ClientID INT NOT NULL,
 VisitID INT Not null,
 Amount decimal NOT NULL
 PRIMARY KEY (BillID)
 CONSTRAINT FK_Billing_Clients FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
 CONSTRAINT FK_Billing_Visits FOREIGN KEY (VisitID) REFERENCES Visits(VisitID)
 )

  PRINT '--  Billing Table Created'

INSERT INTO Billing (Billdate, clientid, visitid, amount)
VALUES 
('2017-01-02', (Select Clientid from CLients where lastname = 'Strider'), 1, '40.00'),
('2017-05-07', (Select Clientid from CLients where lastname = 'Harley'), 2, '57.73'),
('2017-05-21', (Select Clientid from CLients where lastname = 'Egbert'), 3, '39.31'),
('2017-09-24', (Select Clientid from CLients where lastname = 'English'), 4, '187.49'),
('2018-11-12', (Select Clientid from CLients where lastname = 'Strider'), 5, '49.97')

 PRINT '--  Billing Table Populated'




   IF (Select COUNT(*) from INFORMATION_SCHEMA.tables t where t.TABLE_NAME = 'Payments') > 0 
 BEGIN
 DROP TABLE Payments
 END 

 CREATE TABLE Payments 
 (
 PaymentID INT NOT NULL IDENTITY(1,1),
 PaymentDate DATE NOT NULL,
 BillID INT,
 Notes Varchar(2048),
 Amount decimal NOT NULL
 PRIMARY KEY (PaymentID)
 )

 PRINT '--  Payments Table Created'

INSERT INTO Payments (Paymentdate, billid, notes, amount)
VALUES 
((select billdate from billing where billid = 1), 1, 'Paid on time', (select amount from billing where billid = 1)),
((select billdate from billing where billid = 2), 1, 'Paid on time', (select amount from billing where billid = 2)),
((select billdate from billing where billid = 3), 1, 'Paid on time', (select amount from billing where billid = 3)),
((select billdate from billing where billid = 4), 1, 'Paid on time', (select amount from billing where billid = 4)),
((select billdate from billing where billid = 5), 1, 'Paid on time', (select amount from billing where billid = 5))



 PRINT '--  Payments Table Populated'


  GO
  CREATE PROCEDURE SP_Species
  @Species Varchar(35) 
  AS 
  BEGIN
  SELECT P.PatientName, CONCAT(C.FirstName, ' ', C.Lastname) [Owner], Addressline1, City, StateProvince, Postalcode, Phone, AltPhone, Email
  FROM ClientContacts CC
  INNER JOIN Clients C
  ON C.ClientID = CC.ClientID
  INNER JOIN Patients P
  ON P.ClientID = CC.ClientID
  INNER JOIN AnimalTypeReference A
  ON A.AnimalTypeID = P.AnimalType
  WHERE A.Species = @Species
  END
  

   GO
  CREATE PROCEDURE SP_Breed
  @Breed Varchar(35) 
  AS 
  BEGIN
  SELECT P.PatientName, CONCAT(C.FirstName, ' ', C.Lastname) [Owner], Addressline1, City, StateProvince, Postalcode, Phone, AltPhone, Email
  FROM ClientContacts CC
  INNER JOIN Clients C
  ON C.ClientID = CC.ClientID
  INNER JOIN Patients P
  ON P.ClientID = CC.ClientID
  INNER JOIN AnimalTypeReference A
  ON A.AnimalTypeID = P.AnimalType
  WHERE A.Breed = @Breed
  END
  



    GO
  CREATE PROCEDURE SP_Billing
  @ClientID INT
  AS 
  BEGIN
  SELECT B.Billdate, cast(starttime as date)[Visit Date], CONCAT('$', B.Amount, '.00') [Total Due] , CONCAT(C.FirstName, ' ', C.Lastname)[Client], CC.ClientID, AddressLine1, City, StateProvince, Postalcode, Phone
  FROM ClientContacts CC
  inner join Clients C
  ON C.ClientID = CC.ClientID
  inner join Billing B
  on B.ClientID = CC.ClientID
  inner join Visits V
  ON V.VisitID = B.VisitID
  WHERE CC.Clientid = @Clientid
  END


    GO
  CREATE PROCEDURE SP_MailingList
  AS 
  BEGIN
  Select CONCAT(E.Firstname, ' ', E.Lastname) [Name], Addressline1, City, Stateprovince, Postalcode, Phone, Altphone
  FROM EmployeeContactInfo EC
  INNER JOIN Employees E
  ON E.EmployeeID = EC.EmployeeID
  Where Phone IS NOT NULL
  END



GO 
CREATE PROCEDURE SP_CreateNewClient

@Firstname varchar(25),
@Lastname varchar(25),
@middlename varchar(25),
@AddressID INT,
@addresstype INT, 
@AddressLine1 Varchar(50),
@Addressline2 Varchar(50),
@City Varchar(35),
@StateProvince Varchar(25),
@PostalCode Varchar(15),
@Phone Varchar(15),
@AltPhone Varchar(15),
@Email Varchar(35),
@Clientid int OUTPUT
AS
BEGIN

INSERT INTO Clients
(Firstname, Lastname, MiddleName)
Values
(@Firstname, @Lastname, @MiddleName)

Set @clientid = (Select top 1 SCOPE_IDENTITY() from clients)

INSERT INTO Clientcontacts
(Clientid, addresstype, AddressLine1, Addressline2, city, StateProvince, PostalCode, phone, AltPhone, email)
VALUES
(@Clientid, @addresstype, @AddressLine1, @Addressline2, @city, @StateProvince, @PostalCode, @phone, @AltPhone, @email)

Select @Clientid
FROM Clients
END
GO


CREATE PROCEDURE SP_CreateNewEmployee


 @LastName varchar(25),
 @Firstname varchar(25),
 @MiddleName varchar(25),
 @Hiredate DATE,
 @Title varchar(50),
 @AddressLine1 Varchar(50),
 @Addressline2 Varchar(50),
 @City Varchar(35),
 @StateProvince Varchar(25),
 @PostalCode Varchar(15),
 @Phone Varchar(15),
 @AltPhone Varchar(15),
 @EmployeeID INT OUTPUT
 AS
 BEGIN

 INSERT INTO Employees
(Firstname, Lastname, MiddleName, hiredate, title)
Values
(@Firstname, @Lastname, @MiddleName, @hiredate, @title)

Set @employeeid = (Select top 1 SCOPE_IDENTITY() from Employees)

INSERT INTO EmployeeContactInfo
(AddressLine1, Addressline2, city, StateProvince, PostalCode, phone, AltPhone, Employeeid)
VALUES
(@AddressLine1, @Addressline2, @city, @StateProvince, @PostalCode, @phone, @AltPhone, @Employeeid)

SELECT @employeeID
FROM Employees
END
GO


   PRINT '-- Procedures Created'



       IF (Select COUNT(*) from Sys.syslogins s where s.loginname = 'vetmanager') > 0 
 BEGIN
 DROP login vetmanager
 END 
 GO

  CREATE LOGIN VetManager
  WITH PASSWORD = 'VTMAN3357';
  GO
    
  CREATE USER VetManager FOR LOGIN VetManager;
  GO

         IF (Select COUNT(*) from Sys.syslogins s where s.loginname = 'vetclerk') > 0 
 BEGIN
 DROP login vetclerk
 END 
 GO

  CREATE LOGIN VetClerk
  WITH PASSWORD = 'ClerkV0829';
  GO 

  CREATE USER Vetclerk FOR LOGIN Vetclerk;
  GO

  ALTER ROLE db_datareader ADD MEMBER VetManager;
  GO

  ALTER ROLE db_datawriter ADD MEMBER VetManager;
  GO

  ALTER ROLE db_datareader ADD MEMBER VetClerk;
  GO

  DENY ALTER ON OBJECT::
  Clientcontacts
  TO Vetclerk

  DENY SELECT ON OBJECT::
  Clientcontacts
  TO Vetclerk

  DENY UPDATE ON OBJECT::
  Clientcontacts
  TO Vetclerk

  DENY INSERT ON OBJECT:: 
   Clientcontacts
  TO Vetclerk

  DENY DELETE ON OBJECT::
   Clientcontacts
  TO Vetclerk

    DENY ALTER ON OBJECT::
  EmployeeContactInfo
  TO Vetclerk

  DENY SELECT ON OBJECT::
  EmployeeContactInfo
  TO Vetclerk

  DENY UPDATE ON OBJECT::
  EmployeeContactInfo
  TO Vetclerk

  DENY INSERT ON OBJECT:: 
   EmployeeContactInfo
  TO Vetclerk

  DENY DELETE ON OBJECT::
   EmployeeContactInfo
  TO Vetclerk

     GRANT EXEC ON OBJECT::
 sp_breed 
 TO VETCLERK

     GRANT EXEC ON OBJECT::
 SP_MailingList
 to vetclerk

  GRANT EXEC ON OBJECT::
 SP_billing
 to vetclerk

   GRANT EXEC ON OBJECT::
 sp_species 
 TO VETCLERK

    PRINT '-- Permissions Granted to user VetClerk'

     GRANT EXEC ON OBJECT::
 sp_breed 
 TO vetmanager

     GRANT EXEC ON OBJECT::
 SP_MailingList
 to vetmanager

  GRANT EXEC ON OBJECT::
 SP_billing
 to vetmanager

   GRANT EXEC ON OBJECT::
 sp_species 
 TO vetmanager

  GRANT EXEC ON OBJECT::
 sp_CreateNewClient
 TO vetmanager

  GRANT EXEC ON OBJECT::
 sp_CreateNewEmployee
 TO vetmanager
 
    PRINT '-- Permissions Granted to user VetManager'


	