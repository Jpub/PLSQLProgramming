SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM ****** SCOTT 계정에 접속 ******
CONN SCOTT/TIGER

PAUSE

--------------------------------------------------
-- SCOTT 계정
--------------------------------------------------

REM scott 계정에서 실행
REM 함수 count_auth_definer를 계정 scott에서 실행
SELECT count_auth_definer() FROM dual ;

PAUSE

REM ****** TIGER 계정에 접속 ******
CONN TIGER/SCOTT

PAUSE

--------------------------------------------------
-- TIGER 계정
--------------------------------------------------

REM tiger 계정에서 실행
REM 함수 count_auth_definer를 계정 tiger에서 실행
SELECT count_auth_definer() FROM dual ;
