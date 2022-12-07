set serveroutput on;
declare 
type my_rec is record(field1 number, field2 varchar2(20) default 'Hello World');
my_rec1 my_rec;
my_rec2 my_rec;
begin
my_rec1.field1:=10;
my_rec1.field2:='rajkumar';
my_rec2.field1:=my_rec1.field1;
dbms_output.put_line('First record field 1 '||my_rec1.field1||'Second record field 2 '||my_rec2.field2);
end;

declare 
type studentrec is record (stu_id number(10) not null:=400, stu_name varchar2(20), stu_course varchar2(3) not null:='ece');
student1 studentrec;
student2 studentrec;
begin
student1.stu_id:=512;
student2.stu_id:=452;
student1.stu_name:='raju';
student2.stu_name:='kinuni';
student1.stu_course:='CSE';
student2.stu_course:='MEC';
dbms_output.put_line('Name od Student 1 is ' || student1.stu_name || ' Course of student 1 is '|| student1.stu_course || ' id of student 1 is '|| student1.stu_id);
dbms_output.put_line('Name od Student 2 is ' || student2.stu_name || ' Course of student 2 is '|| student2.stu_course || ' id of student 2 is '|| student2.stu_id);
end;

declare
type booksrec is record(title varchar2(10),