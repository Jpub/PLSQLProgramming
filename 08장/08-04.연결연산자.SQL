SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello, ' || 'World!') ;
  DBMS_OUTPUT.PUT_LINE('Hello, ' || NULL || 'World!') ; --> NULL에 대한 연결 연산은 무시됨
  DBMS_OUTPUT.PUT_LINE(24 || ' 시간') ;       --> 숫자 24를 문자로 묵시적 변환 후 연결
  DBMS_OUTPUT.PUT_LINE(CONCAT(24, ' 시간')) ; --> 숫자 24를 문자로 묵시적 변환 후 연결
END ;
/
