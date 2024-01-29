## Walmart Sales Data Analysis
	
Create Database Wallmart;
use Wallmart;

# To see the table is created or not
show tables;

ALTER TABLE `Wallmart`.`walmartsalesdata.csv` 
RENAME TO  `Wallmart`.`Sales ` ;

ALTER TABLE sales
CHANGE COLUMN `Invoice ID` Invoice_ID VARCHAR(30) NOT NULL;
ALTER TABLE sales
CHANGE COLUMN `Product line` Product_line VARCHAR(30) NOT NULL;

# To retrive all the data from the database
select * from sales;

select count(Invoice_ID) from sales;

# Data Cleaning
SELECT
    time,
    (CASE
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        WHEN time BETWEEN '16:01:00' AND '23:59:59' THEN 'Evening'
        ELSE 'Evening'  -- or any other default value
    END) AS time_of_day
FROM sales;

Alter table sales
Add column time_of_day varchar (20);

SET SQL_SAFE_UPDATES = 0;

UPDATE sales
SET time_of_day = (
	CASE
		WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
		WHEN time BETWEEN '16:01:00' AND '23:59:59' THEN 'Evening'
        ELSE "Evening"
    END);
    
    # Add Day name column
    select date, DAYNAME (date) from sales;
    
    Alter table sales
    Add column Day_name char(10) not null;
    
    update sales 
    set Day_name = Dayname(date);
    
    # Add month name column
    Select date, MONTHNAME (date) from sales;
    
    alter table sales
    add column Month_name char(10) not null;
    
    update sales
    set Month_name = Monthname(date);
    
    # Data analysis

-- How many unique cities does the data have?
SELECT 
	DISTINCT city
FROM sales;

-- In which city is each branch?
SELECT 
	DISTINCT city,
    branch
FROM sales;

-- How many unique product lines does the data have?
SELECT
	DISTINCT product_line as productLines
FROM sales;

-- What is the most selling product line	
select sum(Quantity) as qty,
product_line from sales
group by product_line
order by qty desc;

-- What is the total revenue by month
select sum(Total) as Revenue,
Month_name from sales
group by Month_name
order by Revenue desc;

-- What month had the largest COGS?
select sum(cogs) as COGS,
Month_name from sales
group by Month_name
order by cogs desc;

-- What product line had the largest revenue?
select sum(Total) as Revenue,
product_line from sales
group by product_line
order by revenue desc;

-- What is the city with the largest revenue?
select sum(Total) as Revenue,
City from sales
Group by City
order by Revenue desc;

-- What product line had the largest VAT?
select avg(`Tax 5%`)as avg_tax,
product_line
from sales
Group by product_line
Order by avg_tax desc;

 -- Fetch each product line and add a column to those product 
 -- line showing "Good", "Bad". Good if its greater than average sales
select 
	Avg(quantity) as avg_qnty
from sales;

select product_line,
case when Avg(quantity) > 5.5100 Then "Good"
else "Bad"
End as Remark
from sales
group by product_line;

-- Which branch sold more products than average product sold?
select Branch,
avg(quantity)as qty
from sales
Group by Branch
having sum(quantity) > (select Avg(quantity) from sales);

-- What is the most common product line by gender
select Product_line,
gender,
count(Gender) as total_count
from sales
group by Product_line, Gender
order by total_count desc;

-- What is the average rating of each product line
select  product_line,
Round(avg(Rating), 2)as avg_Rating
from sales
Group by product_line
Order by avg_Rating desc;

----------------------- Customers -----------------------

-- How many unique customer types does the data have?
Select Distinct `Customer type` 
as Unique_customer_types from sales;

-- How many unique payment methods does the data have?
select Distinct Payment from sales;

-- What is the most common customer type?
Select `Customer type`, count(`Customer type`) as count
from sales
group by `Customer type`
order by count desc;

-- Which customer type buys the most?
Select `Customer type`, Count(Quantity) as qty
from sales
group by `Customer type`
order by qty desc;

-- What is the gender of most of the customers?
select Gender, count(Gender) as gender_count
from sales
group by Gender
order by gender_count desc;

-- What is the gender distribution per branch?
SELECT
	branch,
	COUNT(*) as count
FROM sales
GROUP BY branch
ORDER BY count DESC;

-- What is the peak time for sales occured?
select time_of_day,
sum(Quantity) as qty_sold
from sales
group by time_of_day
order by qty_sold desc;

-- On which day most of the sales occured
select Day_name,
sum(Quantity) as qty_sold
from sales
group by Day_name
order by qty_sold desc;

-- On which day most of the sales occured
Select Month_name,
sum(Quantity) as qty_sold
from sales
group by Month_name
order by qty_sold desc;


    
    
