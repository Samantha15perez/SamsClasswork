---------------------------------------------------------------------------------1
-- Cursor
DECLARE ShippingStatusChange CURSOR
	FOR SELECT TOP 1000 SalesOrderID, [Status] FROM Sales.SalesOrderHeader

OPEN ShippingStatusChange

WHILE @@Fetch_status = 0
BEGIN
UPDATE Sales.SalesOrderHeader
SET Status = (SELECT ROUND(((RAND() + .5) * 2), 0))
WHERE CURRENT OF Shippingstatuschange

	FETCH NEXT FROM ShippingstatusChange
END				
CLOSE ShippingStatusChange
DEALLOCATE ShippingstatusChange



--While Loop

declare @IDselect INT = 44658
 WHILE @idselect !>75123
 BEGIN

	UPDATE sales.salesorderheader
	SET [status] = (SELECT ROUND(((RAND() + .5) * 2), 0))
	where Salesorderid = @IDSELECT


Set @IDSELECT = @IDSELECT + 1
END


select salesorderid, [status] from sales.SalesOrderHeader


-- Reset

UPDATE sales.salesorderheader
SET [status] = 5
where Salesorderid > 44658

--Reset ALL

UPDATE sales.salesorderheader
SET [status] = 5

--double check orders past the first 1000
select Salesorderid, [status] from sales.salesorderheader
where Salesorderid > 44658

--double check ALL ORDERS
select Salesorderid, [status] from sales.salesorderheader
---------------------------------------------------------------------------------2

--Cursor 1
DECLARE [Cursor Name] CURSOR
	FOR SELECT [amt] [column] FROM [Table Name]

OPEN [Cursor Name]

WHILE @@Fetch_status = 0
BEGIN

[IMPORTANT STUFF[

WHERE CURRENT OF [Cursor Name]

	FETCH NEXT FROM [Cursor Name]
END				
CLOSE [Cursor Name]
DEALLOCATE [Cursor Name]

