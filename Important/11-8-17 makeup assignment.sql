 use adventureworks2012

--/*
--Productid- Required. Create using scope identity
--Name- Required.
--ProductNumber- Required. 
--Makeflag- calculated (based on sellstart/sellenddate)
--Finishedgoodsflag- calculated (based on sellstart/sellenddate)
--Color-required.
--SafetyStockLevel-required.
--Reorderpoint-required.
--Standardcost-required.
--listprice-required.
--size-required.
--sizeunitmeasurecode-required.
--weightunitmeasurecode-required.
--weight-required.
--DaysToManufacture-required.
--productline-required.
--class-required.
--style-required.
--productsubcategoryid-Required. Create using scope identity
--productmodelid-Required. Create using scope identity
--sellstartdate-required
--sellenddate-required
--discontinueddate-calculated (based on sellstart/sellenddate)
--rowguid- automatically calculated
--modifieddate- automatically calculated
--*/


--------------------PRODUCT1

--DECLARE @Productid as int = SCOPE_Identity() ;
--Primary key for Product records.
DECLARE @Name1 as nvarchar(20) = 'Decorative Mug'
--Name of the product.
DECLARE @ProductNumber1 as nvarchar(10) = 'DM-2180'
--Unique product identification number.
DECLARE @Makeflag1 as binary = 1
--0 = Product is purchased, 1 = Product is manufactured in-house.
DECLARE @Finishedgoodsflag1 as binary = 1
--0 = Product is not a salable item. 1 = Product is salable.
DECLARE @Color1 as nvarchar(10) = 'White'
--Product color.
DECLARE @SafetyStockLevel1 as decimal = 500
--Minimum inventory quantity. 
DECLARE @Reorderpoint1 as decimal = 200
--Inventory level that triggers a purchase order or work order. 
DECLARE @Standardcost1 as money = 12.00
--Standard cost of the product.
DECLARE @listprice1 as money = (@Standardcost1 * 2.67)
--Selling price.
DECLARE @size1 as decimal = 10
--Product size.
DECLARE @sizeunitmeasurecode1 as nchar(3) = 'CCM'
--Unit of measure for Size column.
DECLARE @weightunitmeasurecode1 as nchar(3) = 'LB'
--Unit of measure for Weight column.
DECLARE @weight1 as decimal = 1
--Product weight.
DECLARE @DaysToManufacture1 as decimal = 1
--Number of days required to manufacture the product.
DECLARE @productline1 as varchar = 'S'
--R = Road, M = Mountain, T = Touring, S = Standard
DECLARE @class1 as nchar = 'L'
--H = High, M = Medium, L = Low
DECLARE @style1 as nchar = 'U'
--W = Womens, M = Mens, U = Universal
DECLARE @productsubcategoryid1 as int
--set @productsubcategoryid = newid();
----Product is a member of this product subcategory. Foreign key to ProductSubCategory.ProductSubCategoryID. 
--DECLARE @productmodelid as int 
--set @productmodelid = newid();
----Product is a member of this product model. Foreign key to ProductModel.ProductModelID.
DECLARE @sellstartdate1 as datetime = GETDATE()
--Date the product was available for sale.
DECLARE @sellenddate1 as datetime = NULL
--Date the product was no longer available for sale.
DECLARE @discontinueddate1 as datetime = NULL
--Date the product was discontinued.

INSERT Production.Product (Name, ProductNumber, Makeflag, Finishedgoodsflag, Color, SafetyStockLevel, Reorderpoint,
Standardcost, listprice, size, sizeunitmeasurecode, weightunitmeasurecode, weight, DaysToManufacture, productline, class, style,
sellstartdate, sellenddate, discontinueddate )

VALUES (@Name1, @Productnumber1,  @Makeflag1, @Finishedgoodsflag1, @Color1, @SafetyStockLevel1, @Reorderpoint1,
@Standardcost1, @listprice1, @size1, @sizeunitmeasurecode1, @weightunitmeasurecode1, @weight1, @DaysToManufacture1, @productline1, @class1, @style1,
@sellstartdate1, @sellenddate1, @discontinueddate1)

