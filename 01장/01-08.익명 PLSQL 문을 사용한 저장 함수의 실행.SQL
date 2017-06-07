SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 익명 PL/SQL에서 함수 실행
DECLARE
  v_cnt PLS_INTEGER ;
BEGIN
  v_cnt := get_dept_employee_count(10) ;
  DBMS_OUTPUT.PUT_LINE('사원 수: '|| v_cnt) ;
END ;
/
