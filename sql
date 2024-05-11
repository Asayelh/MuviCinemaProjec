CREATE SCHEMA muvicinema;
CREATE TABLE Customer (
    CustID INT(10) Not Null,
    F_Name varchar (50) Not Null,
    S_Name varchar (50),
    L_Name varchar (50) Not Null,
    Email varchar (50),
    Mobile_Num int(10),
    DOfBirth varchar (10),
	MOfBirth varchar (10),
    YOfBirth varchar (10),
CONSTRAINT Customer_PK PRIMARY KEY (CustID)
); 

CREATE TABLE Movie (
	 MovieID INT(10) Not Null,
     Movie_Name VARCHAR(50) Not Null,
     TickectNo INT(10),
     Movie_Type VARCHAR(50),
     Movie_Time VARCHAR(10),
     Movie_hrs VARCHAR(50),
	 Movie_Date date,
	 CONSTRAINT Movie_PK PRIMARY KEY (MovieID),
     FOREIGN KEY (TickectNo) REFERENCES Tickect (TickectNo),
     CONSTRAINT Movie_fk FOREIGN KEY (TickectNo) REFERENCES Tickect (TickectNo)
);       

CREATE TABLE Ticket (
     TickectNo INT(10) Not Null,
	 Movie_Name VARCHAR(50) Not Null,
     Movie_Time VARCHAR(10),
     Movie_Date date,
     Hall_No int(100),
     Seat_No VARCHAR(5),
CONSTRAINT Movie_PK PRIMARY KEY (TickectNo),
CONSTRAINT Ticket_fk FOREIGN KEY ( Movie_Date, Movie_Name, Movie_Time) REFERENCES Movie (Movie_Date, Movie_Name,Movie_Time)
);

CREATE TABLE payment (
	IdCard INT(10) Not Null,
	payTime VARCHAR(50) ,
	payDate date,
	Amount int,
CONSTRAINT payment_PK PRIMARY KEY (IdCard)
);

CREATE TABLE Rule (
    RuleID INT(10) Not Null,
    Rule_Name varchar(50),
	Rule_Desc varchar(100),
CONSTRAINT rule_pk PRIMARY KEY (RuleID)
);

CREATE TABLE MovieRating (
    RuleID int(10) Not Null,
    movie_type varchar(50),
CONSTRAINT movierating_pk PRIMARY KEY (RuleID)
);
       
CREATE TABLE MovieTime (
    Movie_Name VARCHAR(50) Not Null,
    Movie_Date date,
    movie_Time varchar(50),
CONSTRAINT Movietime_pk PRIMARY KEY (movie_name)
);

INSERT INTO    Customer
VALUES         (1109511,'ali','ahmed','gamdyi','Ali1421@gmail.com',0597885852,03,05,2021);
INSERT INTO    Customer
VALUES         (209522,'esmail','ali','brgawi','esmail2000@gmail.com',0592756026,04,05,2021);
INSERT INTO    Customer
VALUES         (309533,'remas','yaser','ALzhrani','ALzhrani5587@gmail.com',0592673495,11,11,2022);
INSERT INTO    Customer
VALUES         (409544,'rema','hasn','ALmalki','remai5677@gmail.com',0592676375,22,18,2022);
INSERT INTO    Customer
VALUES         (509555,'amal','mohamed','Aletibi','amali9387@gmail.com',0596812568,22,18,2022);


INSERT INTO    movie 
VALUES         ('CA11900','venom',10,'horror','1:00 AM','2 hours','2021-05-11');
INSERT INTO    movie 
VALUES         ('CA22900','ponyo',13,'disney','9:00 AM','2 hours','2021-04-14');
INSERT INTO    movie 
VALUES         ('CA33900','miracle in dungeon 7',22,'drama','2:00 PM','1 and half hours','2022-12-1');             
INSERT INTO    movie 
VALUES         ('CA44900','third eye',25,'horror','4:00 PM','2 hours','2022-10-17');             
INSERT INTO    movie 
VALUES         ('CA55900','spider man',3,'action','6:00 PM','3 hours','2022-9-30'); 

INSERT INTO    ticket
VALUES         (10,'venom','1:00 AM','2021-05-11',1,'A1'); 
INSERT INTO    ticket
VALUES         (13,'ponyo','9:00 AM','2021-04-14',4,'C1');    
INSERT INTO    ticket
VALUES         (22,'miracle in dungeon 7','2:00 PM','2022-12-1',6,'B5');    
INSERT INTO    ticket
VALUES         (25,'thrd eye','4:00 PM','2022-10-17',10,'D7'); 
INSERT INTO    ticket
VALUES         (3,'spider man','6:00 PM','2022-9-30',12,'C3'); 

