SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM REVERSE 옵션 사용과 관계 없이 순환 범위는 
REM 반드시 하한값..상한값으로 지정해야 한다.
DECLARE
  v_cnt PLS_INTEGER ;
BEGIN
  v_cnt := 0 ;
  -- IN 하한값 .. 상한값 사용
  FOR idx IN REVERSE 1 .. 3
  LOOP
    v_cnt := v_cnt + 1 ;
  END LOOP ;
  DBMS_OUTPUT.PUT_LINE('루프 실행 횟수(1..3) : ' || v_cnt || '회') ;

  v_cnt := 0 ;
  -- IN 상한값 .. 하한값 사용
  FOR idx IN REVERSE 3 .. 1
  LOOP
    v_cnt := v_cnt + 1 ;
  END LOOP ;
  DBMS_OUTPUT.PUT_LINE('루프 실행 횟수(3..1) : ' || v_cnt || '회') ;
END ;
/
