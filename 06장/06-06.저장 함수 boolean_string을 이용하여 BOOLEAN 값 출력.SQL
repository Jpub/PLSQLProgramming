SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 저장 함수 boolean_string을 이용하여 BOOLEAN 값 출력
BEGIN
  DBMS_OUTPUT.PUT_LINE('TRUE : '||boolean_string(TRUE)) ;
  DBMS_OUTPUT.PUT_LINE('FALSE: '||boolean_string(FALSE)) ;
  DBMS_OUTPUT.PUT_LINE('NULL : '||boolean_string(NULL)) ;
  DBMS_OUTPUT.PUT_LINE('1=1  : '||boolean_string(1=1)) ;
  DBMS_OUTPUT.PUT_LINE('1=2  : '||boolean_string(1=2)) ;
END ;
/
