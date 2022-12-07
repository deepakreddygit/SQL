DECLARE
   out_of_stock EXCEPTION;
   quantity_on_hand NUMBER := 0;
   denominator NUMBER := 0;
BEGIN
   IF quantity_on_hand = 0 THEN
      RAISE out_of_stock;
   END IF;

   IF denominator = 0 THEN
      raise ZERO_DIVIDE;
   END IF;

   EXCEPTION
      WHEN out_of_stock THEN
         dbms_output.put_line('No more parts in stock.');
      WHEN ZERO_DIVIDE THEN
         dbms_output.put_line('Attempt to divide by zero.');
      WHEN OTHERS THEN
         dbms_output.put_line('Some other kind of problem...');
END;