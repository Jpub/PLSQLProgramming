SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM NULL 여부 확인에는 IS NULL 연산을 사용해야 한다.
DECLARE
  x VARCHAR2(10) ;
  y NUMBER ;
BEGIN
  x := NULL ; print_boolean('NULL IS NULL    '  , x IS NULL) ;
  x := NULL ; print_boolean('NULL IS NOT NULL'  , x IS NOT NULL) ;
  x := '' ;   print_boolean(''''' IS NULL      ', x IS NULL) ;
  x := ' ' ;  print_boolean(''' '' IS NULL     ', x IS NULL) ;
  x := NULL ; print_boolean('NULL = NULL     '  , x = NULL) ;
  x := NULL ; print_boolean('NULL <> NULL    '  , x <> NULL) ;
  y := 0 ;    print_boolean('0 IS NULL       '  , y IS NULL) ;
END ;
/
