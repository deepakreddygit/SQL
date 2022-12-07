--use the table customers from the sample database for the practice

--table CONTains costumer_id,name,address,website,credit_limit
CREATE VIEW vw_customers AS
    SELECT 
        name, 
        address, 
        website, 
        credit_limit, 
        first_name, 
        last_name, 
        email, 
        phone
    FROM 
        customers
    INNER JOIN contacts USING (customer_id);
INSERT INTO 
    vw_customers(
        name, 
        address, 
        website, 
        credit_limit, 
        first_name, 
        last_name, 
        email, 
        phone
    )
VALUES(
    'Lam Research',
    'Fremont, California, USA', 
    'https://www.lamresearch.com/',
    2000,
    'John',
    'Smith',
    'john.smith@lamresearch.com',
    '+1-510-572-0200'
);


CREATE OR REPLACE TRIGGER new_customer_trg
    INSTEAD OF INSERT ON vw_customers
    FOR EACH ROW
DECLARE
    l_customer_id NUMBER;
BEGIN
    -- insert a new customer first
    INSERT INTO customers(name, address, website, credit_limit)
    VALUES(:NEW.NAME, :NEW.address, :NEW.website, :NEW.credit_limit)
    RETURNING customer_id INTO l_customer_id;
    
    -- insert the contact
    INSERT INTO contacts(first_name, last_name, email, phone, customer_id)
    VALUES(:NEW.first_name, :NEW.last_name, :NEW.email, :NEW.phone, l_customer_id);
END;
INSERT INTO 
        vw_customers(
            name, 
            address, 
            website, 
            credit_limit, 
            first_name, 
            last_name, 
            email, 
            phone
        )
    VALUES(
        'Lam Research',
        'Fremont, California, USA', 
        'https://www.lamresearch.com/',
        2000,
        'John',
        'Smith',
        'john.smith@lamresearch.com',
        '+1-510-572-0200'
    );
SELECT * FROM customers 
ORDER BY customer_id DESC
FETCH FIRST ROWS ONLY;

ALTER TABLE customers DISABLE ALL TRIGGERS;

ALTER TRIGGER new_customer_trg DISABLE;


ALTER TABLE customers
ENABLE ALL TRIGGERS;