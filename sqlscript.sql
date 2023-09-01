REM   Script: Railway Management System
REM   DBMS Project

create table USERS 
( 
    user_id int primary key, 
    first_name varchar(50), 
    last_name varchar(50), 
    adhar_no varchar(20), 
    gender varchar(2), 
    age int, 
    mobile_no number(10), 
    email varchar(50), 
    city varchar(50), 
    rstate varchar(50), 
    pincode number(6), 
    password varchar(50), 
    security_ques varchar(50), 
    security_ans varchar(50) 
);

insert into USERS values(1701, 'vijay', 'sharma', '309887340843','M',34,9887786655, 'vijay1@gmail.com','vijaywada', 'andhrapradesh', '520001','12345@#','favouritecolour','red');

insert into USERS values(1702,'rohit','kumar','456709871234','M',45,9809666555, 'rohithkumar@gmail.com','guntur','andhrapradesh','22004','12@#345','favouritebike','bmw');

create table TRAIN 
( 
    train_no int primary key, 
    train_name varchar(50), 
    arrival_time varchar(50), 
    departure_time varchar(50), 
    availability_of_seats varchar(50), 
    rdate date 
);

create table STATION 
( 
    station_no int primary key, 
    name varchar(50), 
    hault int, 
    arrival_time varchar(20), 
    train_no int, 
    foreign key(train_no) references TRAIN(train_no) 
);

create table TRAIN_STATUS 
( 
    train_no int primary key, 
    a_seats1 int, 
    a_seats2 int, 
    b_seats1 int, 
    b_seats2 int, 
    w_seats1 int, 
    w_seats2 int, 
    fare1 float, 
    fare2 float 
);

create table TICKET 
( 
    id int primary key, 
    user_id int, 
    status varchar(20), 
    no_of_passengers int, 
    train_no int, 
    foreign key(user_id) references USERS(user_id), 
    foreign key(train_no) references TRAIN(train_no) 
);

create table PASSENGER 
( 
    passenger_id int primary key, 
    pnr_no int, 
    age int, 
    gender varchar(2), 
    user_id int, 
    reservation_status varchar(20), 
    seat_number varchar(5), 
    pname varchar(50), 
    ticket_id int, 
    foreign key(user_id) references USERS(user_id), 
    foreign key(ticket_id) references TICKET(id) 
);

create table STARTS 
( 
    train_no int, 
    station_no int, 
    foreign key(train_no) references TRAIN(train_no), 
    foreign key(station_no) references STATION(station_no) 
);

create table STOPS_AT 
( 
    train_no int, 
    station_no int, 
    foreign key(train_no) references TRAIN(train_no), 
    foreign key(station_no) references STATION(station_no) 
);

create table BOOKS 
( 
    user_id int, 
    ticket_id int, 
    foreign key(user_id) references USERS(user_id), 
    foreign key(ticket_id) references TICKET(id) 
);

create table CANCEL 
( 
    user_id int, 
    ticket_id int, 
    passenger_id int, 
    foreign key(user_id) references USERS(user_id), 
    foreign key(ticket_id) references TICKET(id), 
    foreign key(passenger_id) references PASSENGER(passenger_id) 
);

create table REACHES 
( 
    train_no int, 
    station_no int, 
    time varchar(20), 
    foreign key(train_no) references TRAIN(train_no), 
    foreign key(station_no) references STATION(station_no) 
);

insert into USERS values(1703, 'manasvi', 'sree','765843210987','F',20,9995550666,'manasvi57@gmail.com','guntur','andhrapradesh','52200','40987hr', 'favouriteflower', 'rose');

insert into USERS values(1704, 'vinay', 'gupta', '309887340845','M',34,9887786657, 'vinay1@gmail.com','patiala', 'punjab', '520001','12345@#','favouritecolour','red');

insert into USERS values(1708, 'shalini', 'sharma', '305647894086','F',44,7896376655, 'shalini1@gmail.com','delhi', 'delhi', '520781','45675@#','favouriteflower','lily');

insert into USERS values(1706, 'vaishali', 'gupta', '706867440843','F',24,9887786655, 'vaishali1@gmail.com','delhi', 'delhi', '524501','47345@#','favouritecolour','blue');

insert into USERS values(1700, 'vaibhav', 'gupta', '806867440843','M',24,9887657899, 'vaibhav1@gmail.com','patiala', 'punjab', '524502','47745@#','favouritecolour','black');

insert into TRAIN values(12711,'pinakini_exp','11:30:00','11:40:00','A','6-june-2023');

insert into TRAIN values(14887,'RKSH BME EXP','01:40:00','01:45:00','NA','7-june-2023');

insert into TRAIN values(14736,'UMB-BTI SPL','14:07:00','14:12:00','2A','10-june-2023');

