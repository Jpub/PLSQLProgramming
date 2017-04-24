SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 커서 매개변수를 사용한 경우
DECLARE
  v_name  emp.ename%TYPE ;
  v_empno NUMBER := 7788 ;
  
  -- 매개변수 a_empno를 가지는 명시적 커서
  CURSOR ename_cursor(a_empno NUMBER) IS
   SELECT ename
     FROM emp
    WHERE empno = a_empno ;
BEGIN
  -- 매개변수를 사용하여 커서를 OPEN한다. 매개변수 v_empno는 사번 7788이다.
  OPEN ename_cursor(v_empno) ;
  
  -- SELECT 결과를 FETCH한다.
  FETCH ename_cursor 
   INTO v_name ;
  DBMS_OUTPUT.PUT_LINE('이름 = '||v_name) ;
   
  -- 커서를 CLOSE한다.
  CLOSE ename_cursor ;
END ; 
/
