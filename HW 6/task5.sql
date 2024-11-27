-- 1
SELECT RS.first_name, RS.surname, RB.bill_date, COUNT(RB.bill_no) as num_of_bills
FROM restBill RB
INNER JOIN restStaff RS
ON RB.waiter_no = RS.staff_no
GROUP BY RS.first_name, RS.surname, RB.bill_date
HAVING COUNT(RB.bill_no) >= 2;

-- 2
SELECT RM.room_name, COUNT(RT.table_no) AS num_of_tables
FROM restRest_table RT
INNER JOIN restRoom_Management RM
ON RT.room_name = RM.room_name
GROUP BY RM.room_name
HAVING COUNT(RT.table_no) > 6;

-- 3
SELECT RM.room_name, SUM(RB.bill_total) as total_bill_amount
FROM restRoom_Management RM
INNER JOIN restBill RB
ON RM.room_name = (
    SELECT RT.room_name 
    FROM restRest_table RT 
    WHERE RT.table_no = RB.table_no
    )
GROUP BY RM.room_name;

-- 4
SELECT RS.first_name, RS.surname, SUM(RB.bill_total) as total_amount
FROM restStaff RS
INNER JOIN restStaff S2 
ON RS.staff_no = S2.headwaiter
INNER JOIN restBill RB
ON S2.staff_no = RB.waiter_no
GROUP BY RS.first_name, RS.surname
ORDER BY total_amount DESC;

-- 5
SELECT RB.cust_name
FROM restBill RB
GROUP BY RB.cust_name
HAVING AVG(b.bill_total) > 400;

-- 6
SELECT RS.first_name, RS.surname, COUNT(RB.bill_no) AS num_of_bills
FROM restBill RB
JOIN restStaff RS ON RB.waiter_no = RS.staff_no
GROUP BY RS.first_name, RS.surname, RB.bill_date
HAVING COUNT(RB.bill_no) >= 3;