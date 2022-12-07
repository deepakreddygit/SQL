When a table is mutating, it is changing. If the changing is taking place and you try to make another change in the middle of the first change, Oracle will issue a mutating table error with the error code ORA-04091.

Specifically, the error results from the following operations:

First, you update data to a table.
Second, a row-level trigger associated with the table automatically fires and makes another change to the table.

CREATE OR REPLACE TRIGGER customers_credit_policy_trg 
    AFTER INSERT OR UPDATE 
    ON customers
    FOR EACH ROW 
DECLARE 
    l_max_credit   customers.credit_limit%TYPE; 
BEGIN 
    -- get the lowest non-zero credit 
    SELECT MIN (credit_limit) * 5 
        INTO l_max_credit 
        FROM customers
        WHERE credit_limit > 0;
    
    -- check with the new credit
    IF l_max_credit < :NEW.credit_limit 
    THEN 
        UPDATE customers 
        SET credit_limit = l_max_credit 
        WHERE customer_id = :NEW.customer_id; 
    END IF; 
END;
/
UPDATE customers
SET credit_limit = 12000
WHERE customer_id = 1;




--Fixing the mutating table error

CREATE OR REPLACE TRIGGER customers_credit_policy_trg    
    FOR UPDATE OR INSERT ON customers    
    COMPOUND TRIGGER     
    TYPE r_customers_type IS RECORD (    
        customer_id   customers.customer_id%TYPE, 
        credit_limit  customers.credit_limit%TYPE    
    );    

    TYPE t_customers_type IS TABLE OF r_customers_type  
        INDEX BY PLS_INTEGER;    

    t_customer   t_customers_type;    

    AFTER EACH ROW IS    
    BEGIN  
        t_customer (t_customer.COUNT + 1).customer_id :=    
            :NEW.customer_id;    
        t_customer (t_customer.COUNT).credit_limit := :NEW.credit_limit;
    END AFTER EACH ROW;    

    AFTER STATEMENT IS    
        l_max_credit   customers.credit_limit%TYPE;    
    BEGIN      
        SELECT MIN (credit_limit) * 5    
            INTO l_max_credit    
            FROM customers
            WHERE credit_limit > 0;

        FOR indx IN 1 .. t_customer.COUNT    
        LOOP                                      
            IF l_max_credit < t_customer (indx).credit_limit    
            THEN    
                UPDATE customers    
                SET credit_limit = l_max_credit    
                WHERE customer_id = t_customer (indx).customer_id;    
            END IF;    
        END LOOP;    
    END AFTER STATEMENT;    
END; 
