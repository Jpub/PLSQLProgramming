SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM ********************* 주의 **************************************
REM 다음 코멘트 된 스크립트를 DBA 계정에서 실행하십시요.
REM 스트립트 실행 시 계정 tiger는 삭제 후 재생성됩니다.
REM 불의의 사고 방지를 위해 스크립트를 의도적으로 코멘트 처리했습니다
REM SQL*Plus를 DBA 계정으로 실행한 후
REM 문장을 Copy & Paste 방식으로 실행하십시요.
REM *****************************************************************

PAUSE

/*
--------------------------------------------------
-- DBA 계정
--------------------------------------------------
REM DBA 계정에서 실행
DROP USER tiger CASCADE ;
CREATE USER tiger IDENTIFIED BY scott ;
GRANT RESOURCE, CONNECT, CREATE SYNONYM TO tiger ;
CREATE TABLE tiger.emp AS
 SELECT *
   FROM scott.emp
  WHERE ROWNUM = 0 ;
DROP ROLE scott_role ;
CREATE ROLE scott_role ;
GRANT SELECT ON scott.emp TO scott_role ;
GRANT scott_role TO tiger ;
*/