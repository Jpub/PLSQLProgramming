SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM TOO_MANY_ROWS 예외 처리 코드
DECLARE
  v_empno emp.empno%TYPE ;
  v_ename emp.ename%TYPE ;
BEGIN
  -- 예외 처리를 하여 프로그램이 오류 없이 정상적으로 종료된다.
  SELECT empno, ename INTO v_empno, v_ename
    FROM emp
   WHERE empno >= 7900 ;
  DBMS_OUTPUT.PUT_LINE('사번: '||v_empno||', 이름: '||v_ename) ;
EXCEPTION  -- 예외 처리
  WHEN TOO_MANY_ROWS THEN -- SELECT 되는 건이 한 건보다 많음
    DBMS_OUTPUT.PUT_LINE('조회되는 건수가 한 건보다 많습니다.') ;
END ;
/
