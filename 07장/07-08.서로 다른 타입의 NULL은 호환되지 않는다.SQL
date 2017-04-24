SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM NULL 리터럴도 데이터 타입을 가진다.
REM 데이터 타입이 다른 NULL 간의 연산은 컴파일 오류를 발생시킨다.
DECLARE
  v_num  NUMBER  := NULL ; -- 수치형 리터럴 NULL
  v_bool BOOLEAN := NULL ; -- BOOLEAN형 리터럴 NULL
BEGIN          
  -- NUMBER형 리터럴 NULL과 BOOLEAN형 리터럴 NULL은 서로 호환되지 않는다.
  -- 따라서 다음 IF 문은 컴파일 오류를 일으킨다.
  IF v_num = v_bool THEN 
    DBMS_OUTPUT.PUT_LINE('NULL NUMBER = NULL BOOLEAN') ;
  END IF ;
END ;
/
