create role data_entry_role;
grant select on scott.CUSTOMERS to data_entry_role;
grant select on scott.ORDERS to data_entry_role;
grant select on scott.PUBLISHER to data_entry_role;
grant select on scott.AUTHOR to data_entry_role;
grant select on scott.BOOKS to data_entry_role;
grant select on scott.ORDERITEMS to data_entry_role;
grant select on scott.BOOKAUTHOR to data_entry_role;
grant select on scott.PROMOTION to data_entry_role;
grant select on scott.ACCTMANAGER to data_entry_role;
grant select on scott.ACCTMANAGER2 to data_entry_role;
grant select on scott.STORE_REPS to data_entry_role;
grant select on scott.BOOK_STORES to data_entry_role;
grant select on scott.ACCTBONUS to data_entry_role;

grant insert on scott.BOOKS to data_entry_role;
grant insert on scott.PUBLISHER to data_entry_role;
grant insert on scott.BOOKAUTHOR to data_entry_role;
grant insert on scott.AUTHOR to data_entry_role;

grant data_entry_role to data_entry identified by de;
