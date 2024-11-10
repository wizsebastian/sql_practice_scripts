CREATE DATABASE practice_db;
USE practice_db;

CREATE TABLE Users (
	UserID INT PRIMARY KEY auto_increment,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Age INT
); 

CREATE TABLE Orders (
	OrderID INT PRIMARY KEY auto_increment,
    UserID INT,
    ProductName VARCHAR(100),
    Amount DECIMAL(10, 2),
    OrderDate DATE, 
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
); 

INSERT INTO Users (Name, Email, Age) VALUES
('Sebastian', 'a@a.com', 28),
('Andres', 'b@b.com', 32),
('Ranses', 'c@c.com',  25);

SELECT * FROM Users;
 
INSERT INTO Orders (UserID, ProductName, Amount, OrderDate) VALUES
(2, 'Laptop Gaming', 2200.50, '2024-11-24'),
(2, 'Aro de luz', 33.20, '2024-11-02'),
(3, 'Power Bank', 75.00, '2024-11-01'),
(1, 'Gasoline Mode GTA', 300.00, '2024-11-03');

SELECT * FROM Orders;

SELECT * FROM Orders where UserID = 1;
 
-- GET THE ORDER -- 
select * from Orders ORDER BY OrderDate;


-- Conditional filter data -- 
SELECT * FROM Users WHERE Age > 30;

--   Conditional filter data with numbers --
SELECT * FROM Orders WHERE Amount > 100 ORDER BY amount DESC;
SELECT * FROM Orders WHERE Amount <100 ORDER BY amount ASC;

-- Inner Join --
SELECT Orders.OrderID, Users.Name, Orders.ProductName, Orders.Amount
FROM Orders
INNER JOIN Users ON Orders.UserID = Users.UserID;

-- Inner Join Aggregation --
SELECT Users.Name, SUM(Orders.Amount) AS TotalSpent
FROM Orders
INNER JOIN Users ON Orders.UserID = Users.UserID
GROUP BY Users.Name;

SELECT * FROM Orders;
-- how to count --
SELECT COUNT(*) AS TotalOrders FROM Orders;



-- Subqueries -- 
SELECT * FROM Users
WHERE UserID IN (
	SELECT UserID FROM Orders WHERE Amount > 200
);


SELECT * FROM Users
WHERE UserID IN (
	SELECT UserID FROM Orders WHERE Amount > 200
);

SELECT * FROM Users WHERE Users.Name like '%Sebastian%';

SELECT * FROM Users WHERE Name = 'Sebastian';


UPDATE Users SET Email = 'macaco3030@gmail.com' 
WHERE Name = 'Sebastian';

UPDATE Users SET Email = 'macaco4040@bhd.com'
WHERE exists (SELECT * FROM  Users WHERE Users.Name = 'Sebastian');


UPDATE Users SET Email = 'macaco@example.com' 
WHERE Name like '%Sebastian%';

DELETE FROM orders WHERE OrderDate < '2024-11-01';
select * from orders







