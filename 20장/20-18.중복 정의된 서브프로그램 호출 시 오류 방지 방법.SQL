SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 서브프로그램 중복 정의의 다양한 유형
REM 중복 정의된 서브프로그램 호출 시 오류 방지 방법
BEGIN
  -- 매개변수의 이름만 다른 오버로딩 호출 시 이름에 의한 매개변수 지정을 사용하여 오류 방지
  pkg_overloading.p4(v1 => 'A', n1 => 1) ; -- 첫 번째 p4 프로시저
  pkg_overloading.p4(v2 => 'A', n2 => 1) ; -- 두 번째 p4 프로시저
END ;
/
