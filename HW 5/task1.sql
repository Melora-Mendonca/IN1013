-- 1
SELECT bill_date, bill_total
FROM restbill
WHERE cust_name = "Bob Crow";

-- 2
SELECT DISTINCT cust_name
FROM restbill
WHERE cust_name LIKE "%Smith" ORDER BY cust_name DESC;

-- 3
SELECT DISTINCT cust_name
FROM restbill
WHERE cust_name LIKE "% C%";

-- 4
SELECT first_name
FROM reststaff
WHERE headwaiter IS NULL;

-- 5
SELECT *
FROM restbill
WHERE bill_date LIKE "1602__";

-- 6
SELECT DISTINCT bill_date
FROM restbill
WHERE bill_total IS NOT NULL AND bill_date LIKE "15____" ORDER BY bill_date ASC;
