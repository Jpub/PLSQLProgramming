SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON
REM 식별자를 큰따옴표로 감싸면 대소문자를 구별한다.
DECLARE
  "v_num" NUMBER ;
  "V_NUM" NUMBER ; -- 대소문자를 구별하므로, 위의 "v_num"과는 다른 선언이다.
BEGIN
  "v_num" := 10 ;
  "V_NUM" := 20 ;
  DBMS_OUTPUT.PUT_LINE("v_num") ;
END ;
/
