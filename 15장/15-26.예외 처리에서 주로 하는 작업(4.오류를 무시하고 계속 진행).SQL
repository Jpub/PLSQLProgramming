SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 예외 처리에서 주로 하는 작업
REM 4. 오류를 무시하고 계속 진행
DECLARE
  v_name  VARCHAR2(100):= '<존재하지 않는 사원>';
BEGIN
  BEGIN
    SELECT ename INTO v_name
      FROM emp
    WHERE empno = -1;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    -- 예외 무시
    NULL ;
  END ;
  DBMS_OUTPUT.PUT_LINE('사원명 : ' || v_name) ;
END;
/
