SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 예외 미처리 시의 실행 결과
DECLARE
  v_value  number := 10 ;
  v_zero   number := 0 ;
  v_result number ;
BEGIN
  -- 0으로 나누기 하는 예외 발생
  v_result := v_value / v_zero ;
END ;
/
