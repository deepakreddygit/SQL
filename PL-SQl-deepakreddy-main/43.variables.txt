--example 1

DECLARE
    l_total_sales NUMBER(15,2);
    l_credit_limit NUMBER (10,0);    
    l_contact_name VARCHAR2(255);
BEGIN
    NULL;
END;


-- example2

DECLARE
    l_customer_group VARCHAR2(100) := 'Silver';
BEGIN
    l_customer_group := 'Gold';
    DBMS_OUTPUT.PUT_LINE(l_customer_group);
END;

--example 3

DECLARE
    l_business_parter VARCHAR2(100) := 'Distributor';
    l_lead_for VARCHAR2(100);
BEGIN
    l_lead_for := l_business_parter; 
    DBMS_OUTPUT.PUT_LINE(l_lead_for);
END;