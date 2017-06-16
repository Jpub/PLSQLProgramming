SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 2개 이상의 조건이 만족되는 경우에는 
REM 순서적으로 먼저 나타나는 WHEN이 적용된다.
DECLARE
  v_BOOL  BOOLEAN := TRUE ;
  v_TRUE  BOOLEAN := TRUE ;
  v_FALSE BOOLEAN := FALSE ;
  v_STR  STRING(100) ;
BEGIN
  v_STR := CASE v_BOOL WHEN TRUE    THEN 'v_BOOL = TRUE'    -- TRUE
                       WHEN v_TRUE  THEN 'v_BOOL = v_TRUE'  -- TRUE
                       WHEN FALSE   THEN 'v_BOOL = FALSE'   -- FALSE
                       WHEN v_FALSE THEN 'v_BOOL = v_FALSE' -- FALSE
                       ELSE              'v_BOOL IS NULL'
           END ;
  DBMS_OUTPUT.PUT_LINE(v_STR) ;
END ;
/