SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 명세
CREATE OR REPLACE PACKAGE pkg_emp
IS
  -- 공용 타입 선언
  TYPE emp_type IS TABLE OF emp%ROWTYPE ;

  -- 공용 상수 선언
  c_deptno_accounting CONSTANT NUMBER := 10 ;
  c_deptno_research   CONSTANT NUMBER := 20 ;
  c_deptno_sales      CONSTANT NUMBER := 30 ;
  c_deptno_operations CONSTANT NUMBER := 40 ;
  
  -- 공용 변수 선언
  v_last_wage NUMBER ;
  
  -- 공용 서브프로그램 선언
  FUNCTION  get_wage(a_empno NUMBER) RETURN NUMBER ;
  PROCEDURE raise_bonus(a_empno NUMBER, a_amt NUMBER) ;
END ;
/
