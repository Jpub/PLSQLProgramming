SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM VALUE_ERROR 예외 미처리 코드
DECLARE
  v_ename emp.ename%TYPE NOT NULL := ' '  ;
  v_mgr   emp.mgr  %TYPE NOT NULL := -1   ;
BEGIN
  -- KING은 상급자가 NULL이므로 SELECT 시 v_mgr(NOT NULL 변수)에 NULL이 할당된다.
  -- 예외 처리를 하지 않았으므로 프로그램이 오류로 중단된다.
  SELECT ename, mgr INTO v_ename, v_mgr
    FROM emp
  WHERE ename = 'KING';
  DBMS_OUTPUT.PUT_LINE('이름은 '||v_ename||'입니다.') ;
END;
/
