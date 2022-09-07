
-- 1. ---------- Profitability ---------

-- 1.1 - Most profitable Product Category
-- 1.2 - Most profitable Product Sub-Category
-- 1.3 - Most profitable Product
-- 1.4 - Most profitable Region
-- 1.5 - Most profitable State
-- 1.6 - Most profitable City
-- 1.7 - Most profitable Client
-- 1.8 - TOP 10 State profitability
-- 1.9 - TOP 10 City profitability

-- 2. ---------- Sales ----------

-- 2.1 - Biggest sales generating Product Category
-- 2.2 - Biggest sales generating Product Sub-Category
-- 2.3 - Biggest sales generating Product
-- 2.4 - Biggest sales generating Region
-- 2.5 - Biggest sales generating State
-- 2.6 - Biggest sales generating City
-- 2.7 - Biggest sales generating Client

-- 3. ---------- Quantity saled ----------

-- 3.1 - Most quantity saled per Product Category
-- 3.2 - Most quantity saled per Product Sub-Category
-- 3.3 - Most quantity saled per Product
-- 3.4 - Most quantity saled per Region
-- 3.5 - Most quantity saled per State
-- 3.6 - Most quantity saled per City
-- 3.7 - Most quantity saled per Client

-- 4. ---------- Shipping time ----------

-- 4.1 - Averange shipping duration per Product Category
-- 4.2 - Averange shipping duration per Product Sub-Category
-- 4.3 - Averange shipping duration per Product
-- 4.4 - Averange shipping duration per Region
-- 4.5 - Averange shipping duration per State
-- 4.6 - Averange shipping duration per City

-- 5. ---------- Profitability per Unit ---------

-- 5.1 - Most ppu Product Category
-- 5.2 - Most ppu Product Sub-Category
-- 5.3 - Most ppu Product
-- 5.4 - Most ppu Region
-- 5.5 - Most ppu State
-- 5.6 - Most ppu City
-- 5.7 - Most ppu Client
-- 5.8 - MIN ppu per City
-- 5.9 - MAX ppu per City

-- 6. ---------- New York City vs Los Ageles ---------

-- 6.1 - New York City vs Los Ageles



----- View source data

SELECT *
FROM Orders
ORDER BY [Product Name] ASC



----- Visualizating the data


--- Categories, Sub-Categories, Product Names

SELECT DISTINCT Category, [Sub-Category]
FROM Orders
ORDER BY 1

SELECT DISTINCT [Sub-Category]
FROM Orders
ORDER BY 1

SELECT DISTINCT [Product Name]
FROM Orders
ORDER BY 1


--- Location: Regions - States - Cities

SELECT DISTINCT Region
FROM Orders
ORDER BY 1

SELECT DISTINCT State
FROM Orders
ORDER BY 1

SELECT DISTINCT City
FROM Orders
ORDER BY 1


--- Ship Modes

SELECT DISTINCT [Ship Mode]
FROM Orders


--- Client

SELECT DISTINCT Segment
FROM Orders





----- Manipulating Data



----- 1. ----- Profitability


-- Main!

SELECT Category, [Sub-Category],[Product Name], Region, State, City, SUM(Profit) as Profit
FROM Orders
GROUP BY Category, [Sub-Category],[Product Name], Region, State, City
ORDER BY Profit DESC

-- 1.1
SELECT Category, SUM(Profit) as Profit
FROM Orders
GROUP BY Category
ORDER BY 2 DESC

-- 1.2
SELECT [Sub-Category], SUM(Profit) as Profit
FROM Orders
GROUP BY [Sub-Category]
ORDER BY 2 DESC

-- 1.3
SELECT [Product Name], SUM(Profit) as Profit
FROM Orders
GROUP BY [Product Name]
ORDER BY 2 DESC

-- 1.4
SELECT Region, SUM(Profit) as Profit
FROM Orders
GROUP BY Region
ORDER BY 2 DESC

-- 1.5
SELECT State, SUM(Profit) as Profit
FROM Orders
GROUP BY State
ORDER BY 2 DESC

-- 1.6
SELECT City, SUM(Profit) as Profit
FROM Orders
GROUP BY City
ORDER BY 2 DESC

-- 1.7
SELECT Segment, SUM(Profit) as Profit
FROM Orders
GROUP BY Segment
ORDER BY 2 DESC

-- 1.8

SELECT TOP 10 State, SUM(Profit) as Profit 
FROM Orders
GROUP BY  State
ORDER BY Profit DESC

-- 1.9 

SELECT TOP 10 City, SUM(Profit) as Profit 
FROM Orders
GROUP BY  City
ORDER BY Profit DESC



