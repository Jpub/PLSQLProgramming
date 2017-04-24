SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM CLOB과 VARCHAR2가 완전히 호환되지는 않는다.
REM 32767바이트 길이의 한계가 존재하고, 일부 호환되지 않는 함수가 있다.
DECLARE
  v_varchar2 VARCHAR2(32767) ;
  v_clob     CLOB ;
BEGIN
  -- 크기가 32768인 CLOB을 생성한다.
  v_clob := RPAD('A', 32767, 'A') || '$' ;
  -- 길이를 128K로 늘린다.
  v_clob := v_clob || v_clob || v_clob || v_clob ;
  
  -- 일부 내장 함수는 길이 32767바이트 이상의 CLOB에서 정상 동작한다.
  v_clob     := REPLACE(v_clob, 'A', 'B') ; -- 정상
  v_clob     := TRIM(v_clob) ;              -- 정상
  
  -- 32767바이트를 초과하는 CLOB을 VARCHAR2 타입에 복사할 수 없다.
  BEGIN
    v_varchar2 := v_clob ;                    -- 오류
  EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('오류 발생(1): '||SQLERRM) ; -- 오류 메시지 출력
  END ;
  
  -- 일부 내장 함수는 길이 32767바이트 이상의 CLOB에서 오류가 발생한다.
  BEGIN
    v_varchar2 := SUBSTR(v_clob, 1, 32768) ;  -- 오류
  EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('오류 발생(2): '||SQLERRM) ; -- 오류 메시지 출력
  END ;
  BEGIN
    v_clob     := INITCAP(v_clob) ;           -- 오류
  EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('오류 발생(3): '||SQLERRM) ; -- 오류 메시지 출력
  END ;
END ;
/
