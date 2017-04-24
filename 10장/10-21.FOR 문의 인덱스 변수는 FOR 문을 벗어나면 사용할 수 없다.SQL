SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM FOR 문의 인덱스 변수는 FOR 문을 벗어나면 사용할 수 없다.
REM 6번 줄에서는 변수 idx가 존재하지 않으므로 오류를 발생시킨다.
BEGIN
  FOR idx IN 1 .. 3
  LOOP
    DBMS_OUTPUT.PUT_LINE('루프 내부, idx = ' || idx) ;
  END LOOP ;
  DBMS_OUTPUT.PUT_LINE('루프 종료, idx = ' || idx) ;
END ;
/
