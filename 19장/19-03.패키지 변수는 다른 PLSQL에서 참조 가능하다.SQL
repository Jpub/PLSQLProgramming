SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 변수는 다른 PL/SQL에서 참조 가능하다.
DECLARE
  v_var  NUMBER ;
BEGIN
  v_var := pkg_emp.get_wage(7788) ; -- pkg_emp.v_last_wage는 사번 7788의 sal이 된다.
  DBMS_OUTPUT.PUT_LINE('last wage = '||pkg_emp.v_last_wage) ;  -- 패키지 변수 참조
END ;
/
