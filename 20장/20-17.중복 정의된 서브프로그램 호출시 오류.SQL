SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 서브프로그램 중복 정의의 다양한 유형
REM 중복 정의된 서브프로그램 호출 시 오류
BEGIN
  -- 매개변수 이름이 다른 중복 정의 호출 시의 오류
  pkg_overloading.p4('A', 1) ;
END ;
/
