SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 커서 예제
REM 다른 프로그램에서 패키지 커서 사용
BEGIN
  FOR cur IN pkg_emp.c_emp_cur
  LOOP
    DBMS_OUTPUT.PUT_LINE(cur.ename) ;
  END LOOP;
END ;
/
