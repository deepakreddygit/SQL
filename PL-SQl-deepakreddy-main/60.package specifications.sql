----example 1
CREATE OR REPLACE PACKAGE BODY cust_sal AS  
   
   PROCEDURE find_sal(c_id customers.id%TYPE) IS 
   c_sal customers.salary%TYPE; 
   BEGIN 
      SELECT salary INTO c_sal 
      FROM customers 
      WHERE id = c_id; 
      dbms_output.put_line('Salary: '|| c_sal); 
   END find_sal; 
END cust_sal; 

DECLARE 
   code customers.id%type := &cc_id; 
BEGIN 
   cust_sal.find_sal(code); 
END; 

--example 2

CREATE PACKAGE citi AS
    FUNCTION p_strng RETURN VARCHAR2; 
END citi; 

CREATE OR REPLACE PACKAGE BODY citi AS

  FUNCTION p_strng RETURN VARCHAR2 IS
    BEGIN  
      RETURN 'Software Testing Help!';
    END p_strng;  
END citi; 
BEGIN
  DBMS_OUTPUT.PUT_LINE (citi.p_strng);
END;