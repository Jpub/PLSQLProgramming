SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 변수 사용시 주의사항 예제를 위한 패키지 명세
REM 예제용 패키지 생성
CREATE OR REPLACE PACKAGE pkg_seq
IS
  v_seq NUMBER ; -- 공용 패키지 변수 선언

  FUNCTION  get_nextval RETURN NUMBER ; -- 패키지 변수의 값을 1 증가시키고 이 값을 반환
END ;
/
