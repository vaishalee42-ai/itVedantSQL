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

select * from transactions;

insert into transactions
values
(302, '2026-07-01', 5000.00, 'Deposit', 201);

select * from accounts;

DELETE FROM transactions
WHERE TRANSACTIONID = 302;

SELECT * FROM TRANSACTIONS;

DELETE FROM ACCOUNTS 
WHERE ACCOUNTID = 202;

SELECT * FROM ACCOUNTS;

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(102, 'Priya', 'Patil', 'priya@gmail.com', '9988776655', '2000-09-20'),
(103, 'Amit', 'Patel', 'amit.patel@gmail.com', '9876500001', '1995-06-18'),
(104, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876500002', '1997-09-12'),
(105, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', '9876500003', '1993-11-25');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000),
(203, 103, 'Savings', 35000),
(204, 104, 'Current', 60000),
(205, 105, 'Savings', 45000);

INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-10', 5000, 'Deposit'),
(302, 202, '2025-05-11', 2500, 'Withdraw'),
(303, 203, '2025-05-12', 10000, 'Deposit'),
(304, 204, '2025-05-13', 3000, 'Withdraw'),
(305, 205, '2025-05-14', 7000, 'Deposit');

INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(1, 'Mumbai Branch', 'Andheri, Mumbai', '0221111111'),
(2, 'Pune Branch', 'Shivaji Nagar, Pune', '0202222222'),
(3, 'Nashik Branch', 'College Road, Nashik', '0253222222'),
(4, 'Nagpur Branch', 'Sitabuldi, Nagpur', '0712333333'),
(5, 'Navi Mumbai Branch', 'Vashi, Navi Mumbai', '0224444444');

INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);


select * from customers;

select firstname, lastname, email, phone
from customers;
select accountid, accounttype, balance
from accounts;

select * from accounts 
where accounttype = 'savings';

select * from accounts
where balance >25000;

select * from transactions
where amount between 5000 and 20000;

select * from transactions;

select * from customers 
where CustomerID in (101,102,103);

select * from customers
where firstname like 'r%';

select * from accounts;

select * from accounts
where balance <15000;

select * from transactions
where amount between 1000 and 10000;

select * from customers
where CustomerID in (104,105);

select * from customers
where lastname like 's%';

select * from customers
order by FirstName asc;

select * from accounts
order by Balance desc;

select distinct accounttype
from accounts;

select * from accounts
order by balance desc
limit 3;

select * from transactions
limit 3 offset 2;

select * from customers
order by lastname asc;

select * from transactions
order by amount desc
limit 5;

select distinct transactiontype 
from transactions;

select * from transactions
limit 4 offset 3;

select * from customers
where phone is null;

select * from customers
where email is not null;

select * from customers 
where email is null;

select * from accounts
where balance is not null;

select accountid, balance,
case
when balance >=50000 then 'Premium Account'
when balance >=25000 then 'Standard Account'
else 'Basic Account'
end as AccountCategory
from accounts;

select * from transactions;


select transactionid, amount,
case
when amount >=10000 then 'High Transaction'
when amount >=5000 then 'Medium Transacation'
else 'Low Category'
end as AmmountCategory
from transactions;

select * from accounts;

select accountid, balance,
RANK() over(order by balance desc) as balancerank
from accounts;

SELECT * FROM transactions;
SELECT TRANSACTIONID, AMOUNT,
SUM(AMOUNT) OVER(ORDER BY TRANSACTIONDATE) as runningtotal
FROM Transactions;

select * from transactions;

select transactionid, amount,
avg(amount) over() as averagetransaction
from transactions;

select * from accounts;

select * from customers;

select accountid, CustomerID, balance,
RANK() over(order by balance desc) as customerrank
from accounts;
select * from accounts;
SELECT accountID, balance,
SUM(balance) OVER(ORDER BY accountid) as runningbalance
FROM accounts;

SELECT TransactionID,
       AccountID,
       Amount,
       MAX(Amount) OVER () AS MaximumTransaction
FROM Transactions;

select * from customers
where firstname like 'A%';

select * from customers
where email like '%gmail%';

select * from customers
where firstname like '%kar';

select * from customers 
where firstname like 'R%';

select * from customers
where email like '%yahoo%';

select * from customers
where lastname like 'p%';

select * from customers 
where phone like '%99';

select * from accounts
where accounttype in ('savings', 'current');

select * from transactions
where transactiontype in ('deposit', 'withdrawal');

select * from customers
where customerid in (101,102,105);

select * from transactions
where transactiontype in ('payment', 'deposit');

select * from customers
where CustomerID in (103, 104);

select * from accounts
where accountid in (201, 205);

select * from customers
order by lastname asc;

select * from accounts
order by balance desc;

select * from transactions
order by TransactionDate desc;

select * from customers 
order by FirstName asc;

select * from accounts
order by accounttype asc;

select * from transactions 
order by amount desc;

select * from customers
order by DateOfBirth;

show columns from customers;

SELECT * FROM ACCOUNTS
ORDER BY BALANCE DESC
LIMIT 5;

SELECT * FROM CUSTOMERS
LIMIT 3;

SELECT * FROM TRANSACTIONS
LIMIT 5 OFFSET 3;

SELECT * FROM TRANSACTIONS
ORDER BY AMOUNT DESC
LIMIT 3;

SELECT * FROM CUSTOMERS
LIMIT 4;

SELECT * FROM accounts
LIMIT 3 offset 2;

SELECT * FROM transactions
ORDER BY TransactionDate DESC
LIMIT 5;

SELECT * FROM ACCOUNTS
WHERE ACCOUNTTYPE = 'SAVINGS'
ORDER BY BALANCE DESC;

SELECT * FROM CUSTOMERS
WHERE FIRSTNAME LIKE 'S%'
LIMIT 5;

SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit','Withdrawal')
ORDER BY TransactionDate DESC;

use bankingdb;

select * from customers;

select firstname,
upper(firstname) as uppercasename
from customers;

select firstname,
lower(firstname) as lowercasename
from customers;

select firstname,
length(firstname) as namelength
from customers;

select firstname,
left(firstname,3) as initials
from customers;

select 
concat(firstname,'-',lastname) as fullname
from customers;

select * from customers;
select * from transactions;

select current_date();
select now();

select customerid,
year(dateofbirth) as year
from customers;

select customerid,
month(dateofbirth) as month
from customers;

SELECT
CustomerID,
DATEDIFF(CURDATE(),DateOfBirth) AS Days
FROM customers;

SELECT
    FirstName,
    DateOfBirth,
    IF(YEAR(DateOfBirth) <= 1995,
       'Adult',
       'Young') AS Category
FROM Customers;

SELECT
    FirstName,
    IFNULL(Phone, 'Not Available') AS PhoneNumber
FROM Customers;

SELECT GREATEST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS LatestBirthDate;

SELECT LEAST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS EarliestBirthDate;

SELECT
    FirstName,
    NULLIF(FirstName,'Priya') AS Result
FROM Customers;

SELECT SUM(Balance) as total_balance
FROM Accounts;

SELECT AVG(Balance) AS average_balance
FROM Accounts;

SELECT MAX(Balance) AS highest_balance
FROM Accounts;

SELECT MIN(Balance) AS lowest_balance
FROM Accounts;

SELECT COUNT(*) AS total_accounts
FROM Accounts;

SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType;

SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType
HAVING SUM(Balance) > 25000;

select loanid, customerid, loanamount,
RANK() OVER(ORDER BY LOANAMOUNT DESC
)AS LOANRANK
FROM LOANS;

select loanid, customerid, loanamount,
dense_rank() OVER(ORDER BY LOANAMOUNT DESC
)AS DENSERANK
FROM LOANS;

select loanid,customerid,loanamount,
row_number() over(
order by loanamount desc
) as rownumber
from loans;

select * from loans;
select loanid, customerid, loanamount,
row_number() over(
partition by customerid
order by loanamount desc
)as rownum
from loans;

select loanid, customerid, loanamount,
sum(loanamount) over(order by loanamount desc) as runningtotal
from loans;
USE BANKINGDB;
SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    LAG(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS PreviousLoanAmount
FROM Loans;

SELECT
    LoanID, CustomerID, LoanAmount,
    LEAD(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS NextLoanAmount
FROM Loans;