Print '--Product1 Now Catalogued'

;


----------------PRODUCT2



--DECLARE @Productid as int = SCOPE_Identity() ;
--Primary key for Product records.
DECLARE @Name2 as nvarchar(20) = 'Anime Figurine'
--Name of the product.
DECLARE @ProductNumber2 as nvarchar(10) = 'AF-9001'
--Unique product identification number.
DECLARE @Makeflag2 as binary = 1
--0 = Product is purchased, 1 = Product is manufactured in-house.
DECLARE @Finishedgoodsflag2 as binary = 1
--0 = Product is not a salable item. 1 = Product is salable.
DECLARE @Color2 as nvarchar(10) = 'Blue'
--Product color.
DECLARE @SafetyStockLevel2 as decimal = 1000
--Minimum inventory quantity. 
DECLARE @Reorderpoint2 as decimal = 350
--Inventory level that triggers a purchase order or work order. 
DECLARE @Standardcost2 as money = 399.00
--Standard cost of the product.
DECLARE @listprice2 as money = (@Standardcost2 * 2.67)
--Selling price.
DECLARE @size2 as decimal = 10
--Product size.
DECLARE @sizeunitmeasurecode2 as nchar(3) = 'CM'
--Unit of measure for Size column.
DECLARE @weightunitmeasurecode2 as nchar(3) = 'LB'
--Unit of measure for Weight column.
DECLARE @weight2 as decimal = 0.5
--Product weight.
DECLARE @DaysToManufacture2 as decimal = 1
--Number of days required to manufacture the product.
DECLARE @productline2 as varchar = 'S'
--R = Road, M = Mountain, T = Touring, S = Standard
DECLARE @class2 as nchar = 'H'
--H = High, M = Medium, L = Low
DECLARE @style2 as nchar = 'U'
--W = Womens, M = Mens, U = Universal
DECLARE @productsubcategoryid2 as int
--set @productsubcategoryid = newid();
----Product is a member of this product subcategory. Foreign key to ProductSubCategory.ProductSubCategoryID. 
--DECLARE @productmodelid as int 
--set @productmodelid = newid();
----Product is a member of this product model. Foreign key to ProductModel.ProductModelID.
DECLARE @sellstartdate2 as datetime = GETDATE()
--Date the product was available for sale.
DECLARE @sellenddate2 as datetime = NULL
--Date the product was no longer available for sale.
DECLARE @discontinueddate2 as datetime = NULL
--Date the product was discontinued.

INSERT Production.Product (Name, ProductNumber, Makeflag, Finishedgoodsflag, Color, SafetyStockLevel, Reorderpoint,
Standardcost, listprice, size, sizeunitmeasurecode, weightunitmeasurecode, weight, DaysToManufacture, productline, class, style,
sellstartdate, sellenddate, discontinueddate )

VALUES (@Name2, @Productnumber2,  @Makeflag2, @Finishedgoodsflag2, @Color2, @SafetyStockLevel2, @Reorderpoint2,
@Standardcost2, @listprice2, @size2, @sizeunitmeasurecode2, @weightunitmeasurecode2, @weight2, @DaysToManufacture2, @productline2, @class2, @style2,
@sellstartdate2, @sellenddate2, @discontinueddate2)

Print '--Product2 Now Catalogued'


;

------------------PRODUCT3

 

