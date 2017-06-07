SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 오류번호 20001를 예외명 user_defined_exception과 연결
DECLARE
  user_defined_exception EXCEPTION;                      -- 사용자 지정 예외
  PRAGMA EXCEPTION_INIT(user_defined_exception, -20001); -- ORA-20001과 연결
BEGIN
  RAISE_APPLICATION_ERROR(-20001, '사용자 지정 예외') ;
EXCEPTION
  WHEN user_defined_exception THEN
    DBMS_OUTPUT.PUT_LINE('사용자 지정 예외 user_defined_exception이 검출되었습니다.') ;
    DBMS_OUTPUT.PUT_LINE('SQLCODE = ' || SQLCODE) ;
END;
/
