SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 문자형 데이터 타입 선언 시 "(길이 CHAR)" 형식 사용
REM 바이트 단위가 아닌 글자 수 단위의 길이로 선언되므로
REM 데이터베이스 문자집합에 따라서 최대 길이가 달라진다.
DECLARE
  v_charset  VARCHAR2(16    ) ; -- 최대 16바이트
  v_name1    VARCHAR2(8 CHAR) ; -- 최대 8글자
  v_name2    VARCHAR2(8     ) ; -- 최대 8바이트
BEGIN
  -- Fixed View에서 데이터베이스 문자 집합을 조회하여 출력한다.
  SELECT VALUE INTO v_charset FROM v$nls_parameters WHERE parameter = 'NLS_CHARACTERSET' ;
  DBMS_OUTPUT.PUT_LINE('데이터베이스 문자 집합 : ' || v_charset) ;

  DBMS_OUTPUT.PUT_LINE(CHR(9)) ; -- 탭 문자(빈 줄 출력용)
  
  -- 문자 단위
  DBMS_OUTPUT.PUT_LINE('v_name1 VARCHAR2(8 CHAR)') ;
  DBMS_OUTPUT.PUT_LINE('========================') ;
  v_name1 := 'Miller' ;   -- 알파벳 문자열
  DBMS_OUTPUT.PUT_LINE(RPAD(v_name1,9) ||' : ' || lengthb(v_name1) || '바이트') ;
  v_name1 := '을지문덕' ; -- 한글 문자열
  DBMS_OUTPUT.PUT_LINE(RPAD(v_name1,9) ||' : ' || lengthb(v_name1) || '바이트') ;

  DBMS_OUTPUT.PUT_LINE(CHR(9)) ; -- 탭 문자(빈 줄 출력용)
  
  -- 바이트 단위
  DBMS_OUTPUT.PUT_LINE('v_name2 VARCHAR2(8)') ;
  DBMS_OUTPUT.PUT_LINE('====================') ;
  v_name2 := 'Miller' ;   -- 알파벳 문자열
  DBMS_OUTPUT.PUT_LINE(RPAD(v_name2,9) ||' : ' || lengthb(v_name2) || '바이트') ;
  v_name2 := '을지문덕' ; -- 한글 문자열
  DBMS_OUTPUT.PUT_LINE(RPAD(v_name2,9) ||' : ' || lengthb(v_name2) || '바이트') ;
END ;
/
