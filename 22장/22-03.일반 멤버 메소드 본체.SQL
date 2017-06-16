SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 일반 멤버 메소드 본체
CREATE OR REPLACE TYPE BODY person_type 
IS
  -- 풀 네임(성 + 이름)을 반환
  MEMBER FUNCTION full_name RETURN VARCHAR2
  IS
  BEGIN
    RETURN family_name || ' ' || given_name ;
  END ; 
  
  -- 전체 주소(기본 주소 + 상세 주소)를 반환
  MEMBER FUNCTION mailing_address RETURN VARCHAR2
  IS
  BEGIN
    RETURN address_1 || ' ' || address_2 ;
  END ;
  
  -- 이름 설정
  MEMBER PROCEDURE set_name(family_name VARCHAR2, given_name VARCHAR2)
  IS
  BEGIN
    -- 객체 타입의 속성과 매개변수의 이름이 동일하므로 
    -- 둘 간의 구별을 위해 "SELF."을 객체 타입 속성의 프리픽스로 사용해야 함
    SELF.family_name := family_name ;
    SELF.given_name  := given_name ; 
  END ;
END ;
/
