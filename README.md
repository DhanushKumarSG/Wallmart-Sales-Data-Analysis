**Walmart Sales Data Analysis**

**About:**
This project delves into the Walmart Sales data, sourced from the Kaggle Walmart Sales Forecasting Competition. The objective is to gain insights into the sales data of Walmart, focusing on top-performing branches, product analysis, sales trends, and customer behavior. The dataset comprises sales transactions from three Walmart branches located in Mandalay, Yangon, and Naypyitaw.

**Purposes Of The Project:**
The primary goals of this project include understanding the various factors influencing sales in different branches, improving and optimizing sales strategies, and exploring the impact of selected holiday markdown events on sales.

**About Data:**
The dataset consists of 17 columns and 1000 rows, including information such as invoice_id, branch, city, customer_type, gender, product_line, unit_price, quantity, VAT, total, date, time, payment_method, COGS (Cost Of Goods Sold), gross margin percentage, gross income, and rating.

**Analysis List:**

1. **Product Analysis:**
   Conduct an analysis to comprehend different product lines, identify the best-performing product lines, and pinpoint areas for improvement.

2. **Sales Analysis:**
   Explore sales trends to assess the effectiveness of various sales strategies and propose modifications for increased sales.

3. **Customer Analysis:**
   Uncover different customer segments, analyze purchase trends, and evaluate the profitability of each customer segment.

**Approach Used:**

1. **Data Wrangling:**
   - Inspect data for NULL values and missing data.
   - Replace missing or NULL values.
   - Build a database, create tables, and insert data.
   - Select columns with null values (though, in this case, NULL values were eliminated during table creation).

2. **Feature Engineering:**
   - Generate new columns:
     - Add a column named "time_of_day" to categorize sales into Morning, Afternoon, and Evening.
     - Add a column named "day_name" to extract the day of the week for each transaction.
     - Add a column named "month_name" to extract the month of the year for each transaction.

3. **Exploratory Data Analysis (EDA):**
   - Perform exploratory data analysis to address the project's goals and questions.

By following this approach, the project aims to provide actionable insights into Walmart sales data, aiding in the optimization of sales strategies and enhancing overall business performance.
