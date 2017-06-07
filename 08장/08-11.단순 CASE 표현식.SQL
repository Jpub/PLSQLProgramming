SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 단순 CASE 표현식(Simple CASE expression)
DECLARE
  v_BOOL BOOLEAN := TRUE ;
  v_STR  STRING(100) ;
BEGIN
  -- 단순 CASE 표현식(Simple CASE expression)
  v_STR := CASE v_BOOL WHEN TRUE  THEN 'v_BOOL is TRUE'
                       WHEN FALSE THEN 'v_BOOL is FALSE'
                       ELSE            'v_BOOL is NULL'
           END ;
  DBMS_OUTPUT.PUT_LINE(v_STR) ;
END ;
/
