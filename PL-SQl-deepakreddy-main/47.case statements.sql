--example1
DECLARE
  c_grade CHAR( 1 );
  c_rank  VARCHAR2( 20 );
BEGIN
  c_grade := 'B';
  CASE c_grade
  WHEN 'A' THEN
    c_rank := 'Excellent' ;
  WHEN 'B' THEN
    c_rank := 'Very Good' ;
  WHEN 'C' THEN
    c_rank := 'Good' ;
  WHEN 'D' THEN
    c_rank := 'Fair' ;
  WHEN 'F' THEN
    c_rank := 'Poor' ;
  ELSE
    c_rank := 'No such grade' ;
  END CASE;
  DBMS_OUTPUT.PUT_LINE( c_rank );
END;


--example 2
DECLARE
  n_sales      NUMBER;
  n_commission NUMBER;
BEGIN
  n_sales := 150000;
  CASE
  WHEN n_sales    > 200000 THEN
    n_commission := 0.2;
  WHEN n_sales   >= 100000 AND n_sales < 200000 THEN
    n_commission := 0.15;
  WHEN n_sales   >= 50000 AND n_sales < 100000 THEN
    n_commission := 0.1;
  WHEN n_sales    > 30000 THEN
    n_commission := 0.05;
  ELSE
    n_commission := 0;
  END CASE;

  DBMS_OUTPUT.PUT_LINE( 'Commission is ' || n_commission * 100 || '%'
  );
END;


--example3
DECLARE
  n number;
BEGIN
  CASE n
    WHEN 1 THEN dbms_output.put_line('n = 1');
    WHEN 2 THEN 
      dbms_output.put_line('n = 2');
      dbms_output.put_line('That implies n > 1');
    ELSE dbms_output.put_line('n is some other value.');
  END CASE;
END;