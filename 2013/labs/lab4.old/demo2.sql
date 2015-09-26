-- find the average length of author's first and last names for all books sold per region.
-- Sort by compass value (of region)

SELECT DECODE(region,'N ','North','NE','Northeast','SE','Southeast','SW','Southwest','NW','Northwest','') region,
  avg_author_name_length,
  DECODE(region,'N ',1,'NE',2,'SE',4,'SW',6,'NW',8,0) compass_value
FROM
  (SELECT region,
    AVG(LENGTH(fname||lname)) avg_author_name_length
  FROM customers NATURAL
  JOIN orders NATURAL
  JOIN orderitems NATURAL
  JOIN bookauthor NATURAL
  JOIN author
  GROUP BY region
  )
order by 3
/

