SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM CASE문에 나열된 선택자나 조건식 중에서 만족하는 조건이 발견되지 않으면 예외가 발생한다.
DECLARE
  v_num PLS_INTEGER := 3 ;
  v_str  STRING(100) ;
BEGIN
  -- 선택값 3을 주석 처리하면 만족하는 조건이 발견되지 않아 예외가 발생한다.
  CASE v_num WHEN 1 THEN
               v_str := '숫자 1' ;
             WHEN 2 THEN
               v_str := '숫자 2' ;
          -- WHEN 3 THEN
          --   v_str := '숫자 3' ; -- 만족하는 조건이 주석 처리되어 없어졌음
             WHEN 4 THEN
               v_str := '숫자 4' ;
  END CASE;
  DBMS_OUTPUT.PUT_LINE(v_str) ;
END ;
/
