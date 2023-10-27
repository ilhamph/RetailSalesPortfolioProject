--  Influence of customer age and gender on purchasing behavior
select DISTINCT Gender, Age, count(Transaction_ID) as Total_Transaction, 
sum(Quantity) AS Total_Quantity, 
sum(Total_Amount) AS Total_Sales 
from sp.retail_sales_dataset
group by Gender, Age;

-- Electronic product sales patterns in different time periods
select month(Date) AS Month, SUM(Total_Amount) Total_Sales 
from sp.retail_sales_dataset
WHERE Product_Category = 'Electronics'
GROUP BY month(Date)
ORDER BY month(Date);

-- Beauty product sales patterns in different time periods
select month(Date) AS Month, SUM(Total_Amount) Total_Sales 
from sp.retail_sales_dataset
WHERE Product_Category = 'Beauty'
GROUP BY month(Date)
ORDER BY month(Date);

-- Clothing product sales patterns in different time periods
select month(Date) AS Month, SUM(Total_Amount) Total_Sales 
from sp.retail_sales_dataset
WHERE Product_Category = 'Clothing'
GROUP BY month(Date)
ORDER BY month(Date);

-- Product categories hold the highest appeal among customers
select Count(Customer_ID) AS Customer_count, Product_Category, 
SUM(Total_Amount) AS Total_Sales
from sp.retail_sales_dataset
group by Product_Category
order by Total_Sales DESC;

-- Relationships between age, spending, and product preferences
select DISTINCT SUM(Total_Amount) as Total_Sales,
Product_Category, ROUND(AVG(Age),0) Age, COUNT(Transaction_ID) Total_transactions
from sp.retail_sales_dataset
group by Product_Category
order by Total_Sales DESC;

-- Customers shopping habits during seasonal trends
select month(Date) as transaction_month, Product_Category, 
Sum(Total_Amount) as total_sales, COUNT(Transaction_ID) Total_Transaction
from sp.retail_sales_dataset
group by transaction_month, Product_Category
order by transaction_month;

-- Purchasing behaviors based on the number of items bought per transaction
select Product_Category, Quantity, COUNT(Transaction_ID) Total_transactions,
ROUND(AVG(Total_Amount),2) Total_Sales
from sp.retail_sales_dataset
group by Product_Category, Quantity

-- Distribution of product prices within each category
SELECT Product_Category, 
MIN(Price_per_Unit) AS Min_Price, 
MAX(Price_per_Unit) AS Max_Price, 
ROUND(AVG(Price_per_Unit),2) AS Average_Price
FROM sp.retail_sales_dataset
GROUP BY Product_Category;





