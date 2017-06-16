SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM OUT 매개변수 변경의 사용
CREATE OR REPLACE PROCEDURE out_argument_proc(a_num OUT NUMBER)
IS
BEGIN
  a_num := 1 ; -- OUT 매개변수 a_num을 1로 변경했다. 호출자 측에서는 값이 어떻게 될까?
  DBMS_OUTPUT.PUT_LINE('매개변수 값을 1로 변경') ;
  RAISE_APPLICATION_ERROR(-20001, '처리되지 않은 exception 발생') ;
END ;
/

PAUSE

REM 서브 프로그램에서 예외 발생 시 OUT 매개변수의 원자성이 보장된다.
DECLARE
  v_num NUMBER ;
BEGIN
  v_num := 0 ;
  DBMS_OUTPUT.PUT_LINE('프로시저 호출 전 v_num = '||v_num) ;
  BEGIN
    out_argument_proc(v_num) ; -- 프로시저는 예외를 만나서 예외 처리기로 제어가 이동된다.
  EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
  END ;
  DBMS_OUTPUT.PUT_LINE('프로시저 호출 후 v_num = '||v_num) ; -- v_num이 변경되었을까?
END ;
/
