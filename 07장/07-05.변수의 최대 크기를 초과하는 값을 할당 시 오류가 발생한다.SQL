SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 문자열 변수에 선언된 크기를 초과하는 문자열을 할당하면 오류 발생
DECLARE
  v_vc VARCHAR2(2) ; -- 최대 2바이트
BEGIN
  v_vc := 'ABC' ; -- 최대 크기가 2바이트인 변수에 크기가 3바이트인 문자열을 할당
END ;
/
