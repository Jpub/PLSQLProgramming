SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 예외 처리에서 주로 하는 작업
REM 3. 디버깅 정보 출력
DECLARE
  v_name  VARCHAR2(100);
  v_code  NUMBER;
  v_errm  VARCHAR2(64);
BEGIN
  SELECT ename INTO v_name
    FROM emp
  WHERE empno = -1;
EXCEPTION WHEN OTHERS THEN
  v_code := SQLCODE;
  v_errm := SUBSTR(SQLERRM, 1, 64);
  DBMS_OUTPUT.PUT_LINE('오류 코드 ' || v_code || ': ' || v_errm);
END;
/
