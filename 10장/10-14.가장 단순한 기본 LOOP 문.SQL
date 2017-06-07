SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 기본 LOOP문은 종료 조건이 반드시 필요하다.
REM 이 예제는 종료 조건이 없는 무한 FNVM로, 영원히 끝나지 않는다.
REM CTRL+C로 수행을 중단시켜야 한다
BEGIN
  LOOP -- 이 LOOP문은 종료 조건이 없는 무한 루프다. CTRL+C로 수행을 중단시켜야 한다
    NULL ;
  END LOOP ;
END ;
/
