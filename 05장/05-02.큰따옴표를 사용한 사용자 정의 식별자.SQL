SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 큰따옴표를 사용한 다양한 유형의 사용자 정의 식별자
REM 큰따옴표를 사용하면 일반 사용자 정의 식별자의 제약 사항 중 
REM 30자 길이 제한을 제외한 모든 제약 사항을 넘어설 수 있다.
REM 공백 문자나 특수 문자를 포함한 식별자도 사용할 수 있으며
REM 예약어나 키워드까지도 모두 사용자 정의 식별자로 사용할 수 있다.
DECLARE
  v_num               NUMBER ; -- 일반 사용자 정의 식별자(대문자 V_NUM으로 식별됨)
  "v_num"             NUMBER ; -- 소문자 사용자 정의 식별자
  "공백 포함 변수명"  NUMBER ; -- 공백문자를 포함한 사용자 정의 식별자
  "v_~!@#$%^&*()+-="  NUMBER ; -- 특수문자를 포함한 사용자 정의 식별자
  "BEGIN"             NUMBER ; -- 예약어를 사용한 사용자 정의 식별자
  
  FUNCTION "square number"(a_num NUMBER) -- 함수명 식별자에 소문자와 공백 문자 포함
  RETURN NUMBER IS
  BEGIN
    RETURN a_num * a_num ;
  END ;

BEGIN
  "v_num"            := 10 ;
  v_num              := 20 ;
  "공백 포함 변수명" := 30 ;
  "v_~!@#$%^&*()+-=" := 40 ;
  "BEGIN"            := 50 ;
  DBMS_OUTPUT.PUT_LINE("v_num") ;            -- 소문자 식별자 = 10
  DBMS_OUTPUT.PUT_LINE(V_NUM) ;              -- 대문자 식별자 = 20
  DBMS_OUTPUT.PUT_LINE(v_num) ;              -- 대문자 식별자(위와 동일한 변수) = 20
  DBMS_OUTPUT.PUT_LINE("V_NUM") ;            -- 대문자 식별자(위와 동일한 변수) = 20
  DBMS_OUTPUT.PUT_LINE("공백 포함 변수명") ; -- = 30
  DBMS_OUTPUT.PUT_LINE("v_~!@#$%^&*()+-=") ; -- = 40
  DBMS_OUTPUT.PUT_LINE("BEGIN") ;            -- = 50
  DBMS_OUTPUT.PUT_LINE("square number"(10)) ;-- = 100
END ;
/
