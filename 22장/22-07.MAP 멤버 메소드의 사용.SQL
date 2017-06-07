SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM MAP 멤버 메소드 사용
DECLARE
  -- MAP또는 ORDER 메소드를 사용한 객체 타입의 비교 예제
  v1 person_type := person_type('홍', '길동', NULL, NULL) ;
  v2 person_type := person_type('임', '꺽정', NULL, NULL) ;
  v3 person_type := person_type('홍', '길동', NULL, NULL) ;
BEGIN
  DBMS_OUTPUT.PUT_LINE(CASE WHEN v1 = v2 THEN
                                 v1.full_name || ' == ' || v2.full_name
                            ELSE v1.full_name || ' <> ' || v2.full_name
                       END) ;
  DBMS_OUTPUT.PUT_LINE(CASE WHEN v1 = v3 THEN
                                 v1.full_name || ' == ' || v3.full_name
                            ELSE v1.full_name || ' <> ' || v3.full_name
                       END) ;
END ;
/
