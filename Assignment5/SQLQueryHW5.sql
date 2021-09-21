--------------------------Answer Following Questions-------------------------
/*
1.SQL objects are schemas, journals, catalogs, tables, aliases, views, indexes, constraints, triggers, sequences, stored procedures, 
  user-defined functions, user-defined types, global variables, and SQL packages. SQL creates and maintains these objects as system objects.

2.Indexes are database objects based on table column for faster retrieval of data.
  Advantages :
	1)To quickly find data that satisfy conditions in the WHERE clause.
	2)To find matching rows in the JOIN clause.
	3)To maintain uniqueness of key column during INSERT and UPDATE.
	4)To Sort, Aggregate and Group data.
	
  Disadvantages :
	1)Additional Disk Space.
	2)Insert, Update, Delete Statement become slow.
	3)A clustered Index always cover a query.
	 
3. Clustred, non clustured unique and non unique indexes, column store index, filtered index, and Hash index.

4. When a table is created SQL Server automatically creates custered and unique indexes on primary key column and unique non clustered indexes on unique key constraints.

5. No. One table have only one clustered index. A clustered index sorts and stores the data rows inthe table based on the index key values. 
   Therefore, only one clustered index can be created on each table because the data rows themselves can only be sorted in one order.

6. Yes. Index can be created on multiple columns in a table. 
   It matters. In the order first column will perform better over second and second over third and son on.

7. Yes indexes can be created on views.

8. Database Normalization is a process of organizing data to minimize redundancy (data duplication), which in turn ensures data consistency. 
   There are 3 normal forms to achieve this.
   1)First Normal form :
   Data in each column should be atomic, no multiples values separated by comma.
   The table does not contain any repeating column group
   Identify each record using primary key.
   2)Second normal form:
   The table must meet all the conditions of 1NF
   Move redundant data to separate table
   3)Create relationships between these tables using foreign keys
   Third Normal form:
   Table must meet all the conditions of 1NF and 2NF.
   Does not contain columns that are not fully dependent on primary key.

9. Denormalization is a strategy used on a previously-normalized database to increase performance. The idea behind it is to add redundant 
   data where we think it will help us the most. We can use extra attributes in an existing table, add new tables, or even create instances 
   of existing tables. The usual goal is to decrease the running time of select queries by making data more accessible to the queries or by 
   generating summarized reports in separate tables. This process can bring some new problems, and we’ll discuss them later.

10. Entity integrity ensures each row in a table is a uniquely identifiable entity. We can apply Entity integrity to the Table by specifying a primary key, 
    unique key, and not null. Referential integrity ensures the relationship between the Tables. We can apply this using a Foreign Key constraint.

11. Primary key constraint, froeign key constraint, unique key constraint, check constraint etc

12. Primary key can't have null value but unique key can. There will be only one foreign key per table where as there can be any number of unique keys per table

13. A foreign key (FK) is a column or combination of columns that is used to establish and enforce a link between the data in two tables. You can create a foreign key 
    by defining a FOREIGN KEY constraint when you create or modify a table.

14. Yes, it can.

15. Foreign key does not need to be unique and it can be null too.

16. No.

17. Transaction sql server will keep databse in consitant state. Threre are many trnsaction levels in sql server like, red commited, read uncommitted, 
    repeatble read, serializable and snapshot isolation level transaction.
*/

--------------------------Write queries for following scenarios---------------------------------------------------------------

--#1
create table customer(cust_id int, iname varchar(50))
create table [order](order_id int, cust_id int, amount money, order_date
smalldatetime)
select c.iname, sum(o.amount) total from customer c
join [order] o
on c.cust_id = o.cust_id
where year(order_date)=2002

--#2
create table person(id int, firstanme varchar(100), lastname varchar(100))
select * from person
where lastname like 'A%'

--#3
create table person(person_id int primary key,manager_id int null, name varchar(100)
not null)
select x.name, count(*) from person p
left join
(select * from person p where manager_id is null) x
on p.person_id= x.manager_id
group by x.name

--#4 
/* insert ,update, delete statements can cause trigger to happen */

--#5
create table Company(companyid int primary key, companyname varchar(100) not null)
create table Division(divisionid int primary key, divisionname varchar(100) not null)

create table Contacts(companyid int foreign key, divisionid int foreign key,
locationid varchar(100) foreign key, suitid int foreign key,mail varchar(100),
primary key (companyid, divisionid, locationid,suitid))

create table Physical_location(locationid int primary key, address varchar(100) not null)
create table Contacts_address(suitid int primary key,mail varchar(100))
