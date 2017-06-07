SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

DECLARE
  x NUMBER := 10 ;
BEGIN
  print_boolean('x        IN (6, 8, 10)      ', x        IN (6, 8, 10)) ;
  print_boolean('x    NOT IN (6, 8, 10)      ', x    NOT IN (6, 8, 10)) ;
  print_boolean('x        IN (6, 8, 10, NULL)', x        IN (6, 8, 10, NULL)) ;
  print_boolean('NULL     IN (6, 8, 10, NULL)', NULL     IN (6, 8, 10, NULL)) ;
  print_boolean('NULL NOT IN (6, 8, 10, NULL)', NULL NOT IN (6, 8, 10, NULL)) ;
END ;
/
