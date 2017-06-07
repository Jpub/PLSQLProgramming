SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 작은 따옴표를 사용한 문자형 리터럴 선언 예제.
REM 리터럴은 줄바꿈을 포함할 수도 있다.
DECLARE
  v_str VARCHAR2(1000) ;
BEGIN
  -- 줄바꿈을 포함하는 문자형 리터럴
  v_str := '옛날에 옛날에 어느 깊은 산 속에
            할아버지와 할머니가 살고 있었어요' ;
  DBMS_OUTPUT.PUT_LINE(v_str) ;
END ;
/
