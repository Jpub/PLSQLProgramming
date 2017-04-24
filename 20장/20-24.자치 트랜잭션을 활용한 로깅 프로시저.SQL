SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 자치 트랜잭션을 활용한 로깅 예제
REM 로깅용 테이블
DROP TABLE log_table ;
CREATE TABLE log_table (
  timestmp TIMESTAMP WITH TIME ZONE,
  log_text VARCHAR2(4000)
) ;

PAUSE

REM 자치 트랜잭션을 활용한 로깅 프로시저
CREATE OR REPLACE PROCEDURE log_msg(a_log_text VARCHAR2)
IS
  PRAGMA AUTONOMOUS_TRANSACTION ; -- 자치트랜잭션 선언
BEGIN
  INSERT INTO log_table(timestmp, log_text)
  VALUES (SYSTIMESTAMP, a_log_text) ;
  COMMIT ; -- 자치 트랜잭션을 COMMIT한다. 메인 트랜잭션은 COMMIT되지 않는다.
END ;
/
