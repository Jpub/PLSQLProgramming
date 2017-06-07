SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM SIMPLE_INTEGER 데이터 타입은 속도가 가장 빠르지만
REM 오버플로우나 언더플로우를 검사하지 않는다.
DECLARE
  v_simple_int SIMPLE_INTEGER := 2147483647;  -- SIMPLE_INTEGER 타입의 가장 큰 값
BEGIN
  DBMS_OUTPUT.PUT_LINE('정수 최댓값 : ' || v_simple_int) ;
  v_simple_int := v_simple_int + 1 ; -- 오버플로우 되어 SIMPLE_INTEGER 타입의 가장 작은 값이 됨
  DBMS_OUTPUT.PUT_LINE('오버플로우  : ' || v_simple_int) ;
  v_simple_int := v_simple_int - 1 ; -- 다시 언더플로우 되어 SIMPLE_INTEGER 타입의 가장 큰 값이 됨
  DBMS_OUTPUT.PUT_LINE('언더플로우  : ' || v_simple_int) ;
END ; 
/
