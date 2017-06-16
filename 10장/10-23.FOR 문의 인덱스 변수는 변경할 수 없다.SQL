SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM FOR 문의 인덱스 변수는 변경할 수 없다.
REM 다음 예제는 인덱스 변수를 변경하므로 오류를 발생시킨다.
BEGIN
  FOR idx IN 1 .. 3
  LOOP
    idx := idx + 1 ;
  END LOOP ;
END ;
/
