SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 할당되지 않은 VARRAY 항목은 참조할 수 없다.
DECLARE
  TYPE string_array IS VARRAY(5) OF VARCHAR2(100) ;
  v_arr string_array ;
BEGIN
  v_arr := string_array() ;
  v_arr.EXTEND(3) ;
  v_arr(1) := '사과' ; -- 정상 실행
  v_arr(2) := '배'   ; -- 정상 실행
  v_arr(3) := '망고' ; -- 정상 실행
  v_arr(4) := '수박' ; -- 할당되지 않은 항목을 참조하므로 오류 발생
END ;
/


