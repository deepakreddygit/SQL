--example
DECLARE
  l_customer_name customers.name%TYPE;
BEGIN
  -- get name of the customer 100 and assign it to l_customer_name
  SELECT name INTO l_customer_name
  FROM customers
  WHERE customer_id = 100;
  -- show the customer name
  dbms_output.put_line( v_customer_name );
END;


--example
DECLARE
  r_customer customers%ROWTYPE;
BEGIN
  -- get the information of the customer 100
  SELECT * INTO r_customer
  FROM customers
  WHERE customer_id = 100;
  -- show the customer info
  dbms_output.put_line( r_customer.name || ', website: ' || r_customer.website );
END;