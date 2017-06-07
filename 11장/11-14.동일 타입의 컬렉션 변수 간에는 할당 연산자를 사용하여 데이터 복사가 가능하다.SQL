SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 동일 타입의 컬렉션 변수 간에는 할당 연산자를 사용하여 데이터 복사가 가능하다
DECLARE
  TYPE string_array IS TABLE OF VARCHAR2(100) ;
  v_arr1 string_array ;
  v_arr2 string_array ;
  
  PROCEDURE p_print_collection_count(a_title VARCHAR2, a_coll string_array)
  IS
  BEGIN
    IF a_coll IS NULL THEN
      DBMS_OUTPUT.PUT_LINE(a_title || ': ' || '컬렉션이 NULL입니다.') ;
    ELSE
      DBMS_OUTPUT.PUT_LINE(a_title || ': ' || '컬렉션 항목이 ' || a_coll.COUNT || '건입니다.') ;
    END IF ;
  END ;
BEGIN
  v_arr1 := string_array('사과', '수박', '망고', '배') ;
  v_arr2 := v_arr1 ;  -- 컬렉션 변수 간의 할당 연산을 통한 복사
  p_print_collection_count('1. v_arr1', v_arr1) ;
  p_print_collection_count('2. v_arr2', v_arr2) ;
  
  -- NULL 할당
  v_arr2 := null ;
  p_print_collection_count('3. v_arr2', v_arr2) ;
END ;
/
