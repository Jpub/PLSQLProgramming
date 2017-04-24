SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM EXIT WHEN 탈출문
DECLARE
  v_num NUMBER := 1 ;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('루프 내부, v_num = '||v_num) ;
    v_num:= v_num + 1 ;
    EXIT WHEN v_num > 3 ;
  END LOOP ;
  DBMS_OUTPUT.PUT_LINE('루프 종료, v_num = '||v_num) ;
END ;
/
