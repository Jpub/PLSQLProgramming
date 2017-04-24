SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM ORDER 멤버 메소드 본체
CREATE OR REPLACE TYPE BODY person_type 
IS
  -- 풀 네임(성 + 이름)을 반환
  MEMBER FUNCTION full_name RETURN VARCHAR2
  IS
  BEGIN
    RETURN family_name || ' ' || given_name ;
  END ;

  -- 비교를 위한 메소드
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
END ;
/
