SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM CASE문에 나열된 선택자나 조건식 중에서 만족하는 조건이 발견되면 예외가 발생하지 않는다.
DECLARE
  v_num PLS_INTEGER := 3 ;
  v_str  STRING(100) ;
BEGIN
  -- 만족하는 조건이 발견되면 예외가 발생하지 않는다.
  CASE v_num WHEN 1 THEN
               v_str := '숫자 1' ;
             WHEN 2 THEN
               v_str := '숫자 2' ;
             WHEN 3 THEN
               v_str := '숫자 3' ; -- 만족하는 조건이 존재
             WHEN 4 THEN
               v_str := '숫자 4' ;
  END CASE;
  DBMS_OUTPUT.PUT_LINE(v_str) ;
END ;
/