INSERT INTO    payment
VALUES         (11900,'8:00 AM','2021-05-11',63);
INSERT INTO    payment
VALUES         (22900,'1:00 PM','2021-04-14',48);             
INSERT INTO    payment
VALUES         (33900,'6:00 PM','2022-12-1',120); 
INSERT INTO    payment
VALUES         (44900,'12:00 AM','2022-10-17',63);
INSERT INTO    payment
VALUES         (55900,'10:00 AM','2022-9-30',48);



INSERT INTO    rule
VALUES         (1,'Age','No one under the age 18 is allowed to enter horror movies');
INSERT INTO    rule
VALUES         (2,'kids ','Children are not allowed inside the hall and Parents must accompany guests betwen the age 7 and 17');
INSERT INTO    rule
VALUES         (3,'food','Food from outside the cinema is not allowed to enter the hal'); 
INSERT INTO    rule
VALUES         (4,'smoking','Smoking is prohibited in cinema halls');       
INSERT INTO    rule
VALUES         (5,'the noise','It is forbidden to make loud noises in the cinema hall');       
 
 
INSERT INTO    movierating
VALUES         (1,'horror');
INSERT INTO    movierating
VALUES         (2,'disney');
INSERT INTO    movierating
VALUES         (3,'drama');
INSERT INTO    movierating
VALUES         (4,'horror');
INSERT INTO    movierating
VALUES         (5,'action');


INSERT INTO    movietime
VALUES         ('venom','2021-05-11','1:00 AM');
INSERT INTO    movietime 
VALUES         ('ponyo','2021-07-14','9:00 AM');
INSERT INTO    movietime 
VALUES         ('miracle in dungeon 7','2022-09-14','2:00 PM');             
INSERT INTO    movietime
VALUES         ('third eye','2022-10-17','4:00 PM');
INSERT INTO    movietime
VALUES         ('spider man','2022-9-30','6:00 PM');
       


#update & delete & alter     
UPDATE muvicinema.movierating
SET movie_type = 'Comedy' 
WHERE RuleID = '3'; 

UPDATE movierating
SET movie_type = 'animation' 
WHERE RuleID = '02';

UPDATE muvicinema.movie
SET movie_type = 'animation' 
WHERE MovieID = 'CA22900';

DELETE FROM customer;

DELETE FROM movietime
WHERE Movie_Name = 'ponyo';

ALTER TABLE muvicinema.rule
ADD Parental_Guidance VARCHAR(5);

ALTER TABLE muvicinema.movierating
ADD Parental_Guidance VARCHAR(5);


# SQL Queriers using SELECT command INCLUDE: 
# WHERE, GROUP BY, HAVING, ORDER BY, subqueries and join operations.

#houers than higher than 2h
SELECT MovieID, Movie_hrs 
FROM Movie
WHERE Movie_hrs  > 2.00;

# price that greater than 100     
SELECT IdCard, Amount
FROM payment
WHERE Amount > 100.00;

#Prices in this range
SELECT IdCard, Amount
FROM payment
WHERE Amount BETWEEN 45.00 AND 100.00;

SELECT CustID, F_Name, L_Name
FROM Customer
ORDER BY 1 ASC;

SELECT *
FROM ticket
WHERE TickectNo = (SELECT TickectNo
           FROM Movie
           WHERE TickectNo = 3
    AND Movie_Name = 'spider man');
    
SELECT *
FROM Movie
ORDER BY MovieID, Movie_Name, Movie_Time, Movie_hrs ,Movie_Date DESC ;

SELECT movie_type, COUNT(RuleID) AS count
FROM MovieRating
GROUP BY movie_type
ORDER BY movie_type;

SELECT  movie_type, COUNT(RuleID) AS count
FROM MovieRating
GROUP BY movie_type
HAVING COUNT(RuleID) > 1;

SELECT IdCard, Amount
FROM payment
WHERE Amount > (SELECT AVG(Amount) FROM payment);

SELECT SUM(Amount)AS AmountSum
FROM payment
GROUP BY Amount;

SELECT m.Movie_Name ,m.Movie_Date, m.movie_Time,t.TickectNo
FROM MovieTime m ,ticket t
WHERE m.movie_Time = t.movie_Time
ORDER BY t.TickectNo ASC ,m.movie_Time DESC ;
