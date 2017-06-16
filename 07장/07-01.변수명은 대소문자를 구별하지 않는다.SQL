SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 식별자는 대소문자를 구별하지 않으므로 
REM 소문자 변수명 v_num과 대문자 변수명 V_NUM은 동일한 변수임.
REM 변수 중복 선언으로 인한 컴파일 오류 발생.
DECLARE
  v_num NUMBER ;
  V_NUM NUMBER ; -- 대소문자를 구별하지 않으므로, 위의 v_num과 중복되는 선언이다.
BEGIN
  v_num := 10 ;
  V_NUM := 20 ;
  DBMS_OUTPUT.PUT_LINE(v_num) ;
END ;
/