insert into TRAIN values(18238,'ASR BSP EXP','08:15:00','08:20:00','CC','24-may-2023');

insert into TRAIN values(14507,'DLI BTI EXP','20:55:00','21:10:00','SL','27-may-2023');

insert into STATION values(11,'vijayawada',10,'11:30:00', 12711);

insert into STATION values(12,'patiala',5,'01:40:00',14887);

insert into STATION values(13,'patiala',5,'14:07:00',14736);

insert into STATION values(20,'delhi',5,'08:15:00',18238);

insert into STATION values(21,'delhi',15,'20:55:00',14507);

insert into STATION values(22,'bhatinda',10,'20:55:00',14507);

insert into TRAIN_STATUS values(12711,10,4,0,1,1,0,100,450);

insert into TRAIN_STATUS values(14887,12,5,1,2,2,3,300,600);

insert into TRAIN_STATUS values(14736,13,4,0,3,1,5,200,400);

insert into TRAIN_STATUS values(18238,14,3,2,4,1,1,300,450);

insert into TRAIN_STATUS values(14507,10,4,3,5,1,0,100,200);

insert into TICKET values(4001,1701,'C',1,12711);

insert into TICKET values(4002,1704, 'NC',2,14887);

insert into TICKET values(4003,1700,'C',1,14736);

insert into TICKET values(4004,1708,'C',3,18238);

insert into TICKET values(4005,1706,'NC',1,14507);

insert into PASSENGER values(5001,78965,45,'M',1701 ,'C','B6-45',' ramesh',4001);

insert into PASSENGER values(5002,67878,44,'F',1704,'NC','C-89','sonia',4002);

insert into PASSENGER values(5003,56787,34,'M',1700,'C','A4-90','SONALIKA',4003);

insert into PASSENGER values(5004,67567,45,'F',1708,'C','B-89','Ranjana',4004);

insert into PASSENGER values(5005,45676,32,'M',1706,'NC','C-98','Mahesh',4005);

insert into STARTS values(12711,11);

insert into STARTS values(14887,12);

insert into STARTS values(14736,13);

insert into STARTS values(18238,20);

insert into STOPS_AT values(12711,20);

insert into STOPS_AT values(14887,11);

insert into STOPS_AT values(14736,20);

insert into STOPS_AT values(18238,22);

insert into STOPS_AT values(14507,12);

insert into STARTS values(14507,21);

insert into BOOKS values(1701,4001);

insert into BOOKS values(1704,4002);

insert into BOOKS values(1700,4003);

insert into BOOKS values(1708,4004);

insert into BOOKS values(1706,4005);

insert into CANCEL values(1701,4001,5001);

insert into CANCEL values(1704,4002,5002);

insert into CANCEL values(1700,4003,5003);

insert into CANCEL values(1708,4004,5004);

insert into CANCEL values(1706,4005,5005);

insert into REACHES values(12711,20,'04:00:00');

insert into REACHES values(14887,11,'04:30:00');

insert into REACHES values (14736,20,'05:35:00');

insert into REACHES values(18238,22,'20:30:00');

insert into REACHES values(14507,12,'21:30:00');

select * from USERS;

select * from TRAIN;

select * from STATION;

select * from TRAIN_STATUS;

select * from TICKET;

select * from PASSENGER;

select * from STARTS;

select * from STOPS_AT;

select * from BOOKS;

select * from CANCEL;

select * from REACHES;

CREATE OR REPLACE PROCEDURE PASSENGER_INFO(dot date, tno int) AS 
CURSOR C1 is select t.id,tr.train_no,p.passenger_id,p.gender,p.reservation_status,p.seat_number,p.pname 
from TRAIN tr, TICKET t, PASSENGER p 
where p.ticket_id=t.id AND 
    t.train_no=tr.train_no AND 
    dot=tr.rdate AND 
    tno=tr.train_no; 
rec C1%rowtype;
/

CREATE OR REPLACE PROCEDURE PASSENGER_INFO(dot date, tno int) AS 
CURSOR C1 is select t.id,tr.train_no,p.passenger_id,p.gender,p.reservation_status,p.seat_number,p.pname 
from TRAIN tr, TICKET t, PASSENGER p 
where p.ticket_id=t.id AND 
    t.train_no=tr.train_no AND 
    dot=tr.rdate AND 
    tno=tr.train_no; 
rec C1%rowtype; 
BEGIN 
Open C1; 
LOOP 
fetch C1 into rec; 
EXIT WHEN C1%NOTFOUND; 
dbms_output.put_line(rec.id||' '||rec.train_no||' '||rec.passenger_id||' '||rec.gender||' '||rec.reservation_status||' '||rec.seat_number||' '||rec.pname); 
END LOOP; 
close C1; 
END;
/