----- 2. ----- Sales


-- Main!

SELECT Category, [Sub-Category],[Product Name], Region, State, City, SUM(Sales) as Sales
FROM Orders
GROUP BY Category, [Sub-Category],[Product Name], Region, State, City
ORDER BY Sales DESC

-- 2.1
SELECT Category, SUM(Sales) as Sales
FROM Orders
GROUP BY Category
ORDER BY Sales DESC

-- 2.2
SELECT [Sub-Category], SUM(Sales) as Sales
FROM Orders
GROUP BY [Sub-Category]
ORDER BY Sales DESC

-- 2.3
SELECT [Product Name], SUM(Sales) as Sales
FROM Orders
GROUP BY [Product Name]
ORDER BY Sales DESC

-- 2.4
SELECT Region, SUM(Sales) as Sales
FROM Orders
GROUP BY Region
ORDER BY Sales DESC

-- 2.5
SELECT State, SUM(Sales) as Sales
FROM Orders
GROUP BY State
ORDER BY Sales DESC

-- 2.6
SELECT City, SUM(Sales) as Sales
FROM Orders
GROUP BY City
ORDER BY Sales DESC

-- 2.7
SELECT Segment, SUM(Sales) as Sales
FROM Orders
GROUP BY Segment
ORDER BY Sales DESC



----- 3. ----- Quantity Saled


-- Main!

SELECT Category, [Sub-Category],[Product Name], Region, State, City, SUM(Quantity) as Quantity
FROM Orders
GROUP BY Category, [Sub-Category],[Product Name], Region, State, City
ORDER BY Quantity DESC

-- 3.1
SELECT Category, SUM(Quantity) as Quantity
FROM Orders
GROUP BY Category
ORDER BY Quantity DESC

-- 3.2
SELECT [Sub-Category], SUM(Quantity) as Quantity
FROM Orders
GROUP BY [Sub-Category]
ORDER BY Quantity DESC

-- 3.3
SELECT [Product Name], SUM(Quantity) as Quantity
FROM Orders
GROUP BY [Product Name]
ORDER BY Quantity DESC

-- 3.4
SELECT Region, SUM(Quantity) as Quantity
FROM Orders
GROUP BY Region
ORDER BY Quantity DESC

-- 3.5
SELECT State, SUM(Quantity) as Quantity
FROM Orders
GROUP BY State
ORDER BY Quantity DESC

-- 3.6
SELECT City, SUM(Quantity) as Quantity
FROM Orders
GROUP BY City
ORDER BY Quantity DESC

-- 3.7
SELECT Segment, SUM(Quantity) as Quantity
FROM Orders
GROUP BY Segment
ORDER BY Quantity DESC



----- 4. ----- AVG Shipping Duration


-- Main!

SELECT Category, [Sub-Category],[Product Name], Region, State, City, AVG([Shipping duration (days)]) AS [Avg. Shipping duration (days)]
FROM Orders
GROUP BY Category, [Sub-Category],[Product Name], Region, State, City
ORDER BY [Avg. Shipping duration (days)] DESC

-- 4.1
SELECT Category, AVG([Shipping duration (days)]) AS [Avg. Shipping duration (days)]
FROM Orders
GROUP BY Category
ORDER BY 2 DESC

-- 4.2
SELECT [Sub-Category], AVG([Shipping duration (days)]) AS [Avg. Shipping duration (days)]
FROM Orders
GROUP BY [Sub-Category]
ORDER BY 2 DESC

-- 4.3
SELECT  [Product Name], AVG([Shipping duration (days)]) AS [Avg. Shipping duration (days)]
FROM Orders
GROUP BY [Product Name]
ORDER BY 2 DESC


-- 4.4
SELECT Region, AVG([Shipping duration (days)]) AS [Avg. Shipping duration (days)]
FROM Orders
-- WHERE [Product Name] LIKE '%Canon imageCLASS 2200 Advanced Copier%'
GROUP BY Region
ORDER BY 2 DESC

-- 4.5
SELECT State, AVG([Shipping duration (days)]) AS [Avg. Shipping duration (days)]
FROM Orders
-- WHERE [Product Name] LIKE '%Canon imageCLASS 2200 Advanced Copier%'
GROUP BY State
ORDER BY 2 DESC

-- 4.6
SELECT City, AVG([Shipping duration (days)]) AS [Avg. Shipping duration (days)]
FROM Orders
-- WHERE [Product Name] LIKE '%Canon imageCLASS 2200 Advanced Copier%'
GROUP BY City
ORDER BY 2 DESC



