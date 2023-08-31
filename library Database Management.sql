CREATE DATABASE library;

USE library;

CREATE TABLE readers(
	reader_id VARCHAR(6),
    fname VARCHAR(30),
	mname VARCHAR(30),
	lname VARCHAR(30),
	city VARCHAR(15), 
    mobileno VARCHAR(10),
    occupation VARCHAR(10),
    dob DATE,
    CONSTRAINT readers_pk PRIMARY KEY(reader_id)
    );
    
DROP TABLE readers;

INSERT INTO readers
(reader_id,fname,mname,lname,city,mobileno,occupation,dob)
VALUES
('C00001','Ramesh','Chandra','Shinde','Delhi','9856475685','Service','1976-12-26'),
('C00002','Avnish','Rahul','Savle','Pune','9856426085','Student','1979-02-16'),
('C00003','Jojo','Jetalal','Gokhru','Mumbai','9858567235','Student','2002-12-26'),
('C00004','Akku','Sanjay','Jaiswal','Mumbai','9856472870','Officer','2002-11-18'),
('C00005','Prapti','Jitendra','Nagdeve','Chennai','9856486685','Pharmacist','2003-11-16'),
('C00006','Punu','Chandra','Kamtekar','Banglore','8556475685','Model','2002-12-27'),
('C00007','Atharva','Satish','Wadekar','Punjab','8456475685','Developer','2002-12-26'),
('C00008','Satish','Sadashiv','Wadekar','Kolkata','6796475685','Service','1976-12-26'),
('C00009','Chandra','Antony','Pawar','Pune','9859675685','Student','2002-05-26'),
('C00010','Shivam','Gautam','Pawar','Delhi','9852075685','Service','1985-06-26');

SELECT * FROM readers;

CREATE TABLE book(
bid VARCHAR(6),
bname VARCHAR(50),
bdomain VARCHAR(30),
CONSTRAINT book_bid_pk PRIMARY KEY(bid)
);

INSERT INTO Book
(bid,bname,bdomain)
VALUES 
('B00001','The Cat in the Hat','Story'),
('B00002','Charlie And the Choclate','Story'),
('B00003','The Very Hungry Caterpille','Story');

CREATE TABLE active_readers(
account_id VARCHAR(6),
reader_id VARCHAR(6),
bid VARCHAR(6),
atype VARCHAR(10),
astatus VARCHAR(10),
CONSTRAINT activereader_acnumber_pk PRIMARY KEY(account_id),
CONSTRAINT account_readerid_fk FOREIGN KEY(reader_id) REFERENCES readers(reader_id),
CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES book(bid)
);

INSERT INTO active_readers
(account_id,reader_id ,bid,atype,astatus)
VALUES 
('A00001','C00001','B00001','Premium','Active'),
('A00002','C00002','B00002','Regular','Active'),
('A00003','C00003','B00003','Premium','Active'),
('A00004','C00002','B00002','Premium','Active'),
('A00005','C00006','B00001','Regular','Suspended'),
('A00006','C00007','B00002','Premium','Active'),
('A00007','C00007','B00003','Regular','Active'),
('A00008','C00008','B00001','Regular','Terminated'),
('A00009','C00009','B00002','Premium','Terminated'),
('A00010','C00004','B00003','Premium','Active');


SELECT * FROM active_readers;

DROP TABLE bookissue_details;
CREATE TABLE bookissue_details(
issuenumber VARCHAR(6),
account_id VARCHAR(6),
bid VARCHAR(30),
bookname VARCHAR(50),
number_of_book_issued INT,
CONSTRAINT trandetails_number_pk PRIMARY KEY(issuenumber),
CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(account_id) REFERENCES active_readers(account_id)
);

SHOW TABLES;

INSERT INTO bookissue_details
(issuenumber,account_id ,bid,bookname,number_of_book_issued)
VALUES
('T00001','A00001','B00001','The Cat in the Hat',1),
('T00002','A00001','B00002','Charlie And the Choclate',1),
('T00003','A00002','B00001','The Cat in the Hat',1),
('T00004','A00002','B00003','The Very Hungry Caterpille',1);


SELECT * FROM active_readers;

SELECT * FROM active_readers WHERE astatus ='active';