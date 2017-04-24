SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 변수 사용시 주의사항 예제를 위한 패키지 본체
REM 예제용 패키지 생성
CREATE OR REPLACE PACKAGE body pkg_seq
IS
  FUNCTION get_nextval RETURN NUMBER IS
  BEGIN
    v_seq := v_seq + 1 ;
    RETURN v_seq ;
  END ;
BEGIN
  v_seq := 0 ; -- 공용패키지 변수 초기화
END ;
/
