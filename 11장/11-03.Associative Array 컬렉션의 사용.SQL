SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM Associative Array 컬렉션의 사용
DECLARE
  -- 정수를 인덱스로 하는 Associative Array 타입 선언
  TYPE city IS TABLE OF VARCHAR2(64) INDEX BY PLS_INTEGER ;

  -- 문자열을 인덱스로 하는 Associative Array 타입 선언
  TYPE population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);

  v_city       city ;        -- 컬렉션 변수 선언
  v_Population Population ;  -- Population 타입의 컬렉션 변수
BEGIN
  
  -- 정수 인덱스를 사용하는 Associative Array의 값 할당
  -- 특정 인덱스에 값을 지정하면, 이후 이 인덱스로 값의 접근이 가능하다.
  v_city(-1) := '서울' ;
  v_city( 0) := '부산' ;
  v_city( 2) := '대전' ;
  
  -- 인덱스 -1, 0, 2를 제외한 인덱스의 항목은 값을 가지지 않는다. 
  -- 다른 인덱스를 사용하여 v_city에 접근하면 ORA-01403 오류가 발생한다.
  
  -- 문자열 인덱스를 사용하는 Associative Array의 값 지정
  v_Population('서울') := 10373234 ; -- 서울 인구
  v_Population('부산') :=  3812392 ; -- 부산 인구
  v_Population('대전') :=  1390510 ; -- 대전 인구

  -- v_city에 들어 있는 각 도시의 인구 출력
  DBMS_OUTPUT.PUT_LINE('도시별 인구(2000년 기준)') ;
  DBMS_OUTPUT.PUT_LINE('========================') ;
  DBMS_OUTPUT.PUT_LINE(v_city(-1) || ' :' || TO_CHAR(v_Population(v_city(-1)), '99,999,999')) ;
  DBMS_OUTPUT.PUT_LINE(v_city( 0) || ' :' || TO_CHAR(v_Population(v_city( 0)), '99,999,999')) ;
  DBMS_OUTPUT.PUT_LINE(v_city( 2) || ' :' || TO_CHAR(v_Population(v_city( 2)), '99,999,999')) ;
END ;
/
