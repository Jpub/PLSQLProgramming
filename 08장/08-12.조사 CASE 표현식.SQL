SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 조사 CASE 표현식으로 변경
DECLARE
  v_BOOL BOOLEAN := TRUE ;
  v_STR  STRING(100) ;
BEGIN
  -- 조사 CASE 표현식(Searched CASE expression)
  v_STR := CASE WHEN v_BOOL = TRUE  THEN 'v_BOOL is TRUE'
                WHEN v_BOOL = FALSE THEN 'v_BOOL is FALSE'
                ELSE                     'v_BOOL is NULL'
           END ;
  DBMS_OUTPUT.PUT_LINE(v_STR) ;
END ;
/
