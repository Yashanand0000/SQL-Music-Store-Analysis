SQL Music Store Analysis  

📌 Project Description  
This project involves analyzing a (Music Store database) using PostgreSQL.  
It focuses on querying and extracting meaningful insights about customers, sales, invoices, tracks, genres, and artists.  

The queries are designed to simulate real-world business questions—helping store managers and analysts make data-driven decisions.  


🎯 Objectives  
- Understand the structure of a relational database (Chinook-like dataset).  
- Write complex SQL queries to extract insights.  
- Use JOINs, CTEs, aggregations, and window functions for analysis.  
- Generate reports on customer behavior, sales trends, and genre popularity.  


🗂️ Files in the Project  
- `SQL P1.sql`– Contains all SQL queries for analysis.  
- Database – (Chinook-like dataset with tables: `customer`, `invoice`, `track`, `genre`, `artist`, etc.)  


🔍 Key Analysis Performed  
1. Customer Analysis – Identifying top customers by purchases & location.  
2. Genre Insights – Finding most popular music genres by country.  
3. Sales Trends – Analyzing sales distribution across countries.  
4. Track Insights – Working with average track lengths and pricing.  
5. Invoice-Level Insights – Studying purchase behavior per customer.  


🛠️ SQL Features Used  
- JOINS (INNER, LEFT) – Combining multiple tables for detailed analysis.  
- CTEs (WITH clauses) – For reusable and cleaner queries.  
- Aggregate Functions – `SUM()`, `AVG()`, `COUNT()`.  
- Window Function – `ROW_NUMBER()` for ranking data.  
- Filtering – Using `WHERE`, `IN`, `BETWEEN` for targeted queries.  


🚀 How to Run  
1. Install PostgreSQL (or use any SQL-compatible platform).  
2. Import the music store data.zip 
3. Open the `SQL P1.sql` file.  
4. Run queries step by step to see the analysis outputs.  


📊 Possible Improvements  
- Visualize the results using Power BI/Tableau.  
- Automate reporting with stored procedures.  
- Expand analysis to include playlist & artist trends.  
