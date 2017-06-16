SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 저장 함수
CREATE OR REPLACE FUNCTION get_wage(a_empno NUMBER)
RETURN NUMBER
-- 사원의 급여와 커미션의 합을 반환하는 함수
IS
  v_wage NUMBER ;
BEGIN
  -- 사번이 a_empno인 사원의 급여와 커미션의 합을 조회한다.
  SELECT sal + NVL(comm,0) comm
    INTO v_wage
    FROM emp
   WHERE empno = a_empno ;
  -- 급여를 반환한다.
  RETURN v_wage ;
END ;
/
