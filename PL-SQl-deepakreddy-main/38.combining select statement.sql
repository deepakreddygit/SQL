The UNION operator is used to combine the result-set of two or more SELECT statements.

--example
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

--example
SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;