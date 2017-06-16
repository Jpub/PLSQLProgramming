SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 단순 CASE문
DECLARE
  v_BOOL BOOLEAN := TRUE ;
  v_STR  STRING(100) ;
BEGIN
  -- 단순 CASE문(Simple CASE Statement)
  CASE v_BOOL WHEN TRUE THEN
                v_STR := 'v_BOOL is TRUE' ;
              WHEN FALSE THEN
                v_STR := 'v_BOOL is FALSE' ;
              ELSE
                v_STR := 'v_BOOL is NULL' ;
  END CASE ;
  DBMS_OUTPUT.PUT_LINE(v_STR) ;
END ;
/
