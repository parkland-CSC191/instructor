-- create logins for all customers
--  login: first initial + last name
--  password: first three _letters_ of the address + zip code backwards
--            If they have placed an order, use shipstreet. Otherwise use address. Only one shipstreet per customer

select substr(firstname, 1, 1)||lastname login,
       max(nvl2(orders.shipstreet,
           regexp_substr(shipstreet, '[a-zA-Z]', 1, 1)||regexp_substr(shipstreet, '[a-zA-Z]', 1, 2)||regexp_substr(shipstreet, '[a-zA-Z]', 1, 3)||
            substr(shipzip, 5, 1)||
            substr(shipzip, 4, 1)||
            substr(shipzip, 3, 1)||
            substr(shipzip, 2, 1)||
            substr(shipzip, 1, 1),
           regexp_substr(address, '[a-zA-Z]', 1, 1)||regexp_substr(address, '[a-zA-Z]', 1, 2)||regexp_substr(address, '[a-zA-Z]', 1, 3)||
            substr(zip, 5, 1)||
            substr(zip, 4, 1)||
            substr(zip, 3, 1)||
            substr(zip, 2, 1)||
            substr(zip, 1, 1))) password
from customers
left outer join orders on customers.customer# = orders.customer#
group by substr(firstname, 1, 1)||lastname
order by 1;
