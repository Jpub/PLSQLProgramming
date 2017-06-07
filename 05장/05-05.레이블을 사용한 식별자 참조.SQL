SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 레이블을 사용하여 바깥 블럭의 변수를 참조
<<OUTER_BLOCK>>  -- 레이블(Label)
DECLARE
  v_num NUMBER := 0 ;
BEGIN
  DECLARE
    v_num NUMBER ;
  BEGIN
    v_num := 1 ;             -- 6번 줄에 선언된 변수 v_num을 변경시킨다.
    OUTER_BLOCK.v_num := 2 ; -- 3번 줄에 선언된 변수 v_num을 변경시킨다.
  END ;
  DBMS_OUTPUT.PUT_LINE('v_num = '||v_num) ; -- 3번 줄에 선언된 변수 v_num의 값을 출력한다.
END ;
/
