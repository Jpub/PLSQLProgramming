SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 표 8 4의 회색 부분의 결과 확인
DECLARE
  v_TRUE  BOOLEAN := TRUE ;
  v_FALSE BOOLEAN := FALSE ;
  v_NULL  BOOLEAN := NULL ;
BEGIN
  print_boolean('TRUE  AND NULL ', v_TRUE  AND v_NULL) ;
  print_boolean('TRUE  OR  NULL ', v_TRUE  OR  v_NULL) ;
  print_boolean('FALSE AND NULL ', v_FALSE AND v_NULL) ;
  print_boolean('FALSE OR  NULL ', v_FALSE OR  v_NULL) ;
  print_boolean('NULL  AND TRUE ', v_NULL  AND v_TRUE) ;
  print_boolean('NULL  OR  TRUE ', v_NULL  OR  v_TRUE) ;
  print_boolean('NULL  AND FALSE', v_NULL  AND v_FALSE) ;
  print_boolean('NULL  OR  FALSE', v_NULL  OR  v_FALSE) ;
END ;
/
