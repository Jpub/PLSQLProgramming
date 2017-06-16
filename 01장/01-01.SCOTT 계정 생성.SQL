SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM ********************* 주의 **************************************
REM 다음 코멘트 된 스크립트를 DBA 계정에서 실행하십시요.
REM SQL*Plus를 DBA 계정으로 실행한 후
REM 문장을 Copy & Paste 방식으로 실행하십시요.
REM Ctrl+C를 눌러서 스크립트를 종료하십시요.
REM *****************************************************************

PAUSE

/*
REM DBA로 접속하여 scott 계정 생성
sqlplus / as sysdba

REM scott 계정 생성
CREATE USER scott IDENTIFIED BY tiger ;
ALTER USER scott DEFAULT TABLESPACE USERS ;
ALTER USER scott QUOTA UNLIMITED ON USERS ;
GRANT RESOURCE,CONNECT TO scott ;
*/