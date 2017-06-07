SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION get_dept_employee_count(
          a_deptno NUMBER -- 사원 수를 계산할 부서 번호
        ) RETURN NUMBER   -- 부서의 사원 수를 반환
IS
  -- 변수
  v_cnt NUMBER ;  -- 건수
BEGIN
  -- 테이블 emp에 들어 있는, 부서 번호 a_deptno를 가진 사원의 수를 계산
  SELECT COUNT(*)
    INTO v_cnt
    FROM emp
   WHERE deptno = a_deptno ;

  RETURN v_cnt ; -- 건수를 반환
  
EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('응용 프로그램 오류 발생' || CHR(10) || SQLERRM) ;
  RETURN -1 ;
END ;
/
