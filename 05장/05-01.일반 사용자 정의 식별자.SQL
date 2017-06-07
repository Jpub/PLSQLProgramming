SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 일반 사용자 정의 식별자의 예제
DECLARE
  c_pi     CONSTANT NUMBER := 3.14 ; -- 알파벳 식별자
  사번     VARCHAR2(30) ;            -- 한글 식별자
  v_2_by_2 NUMBER ;                  -- 숫자 사용
  v_ten$   NUMBER ;                  -- $ 문자 사용
  v_seq#   NUMBER ;                  -- # 문자 사용
BEGIN
  NULL ;
END ;
/
