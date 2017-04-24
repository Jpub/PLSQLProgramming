SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 값이 할당되지 않은 Associative Array 항목은 참조할 수 없다.
DECLARE
  TYPE int_array IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
  v_arr int_array ;
BEGIN
  v_arr(-1) := -1 ;
  v_arr( 1) :=  1 ;
  DBMS_OUTPUT.PUT_LINE('v_arr(-1) = '||v_arr(-1)) ; -- 정상
  DBMS_OUTPUT.PUT_LINE('v_arr( 1) = '||v_arr( 1)) ; -- 정상
  DBMS_OUTPUT.PUT_LINE('v_arr( 0) = '||v_arr( 0)) ; -- 오류 발생
END ;
/
