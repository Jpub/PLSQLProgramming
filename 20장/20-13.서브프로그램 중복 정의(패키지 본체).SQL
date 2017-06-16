SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 서브프로그램 중복 정의
REM 패키지 본체
CREATE OR REPLACE PACKAGE BODY pkg_emp
IS
  -- 사번을 매개변수로 하는 버전
  FUNCTION emp_dept_name(a_empno NUMBER) RETURN VARCHAR2
  IS
    v_dname dept.dname%TYPE ;
  BEGIN
    SELECT dname
      INTO v_dname
      FROM emp e, dept d
     WHERE e.deptno = d.deptno
       AND e.empno = a_empno ;
    RETURN v_dname ;
  END ;
  
  -- 이름을 매개변수로 하는 버전
  FUNCTION emp_dept_name(a_ename VARCHAR2) RETURN VARCHAR2
  IS
    v_dname dept.dname%TYPE ;
  BEGIN
    SELECT dname
      INTO v_dname
      FROM emp e, dept d
     WHERE e.deptno = d.deptno
       AND e.ename = a_ename ;
    RETURN v_dname ;
  END ;
END ;
/
