SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM GOTO 탈출문
DECLARE
  v_num NUMBER := 1 ;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('루프 내부, v_num = '||v_num) ;
    v_num:= v_num + 1 ;
    IF v_num > 3 THEN
      GOTO end_loop ;
    END IF ;
  END LOOP ;
  << end_loop >>
  DBMS_OUTPUT.PUT_LINE('루프 종료, v_num = '||v_num) ;
END ;
/
