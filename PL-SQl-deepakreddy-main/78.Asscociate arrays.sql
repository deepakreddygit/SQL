DECLARE
    -- declare a cursor that return customer name
    CURSOR c_customer IS 
        SELECT name 
        FROM customers
        ORDER BY name 
        FETCH FIRST 10 ROWS ONLY;
    -- declare a nested table type   
    TYPE t_customer_name_type 
        IS TABLE OF customers.name%TYPE;
    
    -- declare and initialize a nested table variable
    t_customer_names t_customer_name_type := t_customer_name_type(); 
    
BEGIN
    -- populate customer names from a cursor
    FOR r_customer IN c_customer 
    LOOP
        t_customer_names.EXTEND;
        t_customer_names(t_customer_names.LAST) := r_customer.name;
    END LOOP;
    
    -- display customer names
    FOR l_index IN t_customer_names.FIRST..t_customer_names.LAST 
    LOOP
        dbms_output.put_line(t_customer_names(l_index));
    END LOOP;
END;