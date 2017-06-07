SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM Nested Table 컬렉션의 사용
DECLARE
  -- 정수를 인덱스로 하는 Nested Table
  TYPE city IS TABLE OF VARCHAR2(64) ;
  
  -- 빈 컬렉션 변수 선언
  v_city       city ;
  
  -- 컬렉션 변수 선언과 동시에 컬렉션 생성자를 사용하여 값을 초기화
  v_city2      city := city('서울', '부산', '대전') ;
BEGIN
  -- 실행 중에도 컬렉션 생성자를 사용하여 초기화 가능
  v_city := city('서울', '부산', '대전', '광주', '인천') ;
  
  v_city := city() ;  -- 크기 0(Empty 컬렉션)으로 초기화
  -- 크기를 증가시키고, 값을 지정한다.
  v_city.EXTEND ; v_city(1) := '서울' ;
  v_city.EXTEND ; v_city(2) := '부산' ;
  v_city.EXTEND ; v_city(3) := '대구' ;
  v_city.EXTEND ; v_city(4) := '광주' ;
  DBMS_OUTPUT. PUT_LINE('도시 개수 : ' ||v_city.COUNT||'개') ;

  -- 유효한 컬렉션 값을 출력
  FOR i in v_city.FIRST .. v_city.LAST
  LOOP
    IF v_city.EXISTS(i) THEN
      DBMS_OUTPUT.PUT_LINE(CHR(9)||'v_city(' || TO_CHAR(i) || ') : ' ||v_city(i)) ;
    END IF ;
  END LOOP ;
  
  -- 3번 인덱스를 삭제한다. 삭제된 인덱스의 항목은 더 이상 접근이 불가능하다.
  v_city.DELETE(3) ;
  DBMS_OUTPUT. PUT_LINE('도시 개수 : ' ||v_city.COUNT||'개') ;
  
  -- 유효한 컬렉션 값을 출력
  FOR i in v_city.FIRST .. v_city.LAST
  LOOP
    IF v_city.EXISTS(i) THEN
      DBMS_OUTPUT.PUT_LINE(CHR(9)||'v_city(' || TO_CHAR(i) || ') : ' ||v_city(i)) ;
    END IF ;
  END LOOP ;
END ;
/
