SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 기본 예제
DECLARE
  v_name emp.ename%TYPE ;
BEGIN
  -- 묵시적 커서
  SELECT ename
    INTO v_name
    FROM emp
   WHERE empno = 7788 ;
  
  DBMS_OUTPUT.PUT_LINE('ENAME = '||v_name) ;
END ; 
/
