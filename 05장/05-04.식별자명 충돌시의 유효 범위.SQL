SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 동일한 이름의 변수 v_num이 두 곳에서 선언되었는데,
REM 두 개의 변수 v_num은 서로 다른 유효범위를 가지는 별개의 변수로 인식된다.
DECLARE -- 메인 블록
  v_num NUMBER := 0;
BEGIN
  DECLARE -- 중첩된 블록
    v_num NUMBER ; -- 메인 블록에서와 동일한 이름의 변수 선언
  BEGIN
    v_num := 4 ; -- 5번 줄에 선언된 변수 v_num을 참조
  END ;
  v_num := v_num + 1 ; -- 2번 줄에 선언된 v_num을 참조
END ;
/
