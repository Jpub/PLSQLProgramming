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
REM 정의자 권한 함수 생성
CREATE OR REPLACE FUNCTION scott.count_auth_definer RETURN PLS_INTEGER
  AUTHID DEFINER  -- 정의자 권한을 사용하도록 명시
AS
  v_cnt PLS_INTEGER ;
BEGIN
  SELECT COUNT(*)
    INTO v_cnt
    FROM emp ;
  RETURN v_cnt ;
END ;
/
