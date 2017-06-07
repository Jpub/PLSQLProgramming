SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 컬렉션 간의 동치 혹은 부등 비교
DECLARE
  TYPE string_array IS TABLE OF VARCHAR2(100) ;
  v_arr1 string_array := string_array('사과', '수박', '망고', '배') ;
  v_arr2 string_array := string_array('사과', '수박', '망고', '배') ;
  v_arr3 string_array := string_array('사과', '수박' ) ;
BEGIN
  IF v_arr1 = v_arr2 THEN
    DBMS_OUTPUT.PUT_LINE('v_arr1 =  v_arr2') ;
  ELSE
    DBMS_OUTPUT.PUT_LINE('v_arr1 <> v_arr2') ;
  END IF ;
  IF v_arr1 = v_arr3 THEN
    DBMS_OUTPUT.PUT_LINE('v_arr1 =  v_arr3') ;
  ELSE
    DBMS_OUTPUT.PUT_LINE('v_arr1 <> v_arr3') ;
  END IF ;
  IF v_arr1 <> v_arr3 THEN
    DBMS_OUTPUT.PUT_LINE('v_arr1 <> v_arr3') ;
  ELSE
    DBMS_OUTPUT.PUT_LINE('v_arr1 =  v_arr3') ;
  END IF ;
END ;
/
