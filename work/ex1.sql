-- @Author: Izak Tarnowski
-- @Date: 21 02 2018
-- @Title: MyExercises, 4DBB_ex1.

DROP DATABASE IF EXISTS MyExercises;
CREATE DATABASE MyExercises;
USE MyExercises;

DROP TABLE IF EXISTS categories;
CREATE TABLE categories(
	CategoryId INT NOT NULL AUTO_INCREMENT,
	CategoryName VARCHAR(20) NOT NULL,
	Description TEXT DEFAULT NULL,
	PRIMARY KEY (CategoryId));

CREATE TABLE dateTimeExample(
	idate DATETIME NOT NULL DEFAULT 20180221,
    PRIMARY KEY (idate)
    );
    
INSERT INTO dateTimeExample(idate) 
	VALUES ('20180221');
    
SELECT * FROM dateTimeExample;

INSERT INTO categories(CategoryName, Description)
	VALUES ('Beverages', 'Soft drinks, coffees, teas, beers and ales');
INSERT INTO categories(CategoryName, Description)
	VALUES ('Condiments', 'Sweet and Savory sauces');
INSERT INTO categories(CategoryName, Description)
	VALUES ('Confections', 'Deserts, candies and sweet breads');
INSERT INTO categories(CategoryName, Description)
	VALUES ('Dairy Products', 'Cheese, milk and cream');
    
#SELECT * FROM categories;

DROP TABLE IF EXISTS suppliers;
CREATE TABLE suppliers(
    SupplierId INT NOT NULL AUTO_INCREMENT,
	City VARCHAR(20) DEFAULT NULL,
    CompanyName VARCHAR(30) NOT NULL,
    PRIMARY KEY (SupplierId)
);

INSERT INTO suppliers(CompanyName, City)
	VALUES ('Exotic Liquids', 'London');
INSERT INTO suppliers(CompanyName, City)
	VALUES ('New Orleans Cajun Delights', null);
INSERT INTO suppliers(CompanyName, City)
	VALUES ('Grandma Kelly''s Homestead', 'Adelaide');
INSERT INTO suppliers(CompanyName, City)
	VALUES ('Tokyo Traders', null);

# SELECT * FROM suppliers;

DROP TABLE IF EXISTS products;
CREATE TABLE products(
    ProductId INT NOT NULL AUTO_INCREMENT,
	CategoryId INT DEFAULT NULL,
    SupplierId INT DEFAULT NULL,
    ProductName VARCHAR(40) NOT NULL,
    UnitPrice DECIMAL(5,2) DEFAULT NULL,
    UnitsInStock SMALLINT DEFAULT NULL,
    FOREIGN KEY (SupplierId) REFERENCES suppliers(SupplierId),
    FOREIGN KEY (CategoryId) REFERENCES categories(CategoryId),
    PRIMARY KEY (ProductId)
);

INSERT INTO products(ProductName, SupplierId, CategoryId, UnitPrice, UnitsInStock)
	VALUES ('Chai', '1', '1', '18', '39');
INSERT INTO products(ProductName, SupplierId, UnitPrice, UnitsInStock)
	VALUES ('Chang', '1', '19', '17');
INSERT INTO products(ProductName, CategoryId, UnitPrice, UnitsInStock)
	VALUES ('Ani Seed Syrup', '2', '10', '13');
INSERT INTO products(ProductName, SupplierId, CategoryId, UnitPrice)
	VALUES ('Chef Anton''s Cajun Seasoning', '2', '2', '22');
INSERT INTO products(ProductName, SupplierId, CategoryId, UnitsInStock)
	VALUES ('Chef Anton''s Gumbo Mix', '2', '2', '0');
INSERT INTO products(ProductName, SupplierId, CategoryId)
	VALUES ('Grandma''s Boysenberry Spread', '3', '2');
INSERT INTO products(ProductName, CategoryId, UnitPrice, UnitsInStock)
	VALUES ('Uncle Bob''s Organic Dried Pears', '4', '30', '15');
INSERT INTO products(ProductName, SupplierId, UnitPrice, UnitsInStock)
	VALUES ('Northwood''s Cranberry Sauce', '4', '40', '6');
    
SELECT ProductName, UnitPrice FROM products ORDER BY UnitPrice DESC;
   
   /*
   
    #-- Extra optional queries -#
INSERT INTO products(ProductName, SupplierId, CategoryId, UnitPrice, UnitsInStock)
	VALUES ('Uncle Bob''s Organic Dried Pears', '5', '4', '30', '15');
INSERT INTO products(ProductName, SupplierId, CategoryId, UnitPrice, UnitsInStock)
	VALUES ('Northwood''s Cranberry Sauce', '4', '5', '40', '6');
    
    # these two calues cannot be added, no such categoryId found. # 
    # in Java's words, ArrayOutOfBoundsException. #
    
    # To make these work, we need to fix the incorrect values or nullify the value, eg
    # INSERT INTO products(ProductName, SupplierId, CategoryId, UnitPrice, UnitsInStock)
	#	 VALUES ('Uncle Bob''s Organic Dried Pears', null, '4', '30', '15');
    # INSERT INTO products(ProductName, SupplierId, CategoryId, UnitPrice, UnitsInStock)
	#	 VALUES ('Northwood''s Cranberry Sauce', '4', null, '40', '6');
					---------------- OR -----------------
    # INSERT INTO products(ProductName, CategoryId, UnitPrice, UnitsInStock)
	#	 VALUES ('Uncle Bob''s Organic Dried Pears', '4', '30', '15');
    # INSERT INTO products(ProductName, SupplierId, UnitPrice, UnitsInStock)
	#	 VALUES ('Northwood''s Cranberry Sauce', '4', '40', '6');

	*/