--DECLARE @Productid as int = SCOPE_Identity() ;
--Primary key for Product records.
DECLARE @Name3 as nvarchar(30) = 'Generic 90s Anime Shirt'
--Name of the product.
DECLARE @ProductNumber3 as nvarchar(10) = 'AS-2425'
--Unique product identification number.
DECLARE @Makeflag3 as binary = 1
--0 = Product is purchased, 1 = Product is manufactured in-house.
DECLARE @Finishedgoodsflag3 as binary = 1
--0 = Product is not a salable item. 1 = Product is salable.
DECLARE @Color3 as nvarchar(10) = 'Red'
--Product color.
DECLARE @SafetyStockLevel3 as decimal = 240
--Minimum inventory quantity. 
DECLARE @Reorderpoint3 as decimal = 90
--Inventory level that triggers a purchase order or work order. 
DECLARE @Standardcost3 as money = 9
--Standard cost of the product.
DECLARE @listprice3 as money = (@Standardcost3 * 2.67)
--Selling price.
DECLARE @size3 as decimal = 67
--Product size.
DECLARE @sizeunitmeasurecode3 as nchar(3) = 'CM'
--Unit of measure for Size column.
DECLARE @weightunitmeasurecode3 as nchar(3) = 'LB'
--Unit of measure for Weight column.
DECLARE @weight3 as decimal = 0.5
--Product weight.
DECLARE @DaysToManufacture3 as decimal = 1
--Number of days required to manufacture the product.
DECLARE @productline3 as varchar = 'S'
--R = Road, M = Mountain, T = Touring, S = Standard
DECLARE @class3 as nchar = 'M'
--H = High, M = Medium, L = Low
DECLARE @style3 as nchar = 'M'
--W = Womens, M = Mens, U = Universal
DECLARE @productsubcategoryid3 as int
--set @productsubcategoryid = newid();
--Product is a member of this product subcategory. Foreign key to ProductSubCategory.ProductSubCategoryID. 
--DECLARE @productmodelid as int 
--set @productmodelid = newid();
----Product is a member of this product model. Foreign key to ProductModel.ProductModelID.
DECLARE @sellstartdate3 as datetime = GETDATE()
--Date the product was available for sale.
DECLARE @sellenddate3 as datetime = NULL
--Date the product was no longer available for sale.
DECLARE @discontinueddate3 as datetime = NULL
--Date the product was discontinued.

INSERT Production.Product (Name, ProductNumber, Makeflag, Finishedgoodsflag, Color, SafetyStockLevel, Reorderpoint,
Standardcost, listprice, size, sizeunitmeasurecode, weightunitmeasurecode, weight, DaysToManufacture, productline, class, style,
sellstartdate, sellenddate, discontinueddate )

VALUES (@Name3, @Productnumber3,  @Makeflag3, @Finishedgoodsflag3, @Color3, @SafetyStockLevel3, @Reorderpoint3,
@Standardcost3, @listprice3, @size3, @sizeunitmeasurecode3, @weightunitmeasurecode3, @weight3, @DaysToManufacture3, @productline3, @class3, @style3,
@sellstartdate3, @sellenddate3, @discontinueddate3)

Print '--Product3 Now Catalogued'


--SELECT * 
--FROM Production.Product
--where name = @Name


/* PRODUCTS CREATED */

--Salesorderdetail>Specialofferproduct>Specialoffer


INSERT Sales.specialofferproduct (Specialofferid, productid)
VALUES ( 1, (Select Productid FROM Production.product WHERE Name = @Name1))


PRINT 'Created Discount Information For Product 1'

INSERT Sales.specialofferproduct (Specialofferid, productid)
VALUES ( 1, (Select Productid FROM Production.product WHERE Name = @Name2))


PRINT 'Created Discount Information For Product 2'

INSERT Sales.specialofferproduct (Specialofferid, productid)
VALUES ( 1, (Select Productid FROM Production.product WHERE Name = @Name3))


PRINT 'Created Discount Information For Product 3'


--Sales.SalesOrderdetail

 

DECLARE @carriertrackingnumber1 as nvarchar(25) = (SELECT TOP 1 carriertrackingNumber from sales.salesorderdetail)
DECLARE @orderqty1 as int = 3
DECLARE @Unitprice1 as nchar(8) = (Select (@orderqty1 * @Listprice1))
DECLARE @Unitpricediscount1 as money = 0
DECLARE @LineTotal1 as money = (@Unitprice1 - (@unitprice1 * @unitpricediscount1))




