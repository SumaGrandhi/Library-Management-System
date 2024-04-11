drop database libraryms;
create database libraryms;
use libraryms;
CREATE TABLE Admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);
CREATE TABLE Student (
    reg_number INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    branch VARCHAR(255),
    year VARCHAR(255),
    division VARCHAR(255),
    roll_number VARCHAR(255),
    fine INT,
    fine_paid INT
);
CREATE TABLE Book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    category VARCHAR(255),
    isIssued BOOLEAN DEFAULT NULL,
    price INT,
    student_reg_number INT,
    FOREIGN KEY (student_reg_number) REFERENCES Student(reg_number)
);
CREATE TABLE Message (
    id INT PRIMARY KEY AUTO_INCREMENT,
    text VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL
);
CREATE TABLE Transaction (
    srNr BIGINT PRIMARY KEY AUTO_INCREMENT,
    bookId INT NOT NULL,
    bookName VARCHAR(255) NOT NULL,
    regNumber INT,
    studentFullName VARCHAR(255),
    issueDate DATE,
    expectedReturnDate DATE,
    actualReturnDate DATE,
    fine INT,
    FOREIGN KEY (regNumber) REFERENCES Student(reg_number)
);

create table student_books ( 
    books_book_id INT,
    student_reg_number INT
);

insert into admin values (1,"admin" , "password");

alter table book modify isIssued Boolean NULL;

alter table transaction add constraint fk_key foreign key (bookId) references book (book_id);

alter table transaction drop constraint fk_key;
alter table transaction modify bookId Boolean NULL;
alter table transaction modify bookName Boolean NULL;

INSERT INTO transaction (bookId, bookName, regNumber, studentFullName, issueDate, expectedReturnDate, actualReturnDate, fine,sr_nr,actual_return_date,book_id,book_name,expected_return_date,issue_date,reg_number,student_full_name)
VALUES (NULL,NULL,NULL,NULL,NULL,NULL,NULL,500, 9 , NULL,9 , 'hello','2024-04-10','2024-04-01',1,'Suhas Gowda Harish');