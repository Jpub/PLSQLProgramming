SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 서브프로그램 중복 정의의 다양한 유형
REM 패키지 본체
CREATE OR REPLACE PACKAGE BODY pkg_overloading
IS
  -- 1. 매개변수 데이터 타입이 다른 중복 정의(Overloading)
  PROCEDURE p1(n NUMBER)   IS BEGIN NULL ; END ;
  PROCEDURE p1(v VARCHAR2) IS BEGIN NULL ; END ;

  -- 2. 매개변수 개수가 다른 중복 정의(Overloading)
  PROCEDURE p2(n NUMBER)             IS BEGIN NULL ; END ;
  PROCEDURE p2(n NUMBER, v VARCHAR2) IS BEGIN NULL ; END ;

  -- 3. 매개변수 순서가 다른 중복 정의(Overloading)
  PROCEDURE p3(v VARCHAR2, n NUMBER) IS BEGIN NULL ; END ;
  PROCEDURE p3(n NUMBER, v VARCHAR2) IS BEGIN NULL ; END ;

  -- 4. 매개변수 이름만 다르고 다른 것은 동일한 중복 정의(Overloading)
  PROCEDURE p4(v1 VARCHAR2, n1 NUMBER) IS BEGIN NULL ; END ;
  PROCEDURE p4(v2 VARCHAR2, n2 NUMBER) IS BEGIN NULL ; END ;
END ;
/
