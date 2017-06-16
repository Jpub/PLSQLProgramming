SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 컬렉션 생성자
DECLARE
  TYPE string_array IS TABLE OF VARCHAR2(100) ;
  v_arr1 string_array := string_array() ; -- 변수 선언 시 빈 컬렉션으로 초기화
  v_arr2 string_array ;
BEGIN
  -- 실행 시 네 개의 항목을 가지는 컬렉션으로 초기화
  v_arr2 := string_array('사과', '수박', '망고', '배') ;
  DBMS_OUTPUT.PUT_LINE('v_arr1.COUNT = '||v_arr1.COUNT) ;
  DBMS_OUTPUT.PUT_LINE('v_arr2.COUNT = '||v_arr2.COUNT) ;
END ;
/
