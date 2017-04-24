SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM PL/SQL에서 생성자의 사용
DECLARE
  -- 선언부에서 선언과 동시에 생성자를 사용하여 초기화(실제로는 NEW 키워드가 생략된 형태임)
  v1 person_type := person_type('홍', '길동', '한양 종로', '32번지') ;
  v2 person_type ;
  v3 person_type ;
BEGIN
  -- 실행 중에 생성자를 사용하여 초기화한다. 생성자 호출 시에는 키워드 NEW를 사용한다.
  v2 := NEW person_type('손', '오공', '화과산 수렴동', '동굴') ;
  -- NEW는 생략 가능하다.
  v3 :=     person_type('김', '삿갓') ;
END ;
/
