SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 마지막 조건으로 ELSE를 추가하면 CASE문의 예외를 방지할 수 있다
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
             ELSE
               v_str := '알 수 없는 숫자 ' || v_num ; -- ELSE는 항상 만족되는 조건임
  END CASE;
  DBMS_OUTPUT.PUT_LINE(v_str) ;
END ;
/
