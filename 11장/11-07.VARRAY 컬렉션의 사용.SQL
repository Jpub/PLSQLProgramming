SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM VARRAY 컬렉션의 사용
DECLARE
  -- VARRAY 타입 선언 : 자연수를 인덱스로 하는, 최대 10개의 64바이트 문자열의 배열
  TYPE languages IS VARRAY(10) OF VARCHAR2(64);
  v_lang  languages ; -- VARRAY 변수 선언. v_lang = NULL임
  v_lang2 languages := languages('한국어', '중국어', '영어') ; -- 변수 선언 시 생성자를 사용하여 초기화
BEGIN
  v_lang := languages() ;                   -- 컬렉션 생성자를 사용하여 Empty(크기가 0)로 초기화.
  v_lang := languages('한국어') ;           -- 컬렉션 생성자를 사용하여 크기가 1인 VARRAY로 재초기화
  v_lang := languages('한국어', '중국어') ; -- 컬렉션 생성자를 사용하여 크기가 2인 VARRAY로 재초기화
  
  v_lang.EXTEND(2) ; -- 크기 두 개 증가
  v_lang(3) := '일본어' ;
  v_lang(4) := '영어' ;
  
  -- v_lang에 들어 있는 언어 출력
  DBMS_OUTPUT.PUT_LINE('	') ;
  DBMS_OUTPUT.PUT_LINE('언어 목록') ;
  DBMS_OUTPUT.PUT_LINE('===========') ;
  FOR i in v_lang.FIRST .. v_lang.LAST
  LOOP
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(i) || ' : ' ||v_lang(i)) ;
  END LOOP ;
END ;
/