--sales.salesorderheader


DECLARE @RevisionNumber1 as tinyint = 3
DECLARE @Orderdate1 as datetime ='2005-07-01 00:00:00.000'
DECLARE @Duedate1 as datetime ='2005-07-13 00:00:00.000'
DECLARE @shipdate1 as datetime ='2005-07-08 00:00:00.000'
DECLARE @status1 as  tinyint = 5
DECLARE @onlineorderflag1 as  binary = 1
--DECLARE @salesordernumber as 
--DECLARE @purchaseordernumber as 
DECLARE @accountnumber1 as nvarchar(20) = (SELECt top 1 AccountNumber FROM Sales.Salesorderheader)
DECLARE @customerid1 as decimal(5) = (SELECT top 1 Customerid from sales.salesorderheader WHERE accountnumber = @Accountnumber1)
DECLARE @salespersonid1 as decimal(3) = (SELECT top 1 SalesPersonID FROM Sales.Salesorderheader WHERE salespersonid IS NOT NULL)
DECLARE @SalesOrderid1 as decimal(5) = (SELECT top 1 Salesorderid FROM Sales.Salesorderheader WHERE salespersonid IS NOT NULL)
DECLARE @territoryid1 as int = (SELECT TOP 1 Territoryid from sales.salesorderheader WHERE SalespersonID = @salespersonid1)
DECLARE @billtoaddressid1 as int = (SELECT top 1 billtoaddressid FROM sales.salesorderheader where customerid = @customerid1)
DECLARE @shiptoaddressid1 as int = @billtoaddressid1 /*since they're the same*/
DECLARE @shipmethodid1 as  int = 5
DECLARE @creditcardid1 as int= (SELECT top 1 creditcardid from sales.salesorderheader WHERE customerid = @customerid1)
DECLARE @creditcardapprovalcode1 as varchar(15)= (SELECT TOP 1 creditcardapprovalcode from sales.salesorderheader WHERE creditcardid = @creditcardid1)
DECLARE @currencyrateid1 as  varchar(15) = NULL
DECLARE @subtotal1 as  money = @LineTotal1
DECLARE @taxamt1 as  money= (@Subtotal1 * 1.11)
DECLARE @freight1 as  money= (@Subtotal1 * 1.33)


INSERT Sales.SalesOrderDetail (SalesOrderid, Carriertrackingnumber, orderqty,ProductID, SpecialOfferID, unitprice, UnitPriceDiscount)

VALUES (@Salesorderid1, @carriertrackingnumber1, @orderqty1, (SELECT Productid from production.product where name = @Name1), 1, @Unitprice1, @Unitpricediscount1)


INSERT Sales.Salesorderheader (RevisionNumber, Orderdate, Duedate, shipdate, status, onlineorderflag, 
accountnumber, customerid, salespersonid, territoryid, billtoaddressid, shiptoaddressid, shipmethodid, creditcardid, creditcardapprovalcode, 
currencyrateid, subtotal, taxamt, freight)

VALUES (@RevisionNumber1, @Orderdate1, @Duedate1, @shipdate1, @status1, @onlineorderflag1, 
@accountnumber1, @customerid1, @salespersonid1, @territoryid1, @billtoaddressid1, @shiptoaddressid1, @shipmethodid1, @creditcardid1, @creditcardapprovalcode1, 
@currencyrateid1, @subtotal1, @taxamt1, @freight1)


PRINT 'Order for Product1'

---------------------2

 

DECLARE @carriertrackingnumber2 as nvarchar(25) = (SELECT TOP 1 carriertrackingNumber from sales.salesorderdetail)
DECLARE @orderqty2 as int = 8
DECLARE @Unitprice2 as nchar(8) = (Select (@orderqty2 * @Listprice2))
DECLARE @Unitpricediscount2 as money = 0
DECLARE @LineTotal2 as money = (@Unitprice2 - (@unitprice2 * @unitpricediscount2))