Declare 
dot date; 
tno int; 
Begin 
dot:='24-may-2023'; 
tno:=18238; 
PASSENGER_INFO(dot,tno); 
End;
/

CREATE OR REPLACE PROCEDURE PASSENGER_INFO(dot date, tno int) AS 
CURSOR C1 is select t.id,tr.train_no,p.passenger_id,p.gender,p.reservation_status,p.seat_number,p.pname 
from TRAIN tr, TICKET t, PASSENGER p 
where p.ticket_id=t.id AND 
    t.train_no=tr.train_no AND 
    dot=tr.rdate AND 
    tno=tr.train_no; 
rec C1%rowtype; 
BEGIN 
Open C1; 
LOOP 
fetch C1 into rec; 
EXIT WHEN C1%NOTFOUND; 
dbms_output.put_line(rec.id||' '||rec.train_no||' '||rec.passenger_id||' '||rec.gender||' '||rec.reservation_status||' '||rec.seat_number||' '||rec.pname); 
END LOOP; 
close C1; 
END; 
 
Declare 
dot date; 
tno int; 
Begin 
dot:='24-may-2023'; 
tno:=18238; 
PASSENGER_INFO(dot,tno); 
End;
/

CREATE OR REPLACE PROCEDURE PASSENGER_INFO(dot date, tno int) AS 
CURSOR C1 is select t.id,tr.train_no,p.passenger_id,p.gender,p.reservation_status,p.seat_number,p.pname 
from TRAIN tr, TICKET t, PASSENGER p 
where p.ticket_id=t.id AND 
    t.train_no=tr.train_no AND 
    dot=tr.rdate AND 
    tno=tr.train_no; 
rec C1%rowtype; 
BEGIN 
Open C1; 
LOOP 
fetch C1 into rec; 
EXIT WHEN C1%NOTFOUND; 
dbms_output.put_line(rec.id||' '||rec.train_no||' '||rec.passenger_id||' '||rec.gender||' '||rec.reservation_status||' '||rec.seat_number||' '||rec.pname); 
END LOOP; 
close C1; 
END;
/

Declare 
dot date; 
tno int; 
Begin 
dot:='24-may-2023'; 
tno:=18238; 
PASSENGER_INFO(dot,tno); 
End;
/

CREATE OR REPLACE PROCEDURE TRAINSBYSTATUS(IN_STATUS IN VARCHAR) AS 
CURSOR C2 is SELECT DISTINCT t.train_no,t.train_name,t.arrival_time,t.departure_time,t.rdate 
FROM TICKET P,TRAIN t  
    WHERE P.train_no=t.train_no AND  
    P.status=IN_STATUS; 
rec C2%rowtype; 
BEGIN 
Open C2; 
LOOP 
fetch C2 into rec; 
EXIT WHEN C2%NOTFOUND; 
DBMS_OUTPUT.PUT_LINE(rec.train_no||' '||rec.train_name||' '||rec.arrival_time||' '||rec.departure_time||' '||rec.rdate); 
END LOOP; 
CLOSE C2; 
END;
/

BEGIN  
TRAINSBYSTATUS('C'); 
END;
/

CREATE OR REPLACE TRIGGER TRIGG_TICKET_PRICE_HISTORY 
AFTER UPDATE OF fare1 
ON TRAIN_STATUS 
FOR EACH ROW 
BEGIN 
INSERT INTO TICKET_PRICE_HISTORY VALUES(:OLD.train_no,:OLD.fare1); 
END;
/

CREATE TABLE TICKET_PRICE_HISTORY 
( 
    train_no int, 
    new_fare float 
);

UPDATE 
TRAIN_STATUS SET fare1=1500 
WHERE train_no=14736;

select * from TICKET_PRICE_HISTORY;

drop table TICKET_PRICE_HISTORY;

CREATE OR REPLACE TRIGGER TRIGG_TICKET_PRICE_HISTORY 
AFTER UPDATE OF fare1 
ON TRAIN_STATUS 
FOR EACH ROW 
BEGIN 
INSERT INTO TICKET_PRICE_HISTORY VALUES(:OLD.train_no,:OLD.fare1); 
END;
/

CREATE TABLE TICKET_PRICE_HISTORY 
( 
    train_no int, 
    new_fare float 
);

CREATE OR REPLACE TRIGGER TRIGG_TICKET_PRICE_HISTORY 
AFTER UPDATE OF fare1 
ON TRAIN_STATUS 
FOR EACH ROW 
BEGIN 
INSERT INTO TICKET_PRICE_HISTORY VALUES(:OLD.train_no,:OLD.fare1); 
END;
/

UPDATE 
TRAIN_STATUS SET fare1=1500 
WHERE train_no=14736;

select * from TICKET_PRICE_HISTORY;