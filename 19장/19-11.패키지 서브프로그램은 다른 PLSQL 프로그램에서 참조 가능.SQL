SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 서브프로그램은 다른 PL/SQL 프로그램에서 참조 가능
DECLARE
  v_var  NUMBER ;
BEGIN
  v_var := pkg_emp.get_wage(7788) ;
  DBMS_OUTPUT.PUT_LINE('last wage = '||pkg_emp.v_last_wage) ;
END ;
/
