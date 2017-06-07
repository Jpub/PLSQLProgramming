SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 익명 PL/SQL 블록 내의 서브 프로그램은 데이터베이스에 저장되지 않는다.
DECLARE
  -- 저장되지 않는 함수 정의
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
    
  -- 저장되지 않는 프로시저 정의
  PROCEDURE print_ename(a_empno NUMBER)
  IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE(get_ename(a_empno)) ;
  END ;
BEGIN
  print_ename(7566) ;  
END ;
/
