 -- 1 уровень сложности: В рамках БД "песочница" напишите след/запросы

-- Вывести ко-во заказов, которое компания Speedy Express доставила в Brazil.

SELECT 
	COUNT(*) AS total
FROM Orders
JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
WHERE ShipperName LIKE 'Speedy Express'
	AND Customers.Country='Brazil'

-- На какую сумму было отправлено товаров клиентам в USA

SELECT 
	SUM(Products.Price * OrderDetails.Quantity) AS total
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE Suppliers.Country='USA'