--sales.salesorderheader


DECLARE @RevisionNumber2 as tinyint = 3
DECLARE @Orderdate2 as datetime ='2009-06-24 00:00:00.000'
DECLARE @Duedate2 as datetime ='2010-07-11 00:00:00.000'
DECLARE @shipdate2 as datetime ='2010-07-09 00:00:00.000'
DECLARE @status2 as  tinyint = 5
DECLARE @onlineorderflag2 as  binary = 1
--DECLARE @salesordernumber as 
--DECLARE @purchaseordernumber as 
DECLARE @accountnumber2 as nvarchar(20) = (SELECt top 1 AccountNumber FROM Sales.Salesorderheader)
DECLARE @customerid2 as decimal(5) = (SELECT top 1 Customerid from sales.salesorderheader WHERE accountnumber = @Accountnumber2)
DECLARE @salespersonid2 as decimal(3) = (SELECT top 1 SalesPersonID FROM Sales.Salesorderheader WHERE salespersonid IS NOT NULL)
DECLARE @SalesOrderid2 as decimal(5) = (SELECT top 1 Salesorderid FROM Sales.Salesorderheader WHERE salespersonid IS NOT NULL)
DECLARE @territoryid2 as int = (SELECT TOP 1 Territoryid from sales.salesorderheader WHERE SalespersonID = @salespersonid2)
DECLARE @billtoaddressid2 as int = (SELECT top 1 billtoaddressid FROM sales.salesorderheader where customerid = @customerid2)
DECLARE @shiptoaddressid2 as int = @billtoaddressid2 /*since they're the same*/
DECLARE @shipmethodid2 as  int = 5
DECLARE @creditcardid2 as int= (SELECT top 1 creditcardid from sales.salesorderheader WHERE customerid = @customerid2)
DECLARE @creditcardapprovalcode2 as varchar(15)= (SELECT TOP 1 creditcardapprovalcode from sales.salesorderheader WHERE creditcardid = @creditcardid2)
DECLARE @currencyrateid2 as  varchar(15) = NULL
DECLARE @subtotal2 as  money = @LineTotal2
DECLARE @taxamt2 as  money= (@Subtotal2 * 1.11)
DECLARE @freight2 as  money= (@Subtotal2 * 1.33)


INSERT Sales.SalesOrderDetail (SalesOrderid, Carriertrackingnumber, orderqty,ProductID, SpecialOfferID, unitprice, UnitPriceDiscount)

VALUES (@Salesorderid2, @carriertrackingnumber2, @orderqty2, (SELECT Productid from production.product where name = @Name2), 1, @Unitprice2, @Unitpricediscount2)


INSERT Sales.Salesorderheader (RevisionNumber, Orderdate, Duedate, shipdate, status, onlineorderflag, 
accountnumber, customerid, salespersonid, territoryid, billtoaddressid, shiptoaddressid, shipmethodid, creditcardid, creditcardapprovalcode, 
currencyrateid, subtotal, taxamt, freight)

VALUES (@RevisionNumber2, @Orderdate2, @Duedate2, @shipdate2, @status2, @onlineorderflag2, 
@accountnumber2, @customerid2, @salespersonid2, @territoryid2, @billtoaddressid2, @shiptoaddressid2, @shipmethodid2, @creditcardid2, @creditcardapprovalcode2, 
@currencyrateid2, @subtotal2, @taxamt2, @freight2)


PRINT 'Order for Product2'

--------------------3

 

DECLARE @carriertrackingnumber3 as nvarchar(25) = (SELECT TOP 1 carriertrackingNumber from sales.salesorderdetail)
DECLARE @orderqty3 as int = 17
DECLARE @Unitprice3 as nchar(8) = (Select (@orderqty3 * @Listprice3))
DECLARE @Unitpricediscount3 as money = 0
DECLARE @LineTotal3 as money = (@Unitprice3 - (@unitprice3 * @unitpricediscount3))




