SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM MAP 멤버 메소드 본체
CREATE OR REPLACE TYPE BODY person_type 
IS
  -- 풀 네임(성 + 이름)을 반환
  MEMBER FUNCTION full_name RETURN VARCHAR2
  IS
  BEGIN
    RETURN family_name || ' ' || given_name ;
  END ;

  -- 비교를 위한 메소드. full_name끼리 비교한다.
  MAP MEMBER FUNCTION person_type_map RETURN VARCHAR2
  IS
  BEGIN
    RETURN full_name ;
  END ;
END ;
/
