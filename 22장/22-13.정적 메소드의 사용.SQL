SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 정적 메소드 사용
DECLARE
  -- STATIC 메소드 예제
  v1 person_type := person_type('홍', '길동', '한양 종로',   '32번지') ;
  v2 person_type := person_type('임', '꺽정', '경기도 철원', '산 75번지') ;
  v3 person_type := person_type('홍', '판서', '한양 종로',   '32번지') ;
BEGIN
  DBMS_OUTPUT.PUT_LINE(v1.full_name || ','||v2.full_name || ': ' ||
                       CASE WHEN person_type.is_same_address(v1, v2) 
                            THEN '동일 주소' ELSE '다른 주소' END) ;
  DBMS_OUTPUT.PUT_LINE(v1.full_name || ','||v3.full_name || ': ' ||
                       CASE WHEN person_type.is_same_address(v1, v3) 
                            THEN '동일 주소' ELSE '다른 주소' END) ;
END ;
/
