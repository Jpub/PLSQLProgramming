SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM DECLARE 절의 변수 idx와 FOR 문의 인덱스 변수 idx는 서로 다른 변수이다.
DECLARE
  idx NUMBER := 0 ;
BEGIN
  FOR idx IN 1 .. 3
  LOOP
    DBMS_OUTPUT.PUT_LINE('루프 내부, idx = ' || idx) ;
  END LOOP ;
  DBMS_OUTPUT.PUT_LINE('루프 종료, idx = ' || idx) ;
END ;
/
