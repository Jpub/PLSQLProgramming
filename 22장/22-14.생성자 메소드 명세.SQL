SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 객체 테이블 삭제
DROP TABLE tb_person ;

REM 생성자 메소드 명세
CREATE OR REPLACE TYPE person_type AS OBJECT (
  family_name VARCHAR2(30),  -- 성
  given_name  VARCHAR2(30),  -- 이름
  address_1   VARCHAR2(60),  -- 기본 주소
  address_2   VARCHAR2(30),  -- 상세 주소
  
  MEMBER      FUNCTION  display RETURN VARCHAR2, -- 속성을 Display
  CONSTRUCTOR FUNCTION person_type(a_family_name VARCHAR2, a_given_name VARCHAR2) -- 생성자
    RETURN SELF AS RESULT  -- 객체 타입의 생성자는 반환형이 항상 SELF AS RESULT다.
) ;
/
