create role cust_serv_rep_role;
grant select on scott.CUSTOMERS to cust_serv_rep_role;
grant select on scott.ORDERS to cust_serv_rep_role;
grant select on scott.PUBLISHER to cust_serv_rep_role;
grant select on scott.AUTHOR to cust_serv_rep_role;
grant select on scott.BOOKS to cust_serv_rep_role;
grant select on scott.ORDERITEMS to cust_serv_rep_role;
grant select on scott.BOOKAUTHOR to cust_serv_rep_role;
grant select on scott.PROMOTION to cust_serv_rep_role;
grant select on scott.ACCTMANAGER to cust_serv_rep_role;
grant select on scott.ACCTMANAGER2 to cust_serv_rep_role;
grant select on scott.STORE_REPS to cust_serv_rep_role;
grant select on scott.BOOK_STORES to cust_serv_rep_role;
grant select on scott.ACCTBONUS to cust_serv_rep_role;

grant insert,update,delete on scott.CUSTOMERS to cust_serv_rep_role;
grant delete on scott.ORDERS to cust_serv_rep_role;
grant delete on scott.ORDERITEMS to cust_serv_rep_role;

grant cust_serv_rep_role to cust_serv_rep identified by sr;
