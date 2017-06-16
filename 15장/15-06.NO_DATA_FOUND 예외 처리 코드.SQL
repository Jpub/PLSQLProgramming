SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM NO_DATA_FOUND 예외 처리 코드
DECLARE
  v_empno emp.empno%TYPE := 1000 ;
  v_ename emp.ename%TYPE ;
BEGIN
  -- 예외 처리를 하여 프로그램이 오류 없이 정상적으로 종료된다.
  SELECT ename INTO v_ename
    FROM emp
   WHERE empno = v_empno ;
  DBMS_OUTPUT.PUT_LINE('사번 '||v_empno||'의 이름은 '||v_ename||'입니다.') ;
EXCEPTION  -- 예외 처리
  WHEN NO_DATA_FOUND THEN -- SELECT 되는 건이 없음
    DBMS_OUTPUT.PUT_LINE('사번 '||v_empno||'인 사원은 존재하지 않습니다.') ;
END ;
/
