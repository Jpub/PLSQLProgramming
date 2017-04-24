SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 일반 멤버 메소드 명세
CREATE OR REPLACE TYPE person_type AS OBJECT (
  family_name VARCHAR2(30),  -- 성
  given_name  VARCHAR2(30),  -- 이름
  address_1   VARCHAR2(60),  -- 기본 주소
  address_2   VARCHAR2(30),  -- 상세 주소
  
  MEMBER FUNCTION  full_name       RETURN VARCHAR2, -- 풀 네임 반환 메소드
  MEMBER FUNCTION  mailing_address RETURN VARCHAR2, -- 전체주소 반환 메소드
  MEMBER PROCEDURE set_name(family_name VARCHAR2, given_name VARCHAR2) -- 이름 설정
) ;
/
