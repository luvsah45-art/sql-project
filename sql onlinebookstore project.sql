select * 
from books;

select * 
from customers;


select * 
from orders;


--  Retrieve all books in the "Fiction" genre
select *
from books
where genre like 'Fiction';


--  Find books published after the year 1950
select *
from books
where Published_Year >1950 
order by Published_Year asc;


-- List all customers from the Canada

select * from customers
where country ='canada';


-- Show orders placed in November 2023

select *
from orders
where order_date between '2023-11-01' and '2023-11-31'
order by Order_Date asc;


-- Retrieve the total stock of books available

select sum(stock) as total_stock
from books;




-- Find the details of the most expensive book
select *
from books
order by price desc limit 1;



-- Show all customers who ordered more than 1 quantity of a book

select *
from orders
where quantity >1;


-- Retrieve all orders where the total amount exceeds $20

select *
from orders
where Total_Amount > 20
order by total_amount asc;


-- List all genres available in the Books table
select distinct genre
from books;


-- Find the book with the lowest stock

select *
from books
order by stock limit 1;


-- Calculate the total revenue generated from all orders

select sum(total_amount) as total_revenue

from orders;


-- 1) Retrieve the total number of books sold for each genre
select  bo.genre, sum(ord.quantity)as total_sold
from books as bo
join orders as ord
on bo.Book_ID = ord.Book_ID
group by  bo.genre
	;

-- 2) Find the average price of books in the "Fantasy" genre

select distinct Genre, avg(price)
from books
where genre ='fantasy'
group by genre;

-- 3) List customers who have placed at least 2 orders

select cus.name,ord.customer_id, count(order_id) 
from orders as ord
join customers as cus
on cus.Customer_ID=ord.Customer_ID
group by cus.name,ord.customer_id
having  count(order_id) >=2 ;



-- 4) Find the most frequently ordered book

select bo.title, ord.book_id,count(order_id) 
from orders as ord
join books as bo
on ord.book_id=bo.book_id
group by bo.title, ord.book_id
order by count(order_id) desc
limit 1;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre 
select *
from books 
where genre = 'fantasy'
order by price desc
limit 3;




-- 6) Retrieve the total quantity of books sold by each author
select b.author ,sum(o.Quantity) as total_quantity
from books as b
join orders as o
on 
	b.book_id=o.Book_ID
    group by b.author;



-- 7) List the cities where customers who spent over $30 are located
select distinct c.city,o.Total_Amount
from orders as o
join customers as c
on o.Customer_ID=c.Customer_ID
where total_amount > 30
order by Total_Amount asc;

-- 8) Find the customer who spent the most on orders

select c.name,sum(o.Total_Amount) as total_spent
from  orders as o
join customers as c
on
	c.customer_id= o.customer_id
group by c.name
order by total_spent desc 
limit 1;

-- 9) Calculate the stock remaining after fulfilling all orders
select b.book_id,b.title,b.stock, coalesce(sum(o.quantity),0) as total_order , b.stock-coalesce(sum(o.quantity),0) as remining_stock
from books b
left join orders o
on
	b.book_id = o.Book_ID
    group by b.book_id,b.title,b.stock;

