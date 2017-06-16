SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 기본 예제
DECLARE
  v_name emp.ename%TYPE ;
  
  -- 명시적으로 커서를 선언
  CURSOR ename_cursor IS
   SELECT ENAME
     FROM EMP
    WHERE EMPNO = 7788 ;
BEGIN
  -- 커서를 OPEN한다.
  OPEN ename_cursor ;
  
  -- SELECT 결과를 FETCH 한다.
  FETCH ename_cursor 
   INTO v_name ;
  DBMS_OUTPUT.PUT_LINE('ENAME = '||v_name) ;
   
  -- 커서를 CLOSE한다.
  CLOSE ename_cursor ;
END ;
/
