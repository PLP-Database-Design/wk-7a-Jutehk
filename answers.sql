--question 1
-- 1NF: Transform ProductDetail to ensure atomic values in each field
-- Assuming this is a temporary staging table before normalization

-- Create the original table
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(255)
);

-- Insert sample data
INSERT INTO ProductDetail VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

-- Create a new table for the normalized structure (1NF)
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Manually insert split records into 1NF-compliant table
-- (In production, you might use a script or stored procedure to split values)

INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (103, 'Emily Clark', 'Phone');

--question 2
-- Create a new table for Customers and Orders (no partial dependency)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create a new table for Order Items (Product depends on entire OrderID)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Orders table
INSERT INTO Orders VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert data into OrderItems table
INSERT INTO OrderItems VALUES (101, 'Laptop', 2);
INSERT INTO OrderItems VALUES (101, 'Mouse', 1);
INSERT INTO OrderItems VALUES (102, 'Tablet', 3);
INSERT INTO OrderItems VALUES (102, 'Keyboard', 1);
INSERT INTO OrderItems VALUES (102, 'Mouse', 2);
INSERT INTO OrderItems VALUES (103, 'Phone', 1);
