SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM ************************************
REM 두 번째 해결 방법
REM 서브프로그램을 실행자 권한으로 정의
REM ************************************

PAUSE

REM ****** scott 계정에 접속 ******
CONN scott/tiger

PAUSE

--------------------------------------------------
-- scott 계정
--------------------------------------------------

REM scott 계정에서 다음 GRANT 문을 실행
REVOKE SELECT ON scott.emp FROM tiger ;

PAUSE

REM ****** tiger 계정에 접속 ******
CONN tiger/scott

PAUSE

--------------------------------------------------
-- tiger 계정
--------------------------------------------------

REM tiger 계정에서 실행자 권한을 사용하는 다음 프로그램을 컴파일하면 성공함
CREATE OR REPLACE FUNCTION tiger.count_auth_current_user_tiger
  RETURN PLS_INTEGER
  AUTHID CURRENT_USER -- 실행자 권한으로 정의한다.
AS
  v_cnt PLS_INTEGER ;
BEGIN
  -- 동적 SQL로 작성하여 컴파일 시 오류를 피한다.
  -- 실행 시에는 실행자 권한이 사용되므로 scott.emp 테이블을 읽을 수 있다.
  EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM scott.emp'
          INTO v_cnt;
  RETURN v_cnt ;
END ;
/

SELECT count_auth_current_user_tiger() FROM DUAL ;
