SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 정적 메소드 본체
CREATE OR REPLACE TYPE BODY person_type 
IS
  -- 풀 네임(성 + 이름)을 반환
  MEMBER FUNCTION full_name RETURN VARCHAR2
  IS
  BEGIN
    RETURN family_name || ' ' || given_name ;
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
END ;
/
