-- 1
CREATE VIEW samBills
AS SELECT RS.first_name, RS.surname, RB.bill_date, RB.cust_name, RB.bill_total
FROM restbill RB
INNER JOIN reststaff RS on RB.waiter_no = RS.staff_no
WHERE RS.first_name = "Sam" AND RS.surname = "Pitt";

SELECT * FROM samBills;

-- 2
SELECT *
FROM samBills
WHERE bill_total > 400;

-- 3
CREATE VIEW roomTotals
AS SELECT RT.room_name, SUM(RB.bill_total) AS total_sum
FROM restRest_table RT
INNER JOIN restbill RB ON RT.table_no = RB.table_no
GROUP BY RT.room_name;

SELECT * FROM roomTotals;

-- 4
 CREATE OR REPLACE VIEW teamTotals
 AS SELECT CONCAT(RS.first_name, ' ', RS.surname) AS headwaiter_name, SUM(RB.bill_total) AS total_sum
 FROM restStaff RS
 INNER JOIN restStaff S2 ON RS.staff_no = S2.headwaiter
 INNER JOIN restbill RB ON S2.staff_no = RB.waiter_no
 GROUP BY RS.staff_no, RS.first_name, RS.surname;

SELECT * FROM teamTotals;