SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

DECLARE
  x NUMBER := 10 ;
BEGIN
  print_boolean('x(10)     BETWEEN    5 AND 15  ', x     BETWEEN    5 AND 15) ;
  print_boolean('x(10) NOT BETWEEN    5 AND 15  ', x NOT BETWEEN    5 AND 15) ;
  print_boolean('x(10)     BETWEEN   15 AND  5  ', x     BETWEEN   15 AND  5) ;
  print_boolean('x(10)     BETWEEN NULL AND 10  ', x     BETWEEN NULL AND 10) ;
  print_boolean('x(10) NOT BETWEEN NULL AND 10  ', x NOT BETWEEN NULL AND 10) ;
  print_boolean('x(10)     BETWEEN    5 AND NULL', x     BETWEEN    5 AND NULL) ;
  print_boolean('x(10) NOT BETWEEN    5 AND NULL', x NOT BETWEEN    5 AND NULL) ;
  print_boolean('NULL      BETWEEN    5 AND 10  ', NULL  BETWEEN    5 AND 10) ;
END ;
/
