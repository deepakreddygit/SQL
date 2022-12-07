--example1
SELECT *
FROM Customers
WHERE age = (
  SELECT MIN(age)
  FROM Customers
);


--example2
SELECT customer_id, first_name
FROM Customers 
WHERE customer_id IN (
  SELECT customer_id
  FROM Orders
);


--example3
SELECT DISTINCT Customers.customer_id, Customers.first_name
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id
ORDER BY Customers.customer_id;