----- 5. ----- Profitability per Unit


--- Creating a Profit per Unit Table --- 

DROP TABLE IF EXISTS ProfitPerUnit

CREATE TABLE ProfitPerUnit
(
	[Order ID] NVARCHAR(255),
	Region NVARCHAR(255),
	State NVARCHAR(255),
	City NVARCHAR(255),
	Category NVARCHAR(255),
	[Sub-Category] NVARCHAR(255),
	[Product Name] NVARCHAR(255),
	Client NVARCHAR(255),
	[Ship Mode] NVARCHAR(255),
	[Shipping duration (days)] FLOAT,
	Quantity FLOAT,
	[Number of Sales] FLOAT,
	Sales FLOAT,
	Discount FLOAT,
	Profit FLOAT,
	Cost FLOAT,
	[Profit per Unit] FLOAT
)
INSERT INTO ProfitPerUnit
SELECT ord.[Order ID], ord.Region, ord.State, ord.City, ord.Category, ord.[Sub-Category], ord.[Product Name], ord.Segment, ord.[Ship Mode], ord.[Shipping duration (days)], 
ord.Quantity, COUNT(ord.Sales) as [Number of Sales], ord.Sales, ord.Discount, ord.Profit, SUM(ord.Sales - ord.Profit) as Cost, (SUM(ord.Profit) / SUM(ord.Quantity)) as [Profit per Unit]
FROM [Portfolio - Superstore]..Orders ord
JOIN [Portfolio - Superstore]..Financial fin
ON ord.[Order ID] = fin.[Order ID]
GROUP BY ord.[Order ID], ord.Region, ord.State, ord.City, ord.Category, ord.[Sub-Category], ord.[Product Name], ord.Segment, ord.[Ship Mode], ord.[Shipping duration (days)],
ord.Quantity, ord.Sales, ord.Discount, ord.Profit

-----	-	-	-	-	-	-	-----

-- View Created Table
SELECT *
FROM ProfitPerUnit



-- Main!

SELECT Category, [Sub-Category],[Product Name], Region, State, City, SUM([Profit per Unit]) as [Profit per Unit]
FROM ProfitPerUnit
GROUP BY Category, [Sub-Category],[Product Name], Region, State, City
ORDER BY [Profit per Unit] DESC

-- 5.1
SELECT Category, SUM([Profit per Unit]) as [Profit per Unit]
FROM ProfitPerUnit
GROUP BY Category
ORDER BY [Profit per Unit] DESC

-- 5.2
SELECT [Sub-Category], SUM([Profit per Unit]) as [Profit per Unit]
FROM ProfitPerUnit
GROUP BY [Sub-Category]
ORDER BY [Profit per Unit] DESC

-- 5.3
SELECT [Product Name], SUM([Profit per Unit]) as [Profit per Unit]
FROM ProfitPerUnit
GROUP BY [Product Name]
ORDER BY [Profit per Unit] DESC

-- 5.4
SELECT Region, SUM([Profit per Unit]) as [Profit per Unit]
FROM ProfitPerUnit
GROUP BY Region
ORDER BY [Profit per Unit] DESC

-- 5.5
SELECT State, SUM([Profit per Unit]) as [Profit per Unit]
FROM ProfitPerUnit
GROUP BY State
ORDER BY [Profit per Unit] DESC

-- 5.6
SELECT City, SUM([Profit per Unit]) as [Profit per Unit]
FROM ProfitPerUnit
GROUP BY City
ORDER BY [Profit per Unit] DESC

-- 5.7
SELECT Client, SUM([Profit per Unit]) as [Profit per Unit]
FROM ProfitPerUnit
GROUP BY Client
ORDER BY [Profit per Unit] DESC

-- 5.8

SELECT City , MIN([Profit per Unit]) as [Minimum PPU]
FROM ProfitPerUnit
GROUP BY City
ORDER BY 2 DESC

-- 5.9

SELECT City , MAX([Profit per Unit]) as [Maximum PPU]
FROM ProfitPerUnit
GROUP BY City
ORDER BY 2 DESC


----- 6. -----


-- 6.1

SELECT City, AVG([Shipping duration (days)]) as [Avg. Shipping duration (days)], 
	SUM(Quantity) as Quantity, 
	SUM(Sales) as Sales, 
	SUM(Profit) as Profit, 
	AVG([Profit per Unit]) as [Avg. Profit per unit]
FROM ProfitPerUnit
WHERE City LIKE '%Los Angeles%'
OR City LIKE '%New York City%'
GROUP BY City
ORDER BY Profit DESC




------------------------------------------------------------------------------------------------------------------





