SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 생성자 메소드 본체
CREATE OR REPLACE TYPE BODY person_type 
IS
  -- 속성을 Display
  MEMBER FUNCTION display RETURN VARCHAR2
  IS
  BEGIN
    RETURN '성:'||family_name||', 이름:'||given_name||
           ', 기본 주소:'||address_1||', 상세 주소:'||address_2 ;
  END ;
  
  -- 기본 생성자가 아닌 추가 생성자 정의. 주소 없이 이름만으로 객체를 생성한다.
  CONSTRUCTOR FUNCTION person_type(a_family_name VARCHAR2, a_given_name VARCHAR2)
    RETURN SELF AS RESULT
  IS
  BEGIN
    family_name := a_family_name ;
    given_name  := a_given_name ;
    address_1   := NULL ;
    address_2   := NULL ;
    RETURN ;  -- 객체 타입의 생성자는 RETURN문의 반환값이 없다.
  END ;
END ;
/
