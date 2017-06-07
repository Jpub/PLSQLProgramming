SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 레이블의 사용
DECLARE
  v_num NUMBER := 0 ;
BEGIN
  IF v_num = 0 THEN
    GOTO block_label ; -- 뒤따르는 블록 레이블로 이동
  END IF ;
  
  <<block_label>>  -- BLOCK에 대한 레이블
  BEGIN
    IF v_num = 0 THEN
      GOTO statement_label ; -- 뒤따르는 문장 레이블로 이동
    END IF ;
    
    <<statement_label>>  -- 문장(실행문)에 대한 레이블
    v_num := v_num + 1 ;
    
    IF v_num = 0 THEN
      GOTO statement_label ; -- 앞에 위치한 문장 레이블로 이동
    END IF ;
  END ;
  
  IF v_num = 0  THEN
    GOTO block_label ; -- 앞에 위치한 블록 레이블로 이동
  END IF ;
END ;
/
