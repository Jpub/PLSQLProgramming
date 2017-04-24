SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM WHILE LOOP 문
DECLARE
  v_num NUMBER := 1 ;
BEGIN
  WHILE v_num <= 3
  LOOP
    DBMS_OUTPUT.PUT_LINE('루프 내부, v_num = ' || v_num) ;
    v_num := v_num + 1 ;
  END LOOP ;
  DBMS_OUTPUT.PUT_LINE('루프 종료, v_num = ' || v_num) ;
END ;
/
