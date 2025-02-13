# Overview
This project builds an eCommerce database using MySQL with data imported from CSV files. 
It includes tables for sellers, customers, orders, order items, and products to manage and analyze eCommerce transactions.

# Tables and Relationships
Customers.csv (customer_id as Primary Key)
Sellers.csv (seller_id as Primary Key)
Products.csv (product_id as Primary Key)
Orders.csv (order_id as Primary Key, Foreign Key: customer_id)
Order_Items.csv ( Foreign Keys: order_id, product_id, seller_id)

1. Subqueries
A subquery is a query nested inside another query. It is used to perform intermediate calculations that are later used by the main query.

2. LAG()
Returns the value from a previous row within the same result set. It is commonly used to compare values between consecutive rows.

3. CTE
A CTE (Common Table Expression) is a temporary result set defined within the execution scope of a single SELECT, INSERT, UPDATE, or DELETE statement.
CTEs improve query readability and can be referenced multiple times within the query.

4. DENSE_RANK()
Dense_Rank is a window function used to rank rows in a result set with no gaps between rank values.
It assigns ranks to rows based on a specified ordering but gives the same rank to tied values and the next rank continues sequentially.
