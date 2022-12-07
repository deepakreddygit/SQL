--example 1

CREATE OR REPLACE PROCEDURE divide_it (
    p_numerator     IN  NUMBER,
    p_denominator   IN  NUMBER,
    p_result        OUT NUMBER
)
IS
BEGIN
    IF p_denominator = 0 THEN
        NULL;
    ELSE
        p_result := p_numerator / p_denominator;
    END IF;
END;


--example 2

DECLARE
  n_credit_status VARCHAR2( 50 );
BEGIN
  n_credit_status := 'GOOD';

  CASE n_credit_status
  WHEN 'BLOCK' THEN
    request_for_aproval;
  WHEN 'WARNING' THEN
    send_email_to_accountant;
  ELSE
    NULL;
  END CASE;
END;