DECLARE
    l_msg VARCHAR2(255);
    r_customer customers%rowtype;
BEGIN
    SELECT * INTO r_customer FROM customers;
    
    EXCEPTION 
        WHEN OTHERS THEN
        l_msg := SQLERRM;  
        dbms_output.put_line(l_msg);
END;
/