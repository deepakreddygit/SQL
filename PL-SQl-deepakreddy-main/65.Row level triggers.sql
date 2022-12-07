--use the table customers from the sample database for the practice

--table CONTains costumer_id,name,address,website,credit_limit
CREATE OR REPLACE TRIGGER customers_credit_trg
    BEFORE UPDATE OF credit_limit  
    ON customers
DECLARE
    l_day_of_month NUMBER;
BEGIN
    -- determine the transaction type
    l_day_of_month := EXTRACT(DAY FROM sysdate);

    IF l_day_of_month BETWEEN 28 AND 31 THEN
        raise_application_error(-20100,'Cannot update customer credit from 28th to 31st');
    END IF;
END;

CREATE OR REPLACE TRIGGER customers_credit_trg
BEFORE UPDATE OF credit_limit  
    ON customers

DECLARE
    l_day_of_month NUMBER;

l_day_of_month := EXTRACT(DAY FROM sysdate);

IF l_day_of_month BETWEEN 28 AND 31 THEN
    raise_application_error(-20100,'Cannot update customer credit from 28th to 31st');
END IF;

UPDATE 
    customers 
SET 
    credit_limit = credit_limit * 110;


CREATE OR REPLACE TRIGGER 
    BEFORE UPDATE OF credit_limit 
    ON customers
    FOR EACH ROW 
    WHEN NEW.credit_limit > 10000;


CREATE OR REPLACE TRIGGER customers_update_credit_trg 
    BEFORE UPDATE OF credit_limit
    ON customers
    FOR EACH ROW
    WHEN (NEW.credit_limit > 0)
BEGIN
    -- check the credit limit
    IF :NEW.credit_limit >= 2 * :OLD.credit_limit THEN
        raise_application_error(-20101,'The new credit ' || :NEW.credit_limit || 
            ' cannot increase to more than double, the current credit ' || :OLD.credit_limit);
    END IF;
END;

CREATE OR REPLACE TRIGGER customers_update_credit_trg 

BEFORE UPDATE OF credit_limit
ON customers

FOR EACH ROW
WHEN (NEW.credit_limit > 0)

IF :NEW.credit_limit >= 2 * :OLD.credit_limit THEN
        raise_application_error(-20101,'The new credit ' || :NEW.credit_limit || 
            ' cannot increase to more than double, the current credit ' || :OLD.credit_limit);
END IF;
SELECT credit_limit 
FROM customers 
WHERE customer_id = 10;
UPDATE customers
SET credit_limit = 5000
WHERE customer_id = 10;