SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM DUP_VAL_ON_INDEX 예외 처리 코드
BEGIN
  -- 예외 처리를 하여 프로그램이 오류 없이 정상적으로 종료된다.
  INSERT INTO dept(deptno, dname,        loc)
  VALUES          (40,     'CONSULTING', 'MANHATTAN') ;
EXCEPTION -- 예외 처리
  WHEN DUP_VAL_ON_INDEX THEN -- 키 중복 처리
    DBMS_OUTPUT.PUT_LINE('키 값이 중복됩니다. 데이터는 INSERT되지 않았습니다.') ;
END ;
/
