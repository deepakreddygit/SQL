CREATE VIEW aggregate AS
    SELECT
        deptno,
        MAX(sal) "MAXSAL",
        MIN(sal) "MINSAL",
        AVG(sal) "AVGSAL"
    FROM
        emp1
    GROUP BY
        deptno;

SELECT * FROM aggregate;


CREATE OR REPLACE VIEW emp_view AS
    SELECT
        empno,
        ename,
        sal,
        deptno,
        hiredate
    FROM
        emp1;

SELECT * FROM emp_view;


CREATE SEQUENCE dept_s INCREMENT BY 1 START WITH 12 MINVALUE 10 MAXVALUE 20 NOCYCLE NOCACHE;

TRUNCATE TABLE department;

desc department

INSERT INTO department VALUES (
    dept_s.NEXTVAL,
    'SALES',
    'HYDERABAD'
);

INSERT INTO department VALUES (
    dept_s.NEXTVAL,
    'REVENUE',
    'HYDERABAD'
);

SELECT * FROM department;

ALTER SEQUENCE dept_s CYCLE;

CREATE SEQUENCE roll INCREMENT BY 01 START WITH 0401 MINVALUE 01 MAXVALUE 20 NOCYCLE;

CREATE TABLE student_data (
    rollno VARCHAR2(10)
);

ALTER TABLE student_data MODIFY
    rollno VARCHAR(10);

TRUNCATE TABLE student_data

INSERT INTO student_data VALUES ( concat('19K61A', roll.NEXTVAL) );
select* from student_data
drop sequence roll;
drop table student_data