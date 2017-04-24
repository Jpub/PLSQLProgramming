SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 변수의 타입 변환
DECLARE
  -- PL/SQL에서 슈퍼타입 과 서브타입 간의 변환
  v1 person_type   := person_type  ('홍', '길동', '한양 종로',     '32번지') ;
  v2 employee_type := employee_type('손', '오공', '화과산 수렴동', '동굴',
                                    1001, 9900, 10, NULL) ;
  v3 person_type   ;
  v4 employee_type ;
BEGIN
  v3 := v1 ; -- 정상. 동일타입이므로 가능
  v3 := v2 ; -- 정상. 슈퍼타입 변수는 서브타입 인스턴스를 수용할 수 있음
  v4 := TREAT(v3 as employee_type); -- 정상. v3의 employee_type을 employee_type 변수에 할당
  v3 := v1 ;
  v4 := TREAT(v3 as employee_type); -- 오류. person_type을 employee_type에 할당할 수 없음
END ; 
/
