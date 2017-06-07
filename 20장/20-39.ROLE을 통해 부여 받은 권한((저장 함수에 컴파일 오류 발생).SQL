SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM ****** tiger 계정에 접속 ******
CONN tiger/scott

PAUSE

--------------------------------------------------
-- tiger 계정
--------------------------------------------------

REM 다음 프로그램을 tiger 계정에서 실행하면 실패함
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

SHOW ERROR
