SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM OTHERS 예외처리기를 사용하여 VALUE_ERROR 예외 처리
DECLARE
  v_ename emp.ename%TYPE NOT NULL := ' ';
  v_mgr   emp.mgr  %TYPE NOT NULL := -1  ;
  v_code  NUMBER;
  v_errm  VARCHAR2(64);
BEGIN
  -- 예외 처리를 하여 프로그램이 오류 없이 정상적으로 종료된다.
  SELECT ename, mgr INTO v_ename, v_mgr
    FROM emp
  WHERE ename = 'KING' ;
EXCEPTION  -- 예외 처리
  WHEN NO_DATA_FOUND THEN -- SELECT되는 건이 없음
    DBMS_OUTPUT.PUT_LINE('사원이 존재하지 않습니다.') ;
  WHEN TOO_MANY_ROWS THEN -- SELECT되는 건이 한 건보다 많음
    DBMS_OUTPUT.PUT_LINE('조회되는 건수가 한 건보다 많습니다.') ;
  WHEN OTHERS THEN -- 어떤 오류가 발생하더라도 처리한다.
    v_code := SQLCODE;
    v_errm := SUBSTR(SQLERRM, 1, 64);
    DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다.');
    DBMS_OUTPUT.PUT_LINE('오류 코드 ' || v_code || ': ' || v_errm);
END;
/
