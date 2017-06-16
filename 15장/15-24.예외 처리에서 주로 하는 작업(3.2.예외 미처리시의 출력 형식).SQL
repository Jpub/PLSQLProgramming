SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 예외 처리에서 주로 하는 작업
REM 3. 디버깅 정보 출력
REM 예외 미처리시의 출력 형식
DECLARE
  PROCEDURE p IS
  BEGIN
    raise_application_error(-20001, '사용자 지정 예외') ;
  END ;
BEGIN
  p ;
END ;
/
