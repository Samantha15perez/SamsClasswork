------Challenge 1


----SELECT A.City FROM Purchasing.Vendor V
----INNER JOIN person.BusinessEntityAddress BEA
----ON BEA.BusinessEntityID = V.BusinessEntityID
----inner join Person.Address A
----ON A.AddressID = BEA.AddressID

----INTERSECT

----Select A.City from Sales.Customer C
----INNER JOIN person.BusinessEntityAddress BEA
----ON BEA.BusinessEntityID = C.PersonID
----inner join Person.Address A
----ON A.AddressID = BEA.AddressID
----ORDER BY A.city 


----use adventureworks2014

----Select distinct A.City from Sales.Customer C
----inner JOIN person.BusinessEntityAddress BEA
----ON BEA.BusinessEntityID = C.Personid
----inner join Person.Address A
----ON A.AddressID = BEA.AddressID
----left JOIN Purchasing.Vendor V
----ON V.businessentityid = BEA.Businessentityid
----group  by city, V.BusinessEntityID, C.Personid
----HAVING city in (SELECT A.City FROM Purchasing.Vendor V
----INNER JOIN person.BusinessEntityAddress BEA
----ON BEA.BusinessEntityID = V.BusinessEntityID
----inner join Person.Address A
----ON A.AddressID = BEA.AddressID) 
----AND city in (Select A.City from Sales.Customer C
----INNER JOIN person.BusinessEntityAddress BEA
----ON BEA.BusinessEntityID = C.Personid
----inner join Person.Address A
----ON A.AddressID = BEA.AddressID)


-------------------------

------Challenge 2


----Select A.City from Sales.Customer C
----INNER JOIN person.BusinessEntityAddress BEA
----ON BEA.BusinessEntityID = C.Personid
----inner join Person.Address A
----ON A.AddressID = BEA.AddressID

----EXCEPT

----SELECT A.City FROM Purchasing.Vendor V
----INNER JOIN person.BusinessEntityAddress BEA
----ON BEA.BusinessEntityID = V.BusinessEntityID
----inner join Person.Address A
----ON A.AddressID = BEA.AddressID
----order by a.city






----Select distinct A.City from Sales.Customer C
----inner JOIN person.BusinessEntityAddress BEA
----ON BEA.BusinessEntityID = C.Personid
----inner join Person.Address A
----ON A.AddressID = BEA.AddressID
----left JOIN Purchasing.Vendor V
----ON V.businessentityid = BEA.Businessentityid
----group  by city, V.BusinessEntityID, C.Personid
----HAVING city in (Select A.City from Sales.Customer C
----INNER JOIN person.BusinessEntityAddress BEA
----ON BEA.BusinessEntityID = C.Personid
----inner join Person.Address A
----ON A.AddressID = BEA.AddressID) AND city not in
----(SELECT A.City FROM Purchasing.Vendor V
----INNER JOIN person.BusinessEntityAddress BEA
----ON BEA.BusinessEntityID = V.BusinessEntityID
----inner join Person.Address A
----ON A.AddressID = BEA.AddressID)




----SELECT		CustomerID, StoreID [BusinessEntityID]
----FROM		Sales.Customer
----WHERE		StoreID IS NOT NULL
----	UNION ALL
----SELECT		CustomerID, PersonID [BusinessEntityID] 
----FROM		Sales.Customer
----WHERE		StoreID IS NULL AND PersonID IS NOT NULL


SELECT P.Productid, P.Name
FROM Production.product p
left join Sales.Salesorderdetail SOD
on sod.ProductID = p.ProductID

EXCEPT

SELECT SOD.Productid, P.name
FROM Sales.Salesorderdetail SOD
left join production.product p 
on p.productid = sod.productid
order by ProductID


SELECT P.Productid, max(P.Name)[Name]
from production.product P
left JOIN Sales.Salesorderdetail SOD
on SOD.ProductID = p.ProductID
group by P.productid
having p.productid not in (SELECT SOD.Productid
FROM Sales.Salesorderdetail SOD
left join production.product p 
on p.productid = sod.productid)
order by ProductID