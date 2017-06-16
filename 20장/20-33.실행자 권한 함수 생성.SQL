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
REM 실행자 권한 함수 생성
CREATE OR REPLACE FUNCTION scott.count_auth_current_user RETURN PLS_INTEGER
  AUTHID CURRENT_USER
AS
  v_cnt PLS_INTEGER ;
BEGIN
  SELECT COUNT(*) 
    INTO v_cnt
    FROM emp ;
  RETURN v_cnt ;
END ;
/
