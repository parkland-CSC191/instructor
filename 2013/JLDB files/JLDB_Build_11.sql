DROP TABLE employees CASCADE CONSTRAINTS;
CREATE TABLE Employees (
 EMPNO               NUMBER(4),
 LNAME               VARCHAR2(20),
 FNAME               VARCHAR2(15),
 JOB                 VARCHAR2(9),
 HIREDATE            DATE,
 DEPTNO              NUMBER(2) NOT NULL,
 MTHSAL              NUMBER(7,2),
 BONUS               NUMBER(6,2),
 MGR                 NUMBER(4),
 CONSTRAINT employees_empno_PK PRIMARY KEY (EMPNO));
INSERT INTO employees VALUES (7839,'KING','BEN', 'GTECH2','17-NOV-91',10,6000,3000,NULL);
INSERT INTO employees VALUES (8888,'JONES','LARRY','MTech2','17-NOV-98',10,4200,1200,7839);
INSERT INTO employees VALUES (7344,'SMITH','SAM','GTech1','17-NOV-95',20,4900,1500,7839);
INSERT INTO employees VALUES (7355,'POTTS','JIM','GTech1','17-NOV-95',20,4900,1900,7839);
INSERT INTO employees VALUES (8844,'STUART','SUE','MTech1','17-NOV-98',10,3700,NULL,8888);
COMMIT;