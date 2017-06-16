SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM get_wage 함수와 get_wage_proc 프로시저의 사용
DECLARE
  v_amt NUMBER ;
BEGIN
  v_amt := get_wage(7788) ;    -- 함수 버전
  get_wage_proc(7788, v_amt) ; -- 프로시저 버전
END ;
/
