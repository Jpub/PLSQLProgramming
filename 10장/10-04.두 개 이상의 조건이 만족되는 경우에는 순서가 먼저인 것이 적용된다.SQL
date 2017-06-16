SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 두 개 이상의 조건이 만족되는 경우에는 순서가 먼저인 것이 적용된다
DECLARE
  v_BOOL  BOOLEAN := TRUE ;
  v_TRUE  BOOLEAN := TRUE ;
  v_FALSE BOOLEAN := FALSE ;
  v_STR  STRING(100) ;
BEGIN
  CASE v_BOOL WHEN TRUE THEN
                v_STR := 'v_BOOL = TRUE'   ; -- TRUE
              WHEN v_TRUE  THEN
                v_STR := 'v_BOOL = v_TRUE' ; -- TRUE
              WHEN FALSE   THEN
                v_STR := 'v_BOOL = FALSE'  ; -- FALSE
              WHEN v_FALSE THEN
                v_STR := 'v_BOOL = v_FALSE'; -- FALSE
              ELSE
                v_STR := 'v_BOOL IS NULL' ;
  END CASE ;
  DBMS_OUTPUT.PUT_LINE(v_STR) ;
END ;
/
