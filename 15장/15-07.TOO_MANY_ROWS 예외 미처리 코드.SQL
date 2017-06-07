SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM TOO_MANY_ROWS 예외 미처리 코드
DECLARE
  v_empno emp.empno%TYPE ;
  v_ename emp.ename%TYPE ;
BEGIN
  -- 예외 처리를 하지 않았으므로 프로그램이 오류로 중단된다.
  SELECT empno, ename INTO v_empno, v_ename
    FROM emp
   WHERE empno >= 7900 ;
  DBMS_OUTPUT.PUT_LINE('사번: '||v_empno||', 이름: '||v_ename) ;
END ;
/
