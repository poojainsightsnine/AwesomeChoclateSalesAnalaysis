# AwesomeChocolateSalesAnalaysis
This project analyzes the sales performance of Awesome Chocolates, focusing on key metrics such as total sales, shipment count, box volume, and performance by salesperson, product, and region.
Using SQL for data exploration and Power BI for visualization, the project highlights trends, top-performing products, and shipment behaviors across different time periods — helping uncover what drives sales success and where opportunities lie.

**Data Sources**
Both the SQL analysis and Power BI dashboard are based on the same dataset, provided as CSV files.  

The data was imported into SQL for query analysis and used directly in Power BI for visualization.
      1.Geo---GeoID,Geo,Region
      2.People---Salesperson,SPID,Team,Location
      3.Products---PID,Product, Category, Size,Cost_per_box
      4.Sales--SPID, GeoID,PID ,SaleDate,Amount ,Customers,Boxes
**Part 1 — SQL Analysis**   

**------Key Questions Explored-----**
What It Reveals	SQL Concepts Used
  Which salespeople had at least one shipment?	
  SQL-Concept-Used---IN, EXISTS, JOIN  
  
How many shipments did each salesperson make on Mondays?	
  Weekly shipment frequency	
  SQL-Concept-Used---GROUP BY, WEEKDAY()  
  
Which product sold more —Milk Bars or Eclairs?	
  Product performance comparison	
  SQL-Concept-Used---JOIN, GROUP BY, SUM()
Which product sold the most boxes in early February 2022?	
  Early-month product trend	
  SQL-Concept-Used---BETWEEN, SUM()
Who didn’t make any shipments in the first week of January?	
  Detects inactive salespeople	
  SQL-Concept-Used---LEFT JOIN, NOT IN
Were there any shipments under 1000 customers and 1000 boxes?	
  Identifies smaller shipments	
  SQL-Concept-Used---HAVING
How often did we ship more than 1000 boxes per month?
 Shipment volume trend
 SQL-Concepet-used YEAR(), MONTH(), COUNT()

**Part 2 — Power BI Dashboard (AwesomeDashboard.pbix)**
The Power BI dashboard provides a clear, data-driven view of Awesome Chocolates’ sales operations.
It highlights how products, sales teams, and regions contribute to overall revenue, helping leaders make informed decisions based on real performance patterns.
Key Insights
1. Overall Sales Performance
      -$43.6M Total Sales, 3M Boxes, and 8K Shipments recorded.
      - Sales trend remained strong through 2021, peaking early 2022 — showing a seasonal demand pattern.
      - LBS % (Lower Box Shipments) stands at 9.6%, meaning around one in ten shipments contained fewer boxes — a useful measure of shipment size efficiency.
2. Regional Insights
       - New Zealand, Canada, and India lead total sales, showing strong international presence.
       - Australia, UK, and USA show room for growth, suggesting potential marketing or distribution focus.
3. Salesperson Performance
       - Wilone O’Kiett, Van Tuxwell, and Roddy Speechley top the leaderboard with over $18M each.
       - The average salesperson handles about 120K boxes, showing balanced workload distribution.
4. Team Contribution
       - Delish team leads with 31.8% of total sales, followed by Juicies (28.8%) and Yummies (23.6%).
       - Replicating Delish’s strategies could improve other teams’ sales performance.
5. Product Category Insights
       - Bars are the top-selling category, while Bites and Others maintain steady, loyal sales segments.
