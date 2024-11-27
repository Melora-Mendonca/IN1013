-- 1
SELECT first_name, surname
FROM restStaff RS
INNER JOIN restBill RB
ON RS.staff_no = RB.waiter_no
WHERE (RB.cust_name = 'Tanya Singh');

-- 2
SELECT room_date
FROM restRoom_Management RM
INNER JOIN restStaff RS
ON RM.headwaiter = RS.staff_no
WHERE (RS.first_name = 'Charles') AND (RM.room_name = 'Green') AND (RM.room_date LIKE '__02__');

-- 3
SELECT RS.first_name, RS.surname
FROM restStaff RS
INNER JOIN restStaff S2 
ON RS.headwaiter = S2.staff_no
WHERE (S2.first_name = 'Zoe') AND (S2.surname = 'Ball');

-- 4
SELECT RB.cust_name, RB.bill_total, RS.first_name
FROM restBill RB
JOIN restStaff RS 
ON RB.waiter_no = RS.staff_no
ORDER BY RB.bill_total DESC;

-- 5
SELECT DISTINCT RS.first_name, RS.surname
FROM restBill RB
INNER JOIN restStaff RS 
ON RB.waiter_no = RS.staff_no
WHERE RB.table_no IN (
    SELECT table_no
    FROM restBill
    WHERE bill_no IN (00014, 00017)
);

-- 6
SELECT DISTINCT RS.first_name, RS.surname
FROM restRoom_management RM
INNER JOIN restStaff RS ON RM.headwaiter = RS.staff_no
WHERE (RM.room_name = 'Blue') AND (RM.room_date = 160312)
UNION
SELECT DISTINCT RS.first_name, RS.surname
FROM restBill RB
INNER JOIN restStaff RS ON RB.waiter_no = RS.staff_no
WHERE RB.table_no IN (
    SELECT table_no
    FROM restRoom_management
    WHERE (room_name = 'Blue') AND (room_date = 160312)
);