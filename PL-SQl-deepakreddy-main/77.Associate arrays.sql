accept cc prompt 'Enter country code: '

DECLARE
TYPE country_tab IS TABLE OF VARCHAR2(50)
INDEX BY VARCHAR2(5);

t_country country_tab;
BEGIN

-- Populate lookup
t_country('UK') := 'United Kingdom';
t_country('US') := 'United States of America';
t_country('FR') := 'France';
t_country('DE') := 'Germany';

-- Find country name for ISO code "&cc"
DBMS_OUTPUT.PUT_LINE('ISO code "&cc" = ' || t_country(upper('&cc')));

END;
/