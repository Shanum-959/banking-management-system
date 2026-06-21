CREATE DATABASE BMS;
USE BMS;
CREATE TABLE Branch (
    Branch_ID INT PRIMARY KEY,
    Branch_Name VARCHAR(100),
    Branch_Location VARCHAR(255)
);
INSERT INTO Branch (Branch_ID, Branch_Name, Branch_Location) VALUES
(101, 'Main Branch', 'Lahore, Pakistan'),
(102, 'City Branch', 'Karachi, Pakistan'),
(103, 'North Branch', 'Islamabad, Pakistan');

CREATE TABLE Admin (
    AdminID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(50)
);
INSERT INTO Admin (AdminID, Username, Password) VALUES
(1, 'admin_Iqra', 'Iqra123'),
(2, 'admin_Hadia', 'Hadia123'),
(3, 'admin_maliha', 'maliha123');

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone_No VARCHAR(20),
    DOB DATE,
    Address TEXT,
    Age INT,
    Date_Created DATE
);
INSERT INTO Customer (Customer_ID, Name, Email, Phone_No, DOB, Address, Age, Date_Created) VALUES
(1, 'Hafsa', 'hafsa@example.com', '03001234567', '2003-05-10', 'Lahore, Pakistan', 22, '2025-05-07'),
(2, 'Iqra', 'iqra@example.com', '03012345678', '2002-08-15', 'Karachi, Pakistan', 22, '2025-05-07'),
(3, 'Hadia', 'hadia@example.com', '03121234567', '2004-01-20', 'Islamabad, Pakistan', 21, '2025-05-07'),
(4, 'Maliha', 'maliha@example.com', '03211234567', '2003-09-18', 'Faisalabad, Pakistan', 21, '2025-05-07'),
(5, 'Laiba', 'laiba@example.com', '03311234567', '2004-07-25', 'Rawalpindi, Pakistan', 20, '2025-05-07'),
(6, 'Saniya', 'saniya@example.com', '03451234567', '2002-11-30', 'Multan, Pakistan', 22, '2025-05-07'),
(7, 'Soran', 'soran@example.com', '03551234567', '2001-06-12', 'Quetta, Pakistan', 23, '2025-05-07'),
(8, 'Noor', 'noor@example.com', '03661234567', '2003-03-05', 'Peshawar, Pakistan', 22, '2025-05-07');

CREATE TABLE Account (
    Account_ID INT PRIMARY KEY,
    Customer_ID INT,
    Account_Type VARCHAR(50),
    Balance DECIMAL(12,2),
    Status VARCHAR(20),
    Branch_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);
INSERT INTO Account (Account_ID, Customer_ID, Account_Type, Balance, Status, Branch_ID) VALUES
(1001, 1, 'Savings', 15000.00, 'Active', 101),
(1002, 2, 'Current', 22000.00, 'Active', 101),
(1003, 3, 'Savings', 18000.00, 'Inactive', 102),
(1004, 4, 'Current', 25000.00, 'Active', 103),
(1005, 5, 'Savings', 12000.00, 'Active', 101),
(1006, 6, 'Current', 30000.00, 'Suspended', 102),
(1007, 7, 'Savings', 9000.00, 'Active', 103),
(1008, 8, 'Current', 20000.00, 'Active', 101);

CREATE TABLE Transaction (
    Transaction_ID INT PRIMARY KEY,
    Account_ID INT,
    Type VARCHAR(50),
    Amount DECIMAL(12,2),
    Date DATE,
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);
INSERT INTO Transaction (Transaction_ID, Account_ID, Type, Amount, Date) VALUES
(1, 1001, 'Deposit', 5000.00, '2025-05-01'),
(2, 1002, 'Withdrawal', 2000.00, '2025-05-02'),
(3, 1003, 'Deposit', 3000.00, '2025-05-03'),
(4, 1004, 'Withdrawal', 1500.00, '2025-05-04'),
(5, 1005, 'Deposit', 2500.00, '2025-05-05'),
(6, 1006, 'Withdrawal', 1000.00, '2025-05-06'),
(7, 1007, 'Deposit', 4000.00, '2025-05-06'),
(8, 1008, 'Withdrawal', 1800.00, '2025-05-07');

