SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 구조가 동일하더라도 타입명이 다르면 할당 연산이 불가능하다.
DECLARE
  TYPE string_array1 IS TABLE OF VARCHAR2(100) ;
  TYPE string_array2 IS TABLE OF VARCHAR2(100) ;
  v_arr1 string_array1 := string_array1('사과', '수박', '망고') ;
  v_arr2 string_array2 ;
BEGIN
  v_arr2 := v_arr1 ;  -- 동일 구조이지만 타입명이 다르므로 할당 연산이 불가능하다
END ;
/
