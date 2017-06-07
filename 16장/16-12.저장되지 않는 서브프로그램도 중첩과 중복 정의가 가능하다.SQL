SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 저장되지 않는 서브 프로그램도 중첩과 중복 정의가 가능하다.
DECLARE
  -- 저장되지 않는 프로시저 정의
  PROCEDURE print_ename(a_empno NUMBER)
  IS
    -- print_ename 내부에 중첩된 서브프로그램 정의
    FUNCTION get_ename(a_empno NUMBER) RETURN VARCHAR2
    IS
      v_ename dept.dname%TYPE ;
    BEGIN
      SELECT ENAME
        INTO v_ename
        FROM emp
       WHERE empno = a_empno ;
      RETURN v_ename ;
    END ;
  BEGIN
    dbms_output.put_line(get_ename(a_empno)) ;
  END ;
  
  -- 3번 줄의 프로시저 print_ename에 대한 중복 정의
  PROCEDURE print_ename(a_ename VARCHAR2)
  IS
  BEGIN
    dbms_output.put_line(a_ename) ;
  END ;
  
BEGIN
  print_ename(7566) ;    --  3번 줄의 print_ename 호출
  print_ename('SMITH') ; -- 21번 줄의 print_ename 호출
END ;
/
