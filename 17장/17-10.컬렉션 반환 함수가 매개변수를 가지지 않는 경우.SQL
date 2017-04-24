SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 컬렉션 반환 함수가 매개변수를 가지지 않는 경우
REM 첫 번째 빈 괄호 ()은 함수 get_emp_list를 호출할 때의 매개변수.
REM 두 번째 괄호인 (1)은 네스티드 테이블의 인덱스.
DECLARE
  -- 매개변수를 가지지 않는 함수
  FUNCTION get_emp_list_of_dept_10 RETURN empno_arr_type
  IS
    v_empno_arr empno_arr_type ;
  BEGIN
    SELECT empno
      BULK COLLECT INTO v_empno_arr 
      FROM emp
     WHERE deptno = 10; -- 부서 번호 10의 사원 번호 목록
    RETURN v_empno_arr ;
  END ;
BEGIN
  DBMS_OUTPUT.PUT_LINE(get_emp_list_of_dept_10()(1)) ;
END ;
/
