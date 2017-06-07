SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 예외 처리 시의 실행 결과
DECLARE
  v_value  number := 10 ;
  v_zero   number := 0 ;
  v_result number ;
BEGIN
  -- 0으로 나누기 하는 예외 발생
  v_result := v_value / v_zero ;

-- 0으로 나눔에 대한 오류를 처리
EXCEPTION WHEN ZERO_DIVIDE THEN
  DBMS_OUTPUT.PUT_LINE('0으로 나눔 예외 발생') ;
END ;
/
