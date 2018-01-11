use AdventureWorks2012
IF EXISTS ( SELECT  1
            FROM    Information_schema.Routines
            WHERE   Specific_schema = 'dbo'
                    AND specific_name = 'CreditCardCheck'
                    AND Routine_Type = 'scalar' ) 
DROP function dbo.CreditCardCheck
go
IF EXISTS ( SELECT  1
            FROM    Information_schema.Routines
            WHERE   Specific_schema = 'dbo'
                    AND specific_name = 'Provincetax'
                    AND Routine_Type = 'scalar' ) 
DROP FUNCTION dbo.ProvinceTax
go
IF EXISTS ( SELECT  1
            FROM    Information_schema.Routines
            WHERE   Specific_schema = 'dbo'
                    AND specific_name = 'InchestoCentimeters'
                    AND Routine_Type = 'scalar' ) 
DROP FUNCTION dbo.InchesToCentimeters
go
IF EXISTS ( SELECT  1
            FROM    Information_schema.Routines
            WHERE   Specific_schema = 'dbo'
                    AND specific_name = 'gallonstoliters'
                    AND Routine_Type = 'scalar' ) 
DROP FUNCTION dbo.GallonsToLiters
go
IF EXISTS ( SELECT  1
            FROM    Information_schema.Routines
            WHERE   Specific_schema = 'dbo'
                    AND specific_name = 'Poundstokilograms'
                    AND Routine_Type = 'scalar' ) 
DROP FUNCTION dbo.Poundstokilograms;
go
CREATE FUNCTION dbo.CreditCardCheck (@cardnumber Nvarchar(25))
RETURNS Varchar(max)
AS
BEGIN

declare @expiration VARCHAR(MAX) = (Select EOMONTH(DATEFROMPARTS(Expyear, Expmonth, 1)) FROM Sales.Creditcard WHERE Cardnumber = @Cardnumber)

RETURN @expiration
END

--stateprovinceid and taxid to tax rate
GO


CREATE FUNCTION dbo.ProvinceTax
(
@Province INT,
@Tax TINYINT
)
RETURNS SMALLMONEY
AS
BEGIN
DECLARE @Rate SMALLMONEY

SET @Rate = (SELECT TaxRate FROM Sales.SalesTaxRate WHERE StateProvinceID = @Province AND TaxType = @Tax)

IF @Rate IS NULL
    BEGIN
    SET @Rate = 0
    END

RETURN @Rate
END

GO

--Inches to Centimeters Conversion


go
CREATE FUNCTION dbo.InchesToCentimeters (@Input int)
RETURNS Decimal
AS
BEGIN
DECLARE @Output Decimal =(@input * 2.54)
RETURN @Output
END


--Gallons to liters

go
CREATE FUNCTION dbo.GallonsToLiters (@Input2 int)
RETURNS Decimal
AS
BEGIN
DECLARE @Output2 Decimal =(@input2 * 3.78541)
RETURN @Output2
END

--pounds to kilograms


go
CREATE FUNCTION dbo.PoundsToKilograms (@Input3 int)
RETURNS Decimal
AS
BEGIN
DECLARE @Output3 Decimal =(@input3 * 0.453592)
RETURN @Output3
END



go
select dbo.creditcardcheck(33332664695310)
select dbo.provincetax(1, 2)
select dbo.InchesToCentimeters(30)
select dbo.GallonsToLiters(45)
select dbo.PoundsToKilograms(66)



