SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 서브프로그램 중복 정의의 다양한 유형
REM 패키지 명세
CREATE OR REPLACE PACKAGE pkg_overloading
IS
  -- 1: 매개변수 데이터 타입이 다른 중복 정의(Overloading)
  PROCEDURE p1(n NUMBER)   ;
  PROCEDURE p1(v VARCHAR2) ;

  -- 2: 매개변수 개수가 다른 중복 정의(Overloading)
  PROCEDURE p2(n NUMBER)   ;
  PROCEDURE p2(n NUMBER, v VARCHAR2) ;

  -- 3: 매개변수 순서가 다른 중복 정의(Overloading)
  PROCEDURE p3(v VARCHAR2, n NUMBER) ;
  PROCEDURE p3(n NUMBER, v VARCHAR2) ;

  -- 4: 매개변수 이름이 다른 중복 정의(Overloading)
  PROCEDURE p4(v1 VARCHAR2, n1 NUMBER) ;
  PROCEDURE p4(v2 VARCHAR2, n2 NUMBER) ;
END ;
/
