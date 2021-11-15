--Partitions
CREATE TABLE Orders
(
    orderid INT,
    orderdate DATE,
    customerName VARCHAR(100),
    City VARCHAR(50),   
    amount MONEY
)
INSERT INTO Orders
SELECT 1,'01/01/2021','Suchindra Chitnis','Mumbai',10000
UNION ALL     
SELECT 2,'02/04/2021','Rahul Gowda','Gadag',20000
UNION ALL     
SELECT 3,'03/02/2021','Vinod Ravi','Bangalore',5000
UNION ALL     
SELECT 4,'04/02/2021','Akash Suchak','Rajkot',15000
UNION ALL     
SELECT 5,'05/03/2021','Adarsh Pandith','Hyderabad',7000
UNION ALL     
SELECT 6,'06/04/2021','Sreerag Nair','Kochi',25000
UNION ALL   
SELECT 7,'07/03/2021','Adarsh GP','Bangalore',7000
  



-- total orders value by location (City). For this purpose, we use the SUM() and GROUP BY function 
SELECT City AS CustomerCity
,sum(amount) AS totalamount FROM Orders
GROUP BY city
ORDER BY city

SELECT City AS CustomerCity, CustomerName,amount,
SUM(amount) OVER(PARTITION BY city) TotalOrderAmount
FROM Orders

--AVG(), MIN(), MAX() to calculate the average, minimum and maximum amount from the rows
SELECT City AS CustomerCity, CustomerName,amount,
SUM(amount) OVER(PARTITION BY city) TotalOrderAmount,
Avg(amount) OVER(PARTITION BY city) AvgOrderAmount,
Min(amount) OVER(PARTITION BY city) MinOrderAmount,
MAX(amount) OVER(PARTITION BY city) MaxOrderAmount
FROM Orders

--The ROW_NUMBER() function uses the OVER and PARTITION BY clause and sorts results in ascending or descending order.
-- It starts ranking rows from 1 per the sorting order.
SELECT City AS CustomerCity, CustomerName,amount,
ROW_NUMBER() OVER(PARTITION BY city ORDER BY amount DESC) AS [Row Number]
FROM Orders