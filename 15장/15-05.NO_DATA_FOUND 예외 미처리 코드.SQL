SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM NO_DATA_FOUND 예외 미처리 코드
DECLARE
  v_empno emp.empno%TYPE := 1000 ;
  v_ename emp.ename%TYPE ;
BEGIN
  -- 예외 처리를 하지 않았으므로 프로그램이 오류로 중단된다.
  SELECT ename INTO v_ename
    FROM emp
   WHERE empno = v_empno ;
  DBMS_OUTPUT.PUT_LINE('사번 '||v_empno||'의 이름은 '||v_ename||'입니다.') ;
END ;
/
