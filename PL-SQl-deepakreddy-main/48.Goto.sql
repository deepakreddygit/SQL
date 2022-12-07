--example 1
BEGIN
GOTO header_message;
<<greeting_message>>
DBMS_OUTPUT.PUT_LINE( 'Hi' );
GOTO ending_message;
<<header_message>>
DBMS_OUTPUT.PUT_LINE( ' Demonstration of working of PL/ SQL GOTO statement ' );
GOTO greeting_message;
<<ending_message>>
DBMS_OUTPUT.PUT_LINE( 'Wish you all the best for your learnings...' );
end;


--example2
BEGIN
  GOTO second_message;

  <<first_message>>
  DBMS_OUTPUT.PUT_LINE( 'Hello' );
  GOTO the_end;

  <<second_message>>
  DBMS_OUTPUT.PUT_LINE( 'PL/SQL GOTO Demo' );
  GOTO first_message;

  <<the_end>>
  DBMS_OUTPUT.PUT_LINE( 'and good bye...' );

END;


--example3
DECLARE 
  n_sales NUMBER;
  n_tax NUMBER;
BEGIN 
    GOTO inside_if_statement;
    IF n_sales > 0 THEN
      <<inside_if_statement>>
      n_tax  := n_sales * 0.1;
    END IF;
END;