--sales.salesorderheader


DECLARE @RevisionNumber3 as tinyint = 3
DECLARE @Orderdate3 as datetime ='2005-07-01 00:00:00.000'
DECLARE @Duedate3 as datetime ='2005-12-18 00:00:00.000'
DECLARE @shipdate3 as datetime ='2006-01-08 00:00:00.000'
DECLARE @status3 as  tinyint = 5
DECLARE @onlineorderflag3 as  binary = 1
--DECLARE @salesordernumber as 
--DECLARE @purchaseordernumber as 
DECLARE @accountnumber3 as nvarchar(20) = (SELECt top 1 AccountNumber FROM Sales.Salesorderheader)
DECLARE @customerid3 as decimal(5) = (SELECT top 1 Customerid from sales.salesorderheader WHERE accountnumber = @Accountnumber3)
DECLARE @salespersonid3 as decimal(3) = (SELECT top 1 SalesPersonID FROM Sales.Salesorderheader WHERE salespersonid IS NOT NULL)
DECLARE @SalesOrderid3 as decimal(5) = (SELECT top 1 Salesorderid FROM Sales.Salesorderheader WHERE salespersonid IS NOT NULL)
DECLARE @territoryid3 as int = (SELECT TOP 1 Territoryid from sales.salesorderheader WHERE SalespersonID = @salespersonid3)
DECLARE @billtoaddressid3 as int = (SELECT top 1 billtoaddressid FROM sales.salesorderheader where customerid = @customerid3)
DECLARE @shiptoaddressid3 as int = @billtoaddressid3 /*since they're the same*/
DECLARE @shipmethodid3 as  int = 5
DECLARE @creditcardid3 as int= (SELECT top 1 creditcardid from sales.salesorderheader WHERE customerid = @customerid3)
DECLARE @creditcardapprovalcode3 as varchar(15)= (SELECT TOP 1 creditcardapprovalcode from sales.salesorderheader WHERE creditcardid = @creditcardid3)
DECLARE @currencyrateid3 as  varchar(15) = NULL
DECLARE @subtotal3 as  money = @LineTotal3
DECLARE @taxamt3 as  money= (@Subtotal3 * 1.11)
DECLARE @freight3 as  money= (@Subtotal3 * 1.33)


INSERT Sales.SalesOrderDetail (SalesOrderid, Carriertrackingnumber, orderqty,ProductID, SpecialOfferID, unitprice, UnitPriceDiscount)

VALUES (@Salesorderid3, @carriertrackingnumber3, @orderqty3, (SELECT Productid from production.product where name = @Name3), 1, @Unitprice3, @Unitpricediscount3)


INSERT Sales.Salesorderheader (RevisionNumber, Orderdate, Duedate, shipdate, status, onlineorderflag, 
accountnumber, customerid, salespersonid, territoryid, billtoaddressid, shiptoaddressid, shipmethodid, creditcardid, creditcardapprovalcode, 
currencyrateid, subtotal, taxamt, freight)

VALUES (@RevisionNumber3, @Orderdate3, @Duedate3, @shipdate3, @status3, @onlineorderflag3, 
@accountnumber3, @customerid3, @salespersonid3, @territoryid3, @billtoaddressid3, @shiptoaddressid3, @shipmethodid3, @creditcardid3, @creditcardapprovalcode3, 
@currencyrateid3, @subtotal3, @taxamt3, @freight3)



PRINT 'Order for Product3'





SELECT * 
FROM Production.Product P
LEFT JOIN Sales.SalesOrderDetail SOD
ON SOD.ProductID = P.ProductID
LEFT JOIN Sales.Salesorderheader SOH
on SOH.SalesOrderID = SOD.SalesOrderID
WHERE P.Name IN (@Name1, @name2, @Name3)