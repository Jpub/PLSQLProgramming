SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 전용 서브프로그램의 순서 예제
REM 패키지 본체 : 정상 컴파일
CREATE OR REPLACE PACKAGE BODY pkg_xyz
IS
  -- 전용 서브프로그램 정의.
  -- 두 서브프로그램 x와 y는 패키지 명세에는 정의되지 않았다
  PROCEDURE x IS
  BEGIN
    NULL ;
  END ;
  
  PROCEDURE y IS
  BEGIN
    x() ; -- 순서상x 가 먼저 선언되었으므로 정상
  END ;
END ;
/
