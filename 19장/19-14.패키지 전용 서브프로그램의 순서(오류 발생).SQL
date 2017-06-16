SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 전용 서브프로그램의 순서 예제
REM 서브프로그램은 사용되기 전에 선언되어야 함
REM 패키지 본체: 서브프로그램의 순서에 따라서 오류가 발생할 수 있음
CREATE OR REPLACE PACKAGE BODY pkg_xyz
IS
  -- 전용 서브프로그램 정의
  -- 두 서브프로그램 x와 y는 패키지 명세에는 정의되지 않았다.
  PROCEDURE y IS
  BEGIN
    x() ; -- x가 사용되기 전에 선언되지 않았으므로 오류 발생
  END ;
  
  PROCEDURE x IS
  BEGIN
    NULL ;
  END ;
END ;
/

PAUSE

REM 오류 조회
SHOW ERROR
