SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 일반 패키지
CREATE OR REPLACE PACKAGE normal_pkg IS
  v_n NUMBER := 0 ; -- 0으로 초기화
END ;
/

PAUSE

REM SERIALLY_REUSABLE 패키지
CREATE OR REPLACE PACKAGE sr_pkg IS
  PRAGMA SERIALLY_REUSABLE;
  v_n NUMBER := 0 ; -- 0으로 초기화
END ;
/

PAUSE

REM 두 패키지 변수의 값을 동일하게 10으로 변경
BEGIN
  normal_pkg.v_n := 10 ; -- 일반              패키지 변수 값을 10으로 변경
  sr_pkg.    v_n := 10 ; -- SERIALLY_REUSABLE 패키지 변수 값을 10으로 변경
END ;
/

PAUSE

REM 재호출 시 패키지 변수의 값의 차이를 출력
BEGIN
  DBMS_OUTPUT.PUT_LINE('normal_pkg.v_n = ' || normal_pkg.v_n) ;
  DBMS_OUTPUT.PUT_LINE('sr_pkg.    v_n = ' || sr_pkg.    v_n) ;
END ;
/
