CREATE OR REPLACE FUNCTION get_direct_reports(
      in_manager_id IN employees.manager_id%TYPE)
   RETURN SYS_REFCURSOR
AS
   c_direct_reports SYS_REFCURSOR;
BEGIN

   OPEN c_direct_reports FOR 
   SELECT 
      employee_id, 
      first_name, 
      last_name, 
      email
   FROM 
      employees 
   WHERE 
      manager_id = in_manager_id 
   ORDER BY 
         first_name,   
         last_name;

   RETURN c_direct_reports;
END;


--example 2

DECLARE
   c_direct_reports SYS_REFCURSOR;
   l_employee_id employees.employee_id%TYPE;
   l_first_name  employees.first_name%TYPE;
   l_last_name   employees.last_name%TYPE;
   l_email       employees.email%TYPE;
BEGIN
   -- get the ref cursor from function
   c_direct_reports := get_direct_reports(46); 
   
   -- process each employee
   LOOP
      FETCH
         c_direct_reports
      INTO
         l_employee_id,
         l_first_name,
         l_last_name,
         l_email;
      EXIT
   WHEN c_direct_reports%notfound;
      dbms_output.put_line(l_first_name || ' ' || l_last_name || ' - ' ||    l_email );
   END LOOP;
   -- close the cursor
   CLOSE c_direct_reports;
END;
/