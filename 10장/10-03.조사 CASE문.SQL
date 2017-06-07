SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 조사 CASE문
DECLARE
  v_BOOL BOOLEAN := TRUE ;
  v_STR  STRING(100) ;
BEGIN
  -- 조사 CASE문(Searched CASE Statement)
  CASE WHEN v_BOOL = TRUE THEN
         v_STR := 'v_BOOL is TRUE' ;
       WHEN v_BOOL = FALSE THEN
         v_STR := 'v_BOOL is FALSE' ;
       ELSE
         v_STR := 'v_BOOL is NULL' ;
  END CASE ;
  DBMS_OUTPUT.PUT_LINE(v_STR) ;
END ;
/
