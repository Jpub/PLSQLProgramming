SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM ****** scott 계정에 접속 ******
CONN scott/tiger

PAUSE

--------------------------------------------------
-- scott 계정
--------------------------------------------------

REM 다음 SQL을 tiger 계정에서 실행하면 성공적으로 실행됨
SELECT COUNT(*) FROM scott.emp;
