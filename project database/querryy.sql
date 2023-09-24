-- names and salary of employee whose salary greater than 3000 and smallest than 5000
SELECT fname
FROM employee 
WHERE salary between 3000 and 5000 ;

-- name and phone customer in all hotels
SELECT fname,phone
FROM  customer;

-- sum of salary employee in all hotels
SELECT SUM(salary)
FROM employee;

-- number of rooms in all hotels
SELECT count(number) AS 'number of rooms'
FROM room;

-- location of all hotel
SELECT location
FROM `hotel locations`;

-- name of customer chick in in room 480
SELECT c.fname,c.phone
FROM customer c , room r , `chick in and out` k
WHERE c.id=k.customer_id and k.room_number=r.number and r.number=480;


-- name of all manger in hotels
SELECT fname
FROM employee , manager
WHERE manager_id = e_id ;



-- the fast typing of secratery orderd by descending
SELECT `typing speed`
FROM secretary
ORDER BY `typing speed` DESC;


-- name employee who serves room
SELECT e.fname ,number
FROM employee e , serves s , serves_organize_room o, room r
WHERE  e.e_id=s.Emplyee_id and s.Emplyee_id=o.serves_Emplyee_id and o.room_number=number ;


-- name of hotel that number of room = 500 
SELECT h.name 
from room r
join hotel h ON h.id = r.hotel_id AND r.number =500 ;

--  name employee and name of hotel who works on
SELECT  e.fname , h.name
FROM employee e , hotel h
WHERE h.id=e.hotel_id;

-- date and price reservation  in helton hotel
SELECT  price , date
FROM  `today price` , reservation r , hotel h,customer c, payyment p
WHERE  h.name='helton'  and h.id=p.hotel_id and p.customer_id=c.id and  c.id=r.customer_id and r.`today price_avilable room`=`avilable room`  ;





-- (nested) name of employee  whose salary greater than shrouk mohamed
SELECT fname , salary
 from employee
 WHERE salary>(select salary from employee where fname='shrouk' and lname='mohamed');


-- (nested) name and salary of employee who takes smallest salary
SELECT e.fname, e.salary
FROM  employee e
WHERE  e.salary=(select min(e.salary) from employee e) ;


-- (nested)max  salary for employee 

SELECT e.fname, e.salary
FROM  employee e
WHERE  e.salary=(select max(e.salary) from employee e) ;


-- the average salary of the manager greater than 5000
SELECT avg(salary)
FROM  employee e , manager m
where e_id=manager_id
group by salary
having avg(e.salary)>5000;


-- the name of hotel which give thier manager sum of salary greater than 6000
SELECT   h.name , sum(e.salary)
FROM hotel h  , employee e , manager m 
WHERE e.e_id=m.manager_id and m.hotel_id=h.id
group by h.name 
having sum(e.salary)>6000;

-- the name of hotel contains 'h'
SELECT name 
from hotel
where name like '%h%';


-- the salary distinct from employee
select distinct salary
from employee
where salary>4800;

-- name of employee and name of hotel who work
select h.name ,e.fname
from employee e left outer join hotel h on hotel_id=id ;







