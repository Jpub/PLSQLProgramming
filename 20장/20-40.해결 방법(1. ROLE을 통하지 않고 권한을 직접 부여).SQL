SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM ************************************
REM 첫 번째 해결 방법
REM ROLE을 통하지 않고 권한을 직접 부여
REM ************************************

PAUSE

REM ****** scott 계정에 접속 ******
CONN scott/tiger

PAUSE

--------------------------------------------------
-- scott 계정
--------------------------------------------------

REM scott 계정에서 다음 GRANT 문을 실행
GRANT SELECT ON scott.emp TO tiger ;

PAUSE

REM ****** tiger 계정에 접속 ******
CONN tiger/scott

PAUSE

--------------------------------------------------
-- tiger 계정
--------------------------------------------------

REM tiger 계정에서 다시 실행하면 성공함
CREATE OR REPLACE FUNCTION tiger.count_auth_definer_tiger RETURN PLS_INTEGER
AS
  v_cnt PLS_INTEGER ;
BEGIN
  SELECT COUNT(*)
    INTO v_cnt
    FROM scott.emp ;
  RETURN v_cnt ;
END ;
/
