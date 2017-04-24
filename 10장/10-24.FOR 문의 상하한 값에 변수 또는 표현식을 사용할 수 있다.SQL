SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM FOR 문의 상/하한 값에 변수 또는 표현식을 사용할 수 있다.
DECLARE
  v_lower_value NUMBER := 0 ;
BEGIN
  FOR idx IN v_lower_value .. (v_lower_value + 2) -- 하한값은 변수, 상한값은 표현식을 사용함
  LOOP
    DBMS_OUTPUT.PUT_LINE('루프 내부, idx = ' || idx) ;
  END LOOP ;
END ;
/
