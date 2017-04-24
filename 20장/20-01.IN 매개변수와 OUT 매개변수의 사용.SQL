SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM IN 매개변수와 OUT 매개변수의 사용
CREATE OR REPLACE PROCEDURE get_wage_proc(a_empno NUMBER, a_wage OUT NUMBER)
-- 사원의 급여와 커미션의 합을 매개변수로 반환하는 프로시저
IS
  v_wage NUMBER ;
BEGIN
  -- 사번이 a_empno인 사원의 급여와 커미션의 합을 조회한다.
  SELECT sal + NVL(comm,0) comm
    INTO v_wage
    FROM emp
   WHERE empno = a_empno ;
  -- 매개변수 a_wage를 통해 계산된 급여를 반환한다.
  a_wage := v_wage ;
END ;
/
