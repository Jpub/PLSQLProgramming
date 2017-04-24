SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 상수는 변경할 수 없는 값이다.
REM 상수를 변경하면 오류가 발생한다.
DECLARE
  c_pi CONSTANT NUMBER := 3.14 ; -- 상수 선언
BEGIN
  c_pi := 3.1415927 ;            -- 상수를 변경하면 오류 발생
END ;
/
