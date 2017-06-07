SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM dept 테이블 인덱스와 제약조건
CREATE UNIQUE INDEX dept_pk ON dept(deptno) ;
ALTER TABLE dept ADD CONSTRAINT dept_pk PRIMARY KEY(deptno) ;

REM emp 테이블 인덱스와 제약조건
CREATE UNIQUE INDEX emp_pk ON emp(empno) ;
ALTER TABLE emp ADD CONSTRAINT emp_pk PRIMARY KEY(empno) ;
CREATE UNIQUE INDEX emp_ename_uk ON emp(ename) ;
ALTER TABLE emp ADD CONSTRAINT emp_ename_uk UNIQUE(ename) ;

REM bonus 테이블 인덱스와 제약조건
CREATE UNIQUE INDEX bonus_pk ON bonus(ename) ;
ALTER TABLE bonus ADD CONSTRAINT bonus_pk PRIMARY KEY(ename) ;

REM salgrade 테이블 인덱스와 제약조건
CREATE UNIQUE INDEX salgrade_pk ON salgrade(grade) ;
ALTER TABLE salgrade ADD CONSTRAINT salgrade_pk PRIMARY KEY(grade) ;
