--example1
declare
a number(2);
begin
for a in 10 .. 20 loop
if (a=15) then
continue;
else
dbms_output.put_line('value of a is '||a);
end if;
end loop;
end;


--example2
declare
n number := 1;
begin
for n in 1 .. 10 loop
continue
when mod(n,2) =0;
dbms_output.put_line(n);
end loop;
end;