CREATE TABLE Account_Request (
    Request_ID INT PRIMARY KEY,
    Customer_ID INT,
    Account_Type VARCHAR(50),
    Request_Date DATE,
    AccRequest_Status VARCHAR(20),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
INSERT INTO Account_Request (Request_ID, Customer_ID, Account_Type, Request_Date, AccRequest_Status) VALUES
(1, 1, 'Savings', '2025-04-25', 'Approved'),
(2, 2, 'Current', '2025-04-26', 'Pending'),
(3, 3, 'Savings', '2025-04-27', 'Rejected'),
(4, 4, 'Current', '2025-04-28', 'Approved'),
(5, 5, 'Savings', '2025-04-29', 'Approved'),
(6, 6, 'Current', '2025-04-30', 'Pending'),
(7, 7, 'Savings', '2025-05-01', 'Rejected'),
(8, 8, 'Current', '2025-05-02', 'Approved');

CREATE TABLE Loan (
    Loan_ID INT PRIMARY KEY,
    Customer_ID INT,
    Loan_Type VARCHAR(50),
    Amount DECIMAL(12,2),
    Interest_Rate DECIMAL(5,2),
    Start_Date DATE,
    End_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
INSERT INTO Loan (Loan_ID, Customer_ID, Loan_Type, Amount, Interest_Rate, Start_Date, End_Date, Status) VALUES
(1, 1, 'Personal', 50000.00, 7.50, '2024-01-10', '2026-01-10', 'Active'),
(2, 2, 'Home', 250000.00, 6.25, '2023-06-15', '2033-06-15', 'Approved'),
(3, 3, 'Education', 80000.00, 5.00, '2024-09-01', '2028-09-01', 'Pending'),
(4, 4, 'Car', 120000.00, 6.75, '2023-11-20', '2026-11-20', 'Active'),
(5, 5, 'Personal', 40000.00, 7.00, '2025-03-05', '2027-03-05', 'Rejected'),
(6, 6, 'Business', 300000.00, 8.50, '2022-12-01', '2027-12-01', 'Active'),
(7, 7, 'Home', 200000.00, 6.00, '2024-07-10', '2034-07-10', 'Approved'),
(8, 8, 'Education', 60000.00, 4.75, '2024-02-18', '2027-02-18', 'Pending');

CREATE TABLE Loan_Payment (
    Payment_ID INT PRIMARY KEY,
    Loan_ID INT,
    Payment_Date DATE,
    Amount_Paid DECIMAL(12,2),
    Payment_Method VARCHAR(50),
    FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID)
);
INSERT INTO Loan_Payment (Payment_ID, Loan_ID, Payment_Date, Amount_Paid, Payment_Method) VALUES
(1, 1, '2025-01-15', 10000.00, 'Bank Transfer'),
(2, 2, '2025-02-10', 25000.00, 'Cash'),
(3, 3, '2025-03-05', 8000.00, 'Online'),
(4, 4, '2025-04-01', 12000.00, 'Debit Card'),
(5, 5, '2025-04-10', 4000.00, 'Mobile App'),
(6, 6, '2025-04-20', 30000.00, 'Cheque'),
(7, 7, '2025-04-25', 20000.00, 'Online'),
(8, 8, '2025-05-01', 6000.00, 'Bank Transfer');

CREATE TABLE Card (
    Card_ID INT PRIMARY KEY,
    Account_ID INT,
    Card_Number VARCHAR(20),
    Card_Type VARCHAR(20),
    Expiry_Date DATE,
    CVV VARCHAR(5),
    Status VARCHAR(20),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);
INSERT INTO Card (Card_ID, Account_ID, Card_Number, Card_Type, Expiry_Date, CVV, Status) VALUES
(1, 1001, '4111111111111111', 'Debit', '2027-05-31', '123', 'Active'),
(2, 1002, '4222222222222222', 'Credit', '2026-11-30', '456', 'Active'),
(3, 1003, '4333333333333333', 'Debit', '2028-03-31', '789', 'Inactive'),
(4, 1004, '4444444444444444', 'Credit', '2027-08-31', '321', 'Blocked'),
(5, 1005, '4555555555555555', 'Debit', '2029-01-31', '654', 'Active'),
(6, 1006, '4666666666666666', 'Credit', '2026-06-30', '987', 'Suspended'),
(7, 1007, '4777777777777777', 'Debit', '2027-09-30', '159', 'Active'),
(8, 1008, '4888888888888888', 'Credit', '2028-12-31', '753', 'Active');

CREATE TABLE Customer_Support (
    Support_ID INT PRIMARY KEY,
    Customer_ID INT,
    Query TEXT,
    Reply TEXT,
    Date_Created DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
INSERT INTO Customer_Support (Support_ID, Customer_ID, Query, Reply, Date_Created) VALUES
(1, 1, 'How can I reset....', 'Please visit the password reset page and follow the instructions.', '2025-05-01'),
(2, 2, 'Can I change my account .....', 'Yes, you can request a change through your account settings', '2025-05-02'),
(3, 3, 'Why is my ........', 'Your loan application is pending due to incomplete documentation.', '2025-05-03'),
(4, 4, 'How do I apply for a .......', 'You can apply for a new credit card by visiting our credit card application page', '2025-05-04'),
(5, 5, 'Can I link multiple accounts ......', 'No, a card can only be linked to a single account at a time.', '2025-05-05'),
(6, 6, 'How do I report a ......', 'Please contact our support team immediately', '2025-05-06'),
(7, 7, 'What is the process for loan repayment?', 'You can make payments online, via bank transfer.', '2025-05-07'),
(8, 8, 'How can I update my personal details?', 'You can update your details in the account settings section', '2025-05-08');

-- To retrieve a list of all customers who have an active account
SELECT c.Name, c.Email, a.Account_Type, a.Balance
FROM Customer c
JOIN Account a ON c.Customer_ID = a.Customer_ID
WHERE a.Status = 'Active';

-- To find all transactions made by a specific customer
SELECT t.Transaction_ID, t.Type, t.Amount, t.Date
FROM Transaction t
JOIN Account a ON t.Account_ID = a.Account_ID
WHERE a.Customer_ID = 1;  -- Replace 1 with the specific customer ID

-- To check the loan status of a particular customer
SELECT l.Loan_ID, l.Loan_Type, l.Amount, l.Status
FROM Loan l
WHERE l.Customer_ID = 1;  -- Replace 1 with the specific customer ID

-- To retrieve a list of all credit cards that are currently active
SELECT c.Card_Number, c.Card_Type, c.Expiry_Date
FROM Card c
WHERE c.Status = 'Active';

-- Show all customers from Lahore
SELECT Name, Email, Address
FROM Customer
WHERE Address LIKE '%Lahore%';

-- List all 'Savings' accounts
SELECT Account_ID, Customer_ID, Balance
FROM Account
WHERE Account_Type = 'Savings';

-- INNER JOIN – Show customer names with their account types
SELECT Customer.Name, Account.Account_Type
FROM Customer
INNER JOIN Account ON Customer.Customer_ID = Account.Customer_ID;

-- LEFT JOIN – Show all customers and their loan types 
SELECT Customer.Name, Loan.Loan_Type
FROM Customer
LEFT JOIN Loan ON Customer.Customer_ID = Loan.Customer_ID;

-- RIGHT JOIN – Show all loans and the customer who took them
SELECT Customer.Name, Loan.Loan_Type, Loan.Amount
FROM Customer
RIGHT JOIN Loan ON Customer.Customer_ID = Loan.Customer_ID;

-- Nested Subquery (4+ Tables): Customers with account balance above average and active cards
SELECT c.Name
FROM Customer c
WHERE c.Customer_ID IN (
    SELECT a.Customer_ID
    FROM Account a
    JOIN Card ca ON a.Account_ID = ca.Account_ID
    JOIN Branch b ON a.Branch_ID = b.Branch_ID
    WHERE a.Balance > (
        SELECT AVG(Balance) FROM Account
    )
    AND ca.Status = 'Active'
);

-- Correlated Subquery (4+ Tables): Customers with loan amount greater than balance and have submitted a support query
SELECT c.Name
FROM Customer c
WHERE EXISTS (
    SELECT 1
    FROM Loan l
    JOIN Account a ON l.Customer_ID = a.Customer_ID
    JOIN Branch b ON a.Branch_ID = b.Branch_ID
    JOIN Customer_Support cs ON cs.Customer_ID = c.Customer_ID
    WHERE l.Customer_ID = c.Customer_ID
      AND l.Amount > a.Balance
);