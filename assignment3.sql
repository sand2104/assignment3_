-----------------PART1--------------------------
CREATE DATABASE ExerciseDb;

USE ExerciseDb;

--CompanyInfo table
CREATE TABLE CompanyInfo (
    CId INT PRIMARY KEY,
    CName VARCHAR(100)
);

--CompanyInfo
INSERT INTO CompanyInfo (CId, CName)
VALUES
    (1, 'SamSung'),
    (2, 'HP'),
    (3, 'Apple'),
    (4, 'Dell'),
    (5, 'Toshiba'),
    (6, 'Redmi');

--ProductInfo table
CREATE TABLE ProductInfo (
    PId INT PRIMARY KEY,
    PName VARCHAR(100),
    PPrice DECIMAL(10, 2),
    PMDate DATE,
    CId INT,
    FOREIGN KEY (CId) REFERENCES CompanyInfo(CId)
);

--ProductInfo
INSERT INTO ProductInfo (PId, PName, PPrice, PMDate, CId)
VALUES
    (101, 'Laptop', 55000.90, '2023-12-12', 1),
    (102, 'Laptop', 35000.90, '2012-12-12', 2),
    (103, 'Mobile', 15000.90, '2012-12-03', 2),
    (104, 'Laptop', 135000.90, '2012-12-12', 3),
    (105, 'Mobile', 65000.90, '2012-12-12', 3),
    (106, 'Laptop', 35000.90, '2012-12-12', 5),
    (107, 'Mobile', 35000.90, '2012-01-12', 5),
    (108, 'Earpod', 1000.90, '2022-01-12', 3),
    (109, 'Laptop', 85000.90, '2021-12-12', 6),
    (110, 'Mobile', 55000.70, '2020-12-12', 1);

--Q1:

SELECT ci.CName AS CompanyName, pi.PName AS ProductName, pi.PPrice, pi.PMDate
FROM CompanyInfo ci
JOIN ProductInfo pi ON ci.CId = pi.CId;

--Q2:

SELECT pi.PName AS ProductName, ci.CName AS CompanyName, pi.PPrice, pi.PMDate
FROM ProductInfo pi
JOIN CompanyInfo ci ON pi.CId = ci.CId;

--Q3:

SELECT ci.CName AS CompanyName, pi.PName AS ProductName
FROM CompanyInfo ci
CROSS JOIN ProductInfo pi;

----------------- PART2---------------------

CREATE TABLE Products (
PId INT PRIMARY KEY,
PQ INT,
PPrice DECIMAL(10, 2),
Discount DECIMAL(5, 2)
)

INSERT INTO Products (PId, PQ, PPrice, Discount)
VALUES
(1, 3, 160.00, 30.00),
(2, 9, 280.00, 45.00),
(3, 7, 350.00, 65.00)

SELECT PId,PQ,PPrice,Discount, 
PPrice * PQ AS TotalPrice,
PPrice * PQ - (PPrice * PQ * Discount / 100) AS PriceAfterDiscount
FROM Products