SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 컬렉션 반환 함수에 연속적으로 2개의 괄호 사용
REM 첫 번째 괄호인 (10)은 함수 get_emp_list를 호출할 때의 매개변수.
REM 두 번째 괄호인 (1)은 네스티드 테이블의 인덱스.
BEGIN
  DBMS_OUTPUT.PUT_LINE(get_emp_list(10)(1)) ;
END ;
/
