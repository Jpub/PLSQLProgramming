SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM ****** scott 계정에 접속 ******
CONN scott/tiger

PAUSE

--------------------------------------------------
-- scott 계정
--------------------------------------------------

REM scott 계정에서 실행
REM 함수 count_auth_definer를 계정 scott에서 실행
SELECT count_auth_definer() FROM dual ;

PAUSE

REM ****** tiger 계정에 접속 ******
CONN tiger/scott

PAUSE

--------------------------------------------------
-- tiger 계정
--------------------------------------------------

REM tiger 계정에서 실행
REM 함수 count_auth_definer를 계정 tiger에서 실행
SELECT count_auth_definer() FROM dual ;
