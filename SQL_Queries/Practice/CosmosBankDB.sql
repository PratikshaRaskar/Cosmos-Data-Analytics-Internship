CREATE DATABASE CosmosBankDB;
USE CosmosBankDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO Customers (customer_id, name, city)
VALUES 
(1, 'PRATIKSHA RASKAR','Pune'),
(2, 'ANJALI RASKAR','Mumbai'),
(3, 'PRANJALI KHATAVKAR','Nagpur'),
(4, 'DHANASHREE JAVHERI','Nashik');

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Accounts (account_id, customer_id, account_type, balance)
VALUES
(1001, 1, 'Savings', 85000),
(1002, 2, 'Current', 150000),
(1003, 3, 'Savings', 45000),
(1004, 4, 'Savings', 55000);

SELECT * FROM Customers;
SELECT * FROM Accounts;

SELECT * FROM Customers
WHERE city = 'Pune';

SELECT * FROM Accounts
ORDER BY balance DESC;

SELECT c.name,
       a.account_type,
       a.balance
FROM Customers c
INNER JOIN Accounts a
ON c.customer_id = a.customer_id;

SELECT SUM(balance) AS Total_Balance
FROM Accounts;

SELECT AVG(balance) AS Avg_Balance
FROM Accounts;

SELECT COUNT(*) AS Total_Accounts
FROM Accounts;


SELECT account_type,
       SUM(balance) AS Total_Balance
FROM Accounts
GROUP BY account_type
HAVING SUM(balance) > 50000;



