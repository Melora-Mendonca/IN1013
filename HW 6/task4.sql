-- 1
SELECT DISTINCT RB.cust_name
FROM restBill RB
WHERE RB.bill_total > 450.00
 AND RB.waiter_no IN (
    SELECT RS.staff_no
    FROM restStaff RS
    WHERE RS.headwaiter = (
        SELECT staff_no
        FROM restStaff
        WHERE (first_name = 'Charles')
    )
 );

-- 2
SELECT first_name, surname
FROM restStaff
WHERE staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE (room_date = 160111)
      AND room_name IN (
          SELECT RT.room_name
          FROM restRest_table RT
          INNER JOIN restBill RB 
          ON RT.table_no = RB.table_no
          WHERE (RB.cust_name = 'Nerida Smith')
            AND (RB.bill_date = 160111)
      )
);

-- 3
SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4
SELECT first_name, surname 
FROM restStaff 
WHERE staff_no NOT IN (SELECT DISTINCT waiter_no FROM restBill);

-- 5
SELECT RB.cust_name, RS.first_name, RS.surname, RT.room_name
FROM restBill RB
INNER JOIN restRest_table RT 
ON RB.table_no = RT.table_no
INNER JOIN restRoom_management RM 
ON RT.room_name = RM.room_name AND RB.bill_date = RM.room_date
INNER JOIN restStaff RS ON RM.headwaiter = RS.staff_no
WHERE RB.bill_total = (SELECT MAX(bill_total) FROM restBill);
