SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM BOOLEAN 값을 출력하는 저장 함수
CREATE OR REPLACE FUNCTION boolean_string(a_boolean BOOLEAN) RETURN VARCHAR2 
IS
BEGIN
  RETURN CASE WHEN a_boolean = TRUE  THEN 'TRUE'
              WHEN a_boolean = FALSE THEN 'FALSE'
              WHEN a_boolean IS NULL THEN 'NULL'
         END ;
END ;
/
