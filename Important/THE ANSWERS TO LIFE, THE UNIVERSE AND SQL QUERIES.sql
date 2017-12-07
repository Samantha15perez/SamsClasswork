


/*

- What is the average sales, not including freight, for each month of the year - January through December? (12 rows)
*/

select		MonthlyTotals.[Month], CAST(AVG(MonthlyTotals.Sales) AS decimal(10,2))
from
	(select		DATEPART(Year, soh.OrderDate) [Year], DATEPART(MONTH, soh.OrderDate) [Month], sum(sod.UnitPrice * sod.OrderQty) [Sales]
	from		sales.SalesOrderHeader soh
	inner join	sales.SalesOrderDetail sod
	on			sod.SalesOrderID = soh.SalesOrderID
	group by	DATEPART(Year, soh.OrderDate), DATEPART(MONTH, soh.OrderDate)) MonthlyTotals
GROUP BY	MonthlyTotals.[Month], DATENAME(MONTH, MonthlyTotals.[Month])


-- Proof query
	select		DATEPART(YEAR, soh.OrderDate), DATEPART(MONTH, soh.OrderDate), sum(sod.UnitPrice * sod.OrderQty) [Sales]
	from		sales.SalesOrderHeader soh
	inner join	sales.SalesOrderDetail sod
	on			sod.SalesOrderID = soh.SalesOrderID
	where		DATEPART(MONTH, soh.OrderDate) = 1
	group by	DATEPART(YEAR, soh.OrderDate), DATEPART(MONTH, soh.OrderDate)

	select (2088218.4151 + 4292364.4301 + 3970636.4313) / 3


/*

- What is the average number of orders per day of the month? (31 rows)

*/

SELECT	OrdersPerDay.[Day of Month], AVG(OrdersPerDay.[Order Count])	
FROM
		(select		DATEPART(DAY, soh.OrderDate) [Day of Month], count(soh.SalesOrderID) [Order Count]
		from		sales.SalesOrderHeader soh
		GROUP BY	soh.OrderDate) [OrdersPerDay]
GROUP BY	OrdersPerDay.[Day of Month]
ORDER BY	OrdersPerDay.[Day of Month]

-- Proof query
SELECT		AVG(COUNTS.[Order Count])		
	FROM
	(select		count(soh.SalesOrderID) [Order Count]
	from		sales.SalesOrderHeader soh
	WHERE		DATEPART(DAY, soh.OrderDate) = 2
	GROUP BY	SOH.OrderDate) [Counts]


/*

- What is the average sales per day of the month? (31 rows)

*/


select		DailyTotals.[DayOfMonth], AVG(DailyTotals.Sales)
from		
	(select		DATEPART(DAY, soh.OrderDate) [DayOfMonth], sum(sod.UnitPrice * sod.OrderQty) [Sales]
	from		sales.SalesOrderHeader soh
	inner join	sales.SalesOrderDetail sod
	on			sod.SalesOrderID = soh.SalesOrderID
	group by	soh.OrderDate) [DailyTotals]
GROUP BY	DailyTotals.[DayOfMonth]
ORDER BY	DailyTotals.[DayOfMonth]


-- Proof - two steps

select		sum(sod.UnitPrice * sod.OrderQty) [Sales]
from		sales.SalesOrderHeader soh
inner join	sales.SalesOrderDetail sod
on			sod.SalesOrderID = soh.SalesOrderID
WHERE		DATEPART(DAY, SOH.OrderDate) = 1

-- 14249758.0193

select		count(distinct soh.OrderDate)
from		Sales.SalesOrderHeader SOH
WHERE		DATEPART(DAY, SOH.OrderDate) = 1

-- 37

select (14249758.0193 / 37)

-- 385128.5951162