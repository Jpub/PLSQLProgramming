SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 레이블 다음에는 최소한 1개의 실행문이 필요하다
REM 적어도 하나의 NULL 문이라도 있어야 한다.
DECLARE
  v_num NUMBER := 0 ;
BEGIN
  IF v_num = 0 THEN
    GOTO program_end ;
  END IF ;
  
<<program_end>>
  NULL ; -- 레이블 다음에 반드시 실행문이 있어야 하는 규칙 때문에 삽입한 문장
END ;
/
