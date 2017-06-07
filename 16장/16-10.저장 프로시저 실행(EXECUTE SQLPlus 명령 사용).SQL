SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 저장 프로시저 실행: EXECUTE SQL*Plus 명령 사용
EXECUTE raise_salary(7788, 100)

PAUSE

REM 저장 프로시저 실행: EXEC SQL*Plus 명령은 EXECUTE의 약어임
EXEC raise_salary(7788, 100)
