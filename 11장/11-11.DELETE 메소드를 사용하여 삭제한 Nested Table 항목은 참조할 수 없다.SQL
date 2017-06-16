SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM DELETE 메소드를 사용하여 삭제한 Nested Table 항목은 참조할 수 없다.
DECLARE
  -- 정수를 인덱스로 하는 Associative Array
  TYPE city IS TABLE OF VARCHAR2(64) ;
  
  -- 컬렉션 변수 선언과 동시에 컬렉션 생성자를 사용하여 값을 초기화
  v_city      city := city('서울', '부산', '대전', '광주', '인천') ;
BEGIN
  -- 3번 인덱스를 삭제한다. 삭제된 인덱스의 항목은 더 이상 접근이 불가능하다.
  v_city.DELETE(3) ;
  -- 다음 문장은 존재하지 않는 3번 항목을 참조하므로 오류를 일으킨다.
  DBMS_OUTPUT.PUT_LINE('v_city(' || TO_CHAR(3) || ') : ' ||v_city(3)) ;
END ;
/
