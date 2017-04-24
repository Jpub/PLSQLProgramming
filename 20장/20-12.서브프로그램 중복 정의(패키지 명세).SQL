SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 서브프로그램 중복 정의
REM 패키지 명세
CREATE OR REPLACE PACKAGE pkg_emp
IS
  FUNCTION emp_dept_name(a_empno NUMBER  ) RETURN VARCHAR2 ; -- 사번을 매개변수로 하는 버전
  FUNCTION emp_dept_name(a_ename VARCHAR2) RETURN VARCHAR2 ; -- 이름을 매개변수로 하는 버전
END ;
/
