SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 한 줄짜리 프로그램
REM 한 줄에 2개의 이상의 문장이 오더라도 문법적으로 아무 문제가 없다.

BEGIN DBMS_OUTPUT.PUT_LINE('Hello, ') ; DBMS_OUTPUT.PUT_LINE('World!') ; END ;
/
