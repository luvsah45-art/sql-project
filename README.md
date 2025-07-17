**📌 Project Overview**
This project is a SQL-based implementation of an Online Bookstore Database System. It is designed to manage book inventories, customers, orders, and payments efficiently. The database structure supports core e-commerce operations and can be extended for larger-scale applications.

**🗂️ Features**
**✅ Book Management** – Store and update book details (title, author, price, stock).

**✅ Customer Management** – Track customer information and order history.

**✅ Order Processing** – Record orders, track order status, and manage billing.

**✅ Payment Tracking** – Maintain payment details for completed purchases.

**✅ Relational Integrity** – Proper use of primary keys, foreign keys, and constraints.

**🏗️ Database Schema**

**The database consists of the following key tables:**

**Books** – Stores book details (title, author, genre, price, stock).

**Customers** – Contains customer information.

**Orders** – Tracks customer orders.

**Order_Detail**s – Links books with specific orders.

**Payments** – Records payment transactions.


**🛠️ Technologies Used**
Database: MySQL 

SQL Concepts: DDL, DML, Joins, Aggregations, and Constraints

**📊 Sample Queries**

**Here are some example queries you can try:**

**-- Find the details of the most expensive book**

select *
from books
order by price desc limit 1;

**List customers who have placed at least 2 orders**

select cus.name,ord.customer_id, count(order_id) 
from orders as ord
join customers as cus
on cus.Customer_ID=ord.Customer_ID
group by cus.name,ord.customer_id
having  count(order_id) >=2 ;


**Feel free to fork this repository, open issues, or push pull requests to make database design better or add more queries.**

**🧑‍💻 Author**
Love kumar sah
📧 luvsah45@gmail.com
🔗 https://github.com/luvsah45-art
