SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 객체 테이블 삭제
DROP TABLE tb_person ;

REM person_type 명세
CREATE OR REPLACE TYPE person_type AS OBJECT (
  family_name VARCHAR2(30),  -- 성
  given_name  VARCHAR2(30),  -- 이름
  address_1   VARCHAR2(60),  -- 기본 주소
  address_2   VARCHAR2(30),  -- 상세 주소
  
  MEMBER       FUNCTION  full_name       RETURN VARCHAR2,  -- 풀 네임 반환 메소드
  MEMBER       FUNCTION  mailing_address RETURN VARCHAR2,  -- 전체 주소 반환 메소드
  MEMBER       PROCEDURE set_name(family_name VARCHAR2, given_name VARCHAR2), -- 이름 설정
  MEMBER       FUNCTION  display RETURN VARCHAR2,          -- 속성을 Display
  --MAP MEMBER   FUNCTION  person_type_map RETURN VARCHAR2,  -- 비교를 위한 메소드
  ORDER MEMBER FUNCTION  person_type_order(a_comp person_type) RETURN INTEGER, -- 비교를 위한 메소드
  STATIC       FUNCTION  is_same_address(a_person1 person_type, -- STATIC 메소드
                                         a_person2 person_type) RETURN BOOLEAN,
  CONSTRUCTOR  FUNCTION  person_type(a_family_name VARCHAR2, a_given_name VARCHAR2) -- 생성자
    RETURN SELF AS RESULT
) NOT FINAL /* 상속 허용 */ ;
/

PAUSE

REM person_type 본체
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
    -- 인스턴스의 속성과 매개변수의 이름이 동일하므로 
    -- 둘 간의 구별을 위해 SELF를 프리픽스로사용해야 함
    SELF.family_name := family_name ;
    SELF.given_name  := given_name ; 
  END ;

  -- 속성을 Display
  MEMBER FUNCTION display RETURN VARCHAR2
  IS
  BEGIN
    RETURN '성:'||family_name||', 이름:'||given_name||
           ', 기본 주소:'||address_1||', 상세 주소:'||address_2 ;
  END ;
  
--  -- TYPE 비교를 위한 MAP 멤버 메소드
--  MAP MEMBER FUNCTION person_type_map RETURN VARCHAR2
--  IS
--  BEGIN
--    RETURN full_name ;
--  END ;

  -- TYPE 비교를 위한 ORDER 멤버 메소드
  ORDER MEMBER FUNCTION person_type_order(a_comp person_type) RETURN INTEGER
  IS
  BEGIN
    IF    SELF.full_name < a_comp.full_name THEN
      RETURN -1 ;
    ELSIF SELF.full_name > a_comp.full_name THEN
      RETURN 1 ;
    ELSE
      RETURN 0 ;
    END IF ;
  END ;
  
  -- STATIC 메소드
  STATIC FUNCTION is_same_address(a_person1 person_type, 
                                  a_person2 person_type) RETURN BOOLEAN
  IS
  BEGIN
    IF a_person1.address_1 = a_person2.address_1 AND
       a_person1.address_2 = a_person2.address_2 THEN
      RETURN TRUE ;
    ELSE
      RETURN FALSE ;
    END IF ;
  END ;
  
  -- 기본 생성자가 아닌 추가 생성자 정의
  CONSTRUCTOR FUNCTION person_type(a_family_name VARCHAR2, a_given_name VARCHAR2)
    RETURN SELF AS RESULT
  IS
  BEGIN
    family_name  := a_family_name ;
    given_name := a_given_name ;
    address_1  := NULL ;
    address_2  := NULL ;
    RETURN ;
  END ;
END ;
/
