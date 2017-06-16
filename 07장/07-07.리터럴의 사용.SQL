SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 리터럴을 사용하는 프로그램 예제.
REM 리터럴 없는 프로그래밍은 거의 불가능하다.
DECLARE
  v_sum NUMBER := 0 ;
BEGIN
  FOR i IN 1..10
  LOOP
    v_sum := v_sum + i ;
  END LOOP ;
  DBMS_OUTPUT.PUT_LINE('Σ(1~10) = '||v_sum) ;
END ;
/
