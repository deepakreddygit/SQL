set serveroutput on;
declare
sal_ach number := 2300;
tar_qty number := 2000;
emp_id number :=144;
inc number:=0;
up varchar2(3) := 'no';
begin
if (sal_ach> (tar_qty+200)) then
    inc := (sal_ach-tar_qty)/4;
    update emp set sal =sal+inc where empno=emp_id;
    up := 'yes';
end if;
dbms_output.put_line('table updated' || up ||',' ||'incentive='||inc|| '.');
end;



set serveroutput on;
declare
sal_ach number := 3600;
tar_qty number := 3000;
emp_id number :=145;
inc number :=0;
begin
if (sal_ach> (tar_qty+200)) then
inc := (sal_ach-tar_qty)/4;
else
inc :=75;
end if;
dbms_output.put_line('incentive =' || inc);
update emp set sal =sal+inc where empno=emp_id;
end;



declare
sal_ach number :=45000;
inc number :=0;
begin
if (sal_ach > 44000) then
inc := 1800;
elsif (sal_ach > 32000) then
inc := 800;
else
inc := 500;
end if;
dbms_output.put_line('sale achieved : ' || sal_ach||', incentive:' || inc||'.');
end;