SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 일반 멤버 메소드 사용 예제
DECLARE
  v_emp person_type := person_type('홍', '길동', '한양 종로', '32번지') ;
BEGIN
  DBMS_OUTPUT.PUT_LINE(v_emp.full_name()||'의 우편 주소: '||
                       v_emp.mailing_address()) ;
END ;
/
