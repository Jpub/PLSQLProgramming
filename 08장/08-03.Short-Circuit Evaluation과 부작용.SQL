SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM Short-Circuit Evaluation의 부작용으로
REM 올바르지 못한 연산을 사전에 발견하지 못할 수 있다.
DECLARE
  x NUMBER := 1 ;
  y NUMBER := 2 ;
  z NUMBER := 0 ;
BEGIN
  -- "TRUE or ?"이므로 "y / z = 0"이 평가되지 않아서 오류가 발생하지 않음
  IF x = 1 OR y / z = 0 THEN
    DBMS_OUTPUT.PUT_LINE('x = 0 OR y / z = 0') ;
  END IF ;
  
  -- 이번에는 "FALSE or ?"이므로 "y / z = 0"이 평가되어 "ORA-01476: 제수가 0 입니다"가 발생
  x := 2 ;
  IF x = 1 OR y / z = 0 THEN  --> 여기에서 ORA-01476 오류 발생
    DBMS_OUTPUT.PUT_LINE('x = 0 OR y / z = 0') ;
  END IF ;
END ;
/
