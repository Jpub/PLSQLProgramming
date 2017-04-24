SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 저장 함수 실행: PL/SQL문에서 사용
DECLARE
  v_wage  NUMBER ;
  v_wage2 NUMBER ;
BEGIN
  -- r-value로 사용
  v_wage := get_wage(7654) ;

  -- 표현식에 사용
  v_wage2 := 100 + get_wage(7654) ;
  
  DBMS_OUTPUT.PUT_LINE('급여: ' || get_wage(7654)) ;
END ;
/
