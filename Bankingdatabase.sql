create database BankingDB;
use BankingDB;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);

DESC CUSTOMERS;

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

ALTER TABLE Customers
ADD DateOfBirth DATE;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

DROP TABLE ACCOUNTBRANCHES;

ALTER TABLE Accounts
ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE customers
MODIFY FirstName VARCHAR(50) NOT NULL;

ALTER TABLE CUSTOMERS
ADD CONSTRAINT uq_Email UNIQUE (Email);

use bankingdb;

insert into customers
(customerID, FirstName, LastName, Email, Phone, DateOfBirth)
values
(101, 'Rahul', 'Sharma', 'rahul@gamil.com', '9876543210', '1998-04-15');

insert into accounts
(accountID, CustomerID, Accounttype, Balance)
values
(201, 101, 'Savings', 25000);

set sql_safe_updates=0;

select * from customers;

update customers
set phone='9999999999'
where customerID=101;

select * from customers
where customerID=101;

update customers
set email='rahul.sharma@gmail.com'
where customerID=101;

select * from customers
where customerID=101;
use bankingdb;
alter table accounts
add constraint fk_customer_ID
foreign key(CustomerID)
references customers(customerID);

alter table accounts
add constraint fk_branch_ID
foreign key(BranchID)
references branches(BranchID);

alter table branches
add constraint pk_branch_id
primary key(branchid);

alter table accounts
add branchid int;

alter table transactions
add constraint fk_account_ID
foreign key(accountID)
references accounts(accountID);

alter table transactions
add constraint pk_transaction_id
primary key(transactionid);

alter table transactions
add accountid int;



alter table accounts
add constraint pk_account_id
primary key(accountid);

alter table loans
add constraint pk_loan_id
primary key(loanid);

alter table loans
add customerid int;

alter table loans
add constraint fk_custr_ID
foreign key(customerID)
references customers(customerID);









