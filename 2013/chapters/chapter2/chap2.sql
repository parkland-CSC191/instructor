set echo on

@/u01/app/oracle/csc191/JLDB_files/JLDB_Build.sql
select table_name from user_tables;
desc books
select * from customers;
select title, pubdate from books;
select title "Title of book", category from books;
select title, retail-cost profit from books;
select title, retail, discount, retail-discount from books;
select distinct state from customers;
select firstname||lastname from customers;
select firstname||' '||lastname "Customer name" from customers;

set echo off
