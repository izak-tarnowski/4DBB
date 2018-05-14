USE itstudies;
/*
SELECT * FROM Suppliers WHERE (SupplierId >= 10 AND SupplierId < 14);

SELECT * FROM products WHERE SupplierId IN (5,10,15,20,25);


SELECT ProductName FROM products WHERE QuantityPerUnit LIKE ('%can%') ORDER BY ProductName;
SELECT ProductName FROM products WHERE QuantityPerUnit LIKE ('%tin%') ORDER BY ProductName;
*/

SELECT ProductName, UnitPrice, UnitPrice * 1.1 as 'GST Inclusive Price' from products order by UnitPrice desc limit 3;

SELECT ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, ReorderLevel - (UnitsInStock + UnitsOnOrder) as 'Minimum Stock to Order' from products where (UnitsInStock + UnitsOnOrder < ReorderLevel);

SELECT CONCAT(SUBSTRING(UPPER(FirstName), 1, 1), '. ', LastName,' (',UPPER(Title), ')') AS 'Badge Details' from employees WHERE Title != 'Sales Representative';

SELECT CONCAT(FirstName, ' ', LastName) AS 'Full Name', DATE_FORMAT(BirthDate, '%a %d %M %Y') AS 'Birthday' from employees; 

SELECT OrderDate from orders WHERE DATE_FORMAT(OrderDate, '%M %Y') = 'May 2008' ORDER BY OrderDate ASC LIMIT 1;
SELECT OrderDate from orders WHERE DATE_FORMAT(OrderDate, '%M %Y') = 'May 2008' ORDER BY OrderDate DESC LIMIT 1;

SELECT SUM(Freight) AS 'Total Freight Cost for May' FROM orders WHERE DATE_FORMAT(OrderDate, '%M %Y') = 'May 2008';

SELECT AVG(Freight) AS 'Average Freight Cost for May' FROM orders WHERE DATE_FORMAT(OrderDate, '%M %Y') = 'May 2008';

/*
Select OrderID from orders where EmployeeId = (SELECT EmployeeID FROM employees WHERE (FirstName = 'Anne' AND LastName = 'Dodsworth')) order by OrderID ASC;

Select OrderID from orders where EmployeeId != (SELECT EmployeeID FROM employees WHERE (LastName= 'Dodsworth')) order by OrderID ASC;
*/