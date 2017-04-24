SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 컬렉션과 NULL의 비교
DECLARE
  TYPE string_array IS TABLE OF VARCHAR2(100) ;
  v_arr1 string_array := string_array('사과', '수박', '망고', '배') ;
  v_arr2 string_array ;
BEGIN
  IF v_arr1 IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('v_arr1 IS NULL') ;
  ELSE
    DBMS_OUTPUT.PUT_LINE('v_arr1 IS NOT NULL') ;
  END IF ;
  IF v_arr2 IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('v_arr2 IS NOT NULL') ;
  ELSE
    DBMS_OUTPUT.PUT_LINE('v_arr2 IS NULL') ;
  END IF ;
END ;
/
