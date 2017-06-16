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
SELECT count_auth_definer()      AS 정의자권한
     , count_auth_current_user() AS 생성자권한
  FROM DUAL ;

PAUSE
