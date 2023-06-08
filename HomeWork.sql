-- Выполнить расчет З/П менеджеров за весь период заказов из расчета ставки в 10%
SELECT
	Orders.EmployeeID,
    SUM(OrderDetails.Quantity * Products.Price)*0.1 AS salary
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID
JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
GROUP BY Orders.EmployeeID;

-- Вывести сотрудников, у которых ко-во заказов менее 20
SELECT
	Employees.LastName, Employees.FirstName, COUNT(OrderDetails.OrderID) AS total_order
FROM Orders
JOIN OrderDetails ON Orders.OrderID=OrderDetails.OrderID
JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
GROUP BY Orders.EmployeeID
HAVING COUNT(OrderDetails.OrderID)<20;

-- Вывести названия компаний-перевозчиков и сколько заказов каждая из них доставила
SELECT
	Shippers.ShipperName, COUNT(Orders.OrderID)AS total_order
FROM Orders
JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID
JOIN OrderDetails ON Orders.OrderID=OrderDetails.OrderID
GROUP BY Shippers.ShipperName;
 
-- Для клиентов из Mexico очистить контактные имена
UPDATE Customers 
SET ContactName = NULL
WHERE Country LIKE "Mexico";

-- Описать связи между таблицами, напр., след. образом:
-- Orders.CustomerID (M:1) Customers.CustomerID

-- "Orders"."CustomerID" (M:1) "Customers"."CustomerID"
-- "Orders"."EmployeeID" (M:1) "Employees"."EmployeeID"
-- "Orders"."ShipperID" (M:1) "Shippers"."ShipperID"
-- "Products"."SupplierID" (1:1) "Suppliers"."SupplierID"
-- "Products"."CategoryID" (1:1) "Categories"."CategoryID"
-- "OrderDetails"."OrderID" (M:M) "Orders"."OrderID"
-- "OrderDetails"."ProductID" (M:M) "Products"."OrderID"

-- https://dbdiagram.io/d/6481d0dc722eb77494a15bd6
