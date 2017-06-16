SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM scott 계정에서 실행
REM 함수의 실행 권한을 tiger에게 부여
GRANT EXECUTE ON scott.count_auth_definer TO tiger ;

PAUSE

REM ****** tiger 계정에 접속 ******
CONN tiger/scott

PAUSE

--------------------------------------------------
-- tiger 계정
--------------------------------------------------

REM tiger 계정에서 실행
REM SYNONYM 생성
DROP SYNONYM count_auth_definer ;
CREATE SYNONYM count_auth_definer FOR scott.count_auth_definer ;
