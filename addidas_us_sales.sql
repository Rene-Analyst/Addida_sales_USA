
-- calculate top performing retailer

SELECT 
Retailer,
SUM(Total_Sales) AS Topperforming_retailer
FROM adidas_us_sales
GROUP BY Retailer
ORDER BY Topperforming_retailer DESC

-- Calculate total sales per state

SELECT 
State,
SUM(Total_Sales) AS Totalsales_state
FROM adidas_us_sales
GROUP BY State
ORDER BY Totalsales_state DESC

-- calculate sales by sales method

SELECT
Sales_Method,
SUM(Total_Sales) AS Totalsales_method
FROM adidas_us_sales
GROUP BY Sales_Method
ORDER BY Totalsales_method DESC

-- average cost of addidas products per city 

SELECT 
Product,
City,
AVG(Price_per_Unit) AS Averageunitcost_city
FROM adidas_us_sales
GROUP BY Product, City

-- caculate top selling product

SELECT
Product,
SUM(Total_Sales) AS Topselling_product
FROM adidas_us_sales
GROUP BY Product
ORDER BY Topselling_product DESC

-- calculate top selling product per state

SELECT
State,
Product,
SUM(Total_Sales) AS Topselling_product
FROM adidas_us_sales
GROUP BY Product,State
ORDER BY Topselling_product DESC

-- comparison between Men and Women footwear in 10 states

SELECT 
  State,
  Product,
  SUM(Total_Sales) AS Men_Womenfootwear
FROM adidas_us_sales
WHERE Product IN ('Men''s Street Footwear', 'Women''s Street Footwear')
GROUP BY State, Product
ORDER BY Men_Womenfootwear DESC
LIMIT 10

-- Monthly sales trend

SELECT
Invoice_Date,
SUM(Total_Sales) AS Monthly_sales
FROM adidas_us_sales
GROUP BY Invoice_Date
ORDER BY Monthly_sales DESC

-- Average sales per month

SELECT 
Invoice_Date,
AVG(Total_Sales) AS Averagesales_month
FROM adidas_us_sales
GROUP BY Invoice_Date
ORDER BY 1 

-- Maximum units sold online vs instore by footloocker and walmart

SELECT
Sales_Method,
Retailer,
MAX(Units_Sold) AS MaxnumberU_sold_online_instore
FROM adidas_us_sales
WHERE Retailer IN ('Foot Locker','Walmart')
AND Sales_Method IN ('Online','In-store')
GROUP BY Retailer,Sales_Method

--which sale method is does walmart clients use more?

SELECT
Sales_Method,
Retailer,
SUM(Units_Sold) As Sum_unitsold_method
FROM adidas_us_sales
WHERE Retailer = 'Walmart'
GROUP BY Retailer,Sales_Method
ORDER BY Sum_unitsold_method DESC



-- maximum number of units sold by walmart in 2021 by month
-- shows the maximum number sold in each month

SELECT 
    Invoice_Date,
    Retailer,
    MAX(Units_Sold) AS MaxUnits_Sold
FROM adidas_us_sales
WHERE Retailer = 'Walmart'
AND Invoice_Date = 2021
GROUP BY Invoice_Date
ORDER BY MaxUnits_Sold DESC

-- sales share per retailer in each region

SELECT
    Region,
    Retailer,
    SUM(Total_Sales) AS Total_Region_Sales,
    SUM(Total_Sales) / SUM(SUM(Total_Sales)) OVER (PARTITION BY Region) * 100 AS Sales_Share_Percent
FROM
    adidas_us_sales
GROUP BY
    Region, Retailer;
    
--average sales per states

SELECT State, AVG(Total_Sales) AS Avg_Sales
FROM adidas_us_sales
GROUP BY State;
ORDER BY Avg_Sales DESC

-- create views for later visualization in Tableua 

CREATE VIEW Top_performingretailer
AS
SELECT 
Retailer,
SUM(Total_Sales) AS Topperforming_retailer
FROM adidas_us_sales
GROUP BY Retailer
ORDER BY Topperforming_retailer DESC

CREATE VIEW Salesper_state
AS
SELECT 
State,
SUM(Total_Sales) AS Totalsales_state
FROM adidas_us_sales
GROUP BY State
ORDER BY Totalsales_state DESC

CREATE VIEW Salesby_method
AS 
SELECT
Sales_Method,
SUM(Total_Sales) AS Totalsales_method
FROM adidas_us_sales
GROUP BY Sales_Method
ORDER BY Totalsales_method DESC

CREATE VIEW Monthlysales_trend
AS
SELECT
Invoice_Date,
SUM(Total_Sales) AS Monthly_sales
FROM adidas_us_sales
GROUP BY Invoice_Date
ORDER BY 1 





















