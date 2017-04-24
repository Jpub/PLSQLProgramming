SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 저장 함수의 구조
CREATE OR REPLACE FUNCTION get_wage(a_empno NUMBER)
  RETURN NUMBER
-- 사원의 급여와 커미션의 합을 반환하는 함수
IS  -- 선언부 시작. IS 대신 AS를 사용할 수 있음
  v_wage NUMBER ;
BEGIN  -- 실행부 시작
  -- 사번이 a_empno인 사원의 급여와 커미션의 합을 조회한다.
  SELECT sal + NVL(comm,0) comm
    INTO v_wage
    FROM emp
   WHERE empno = a_empno ;
  -- 급여를 반환한다.
  RETURN v_wage ;
EXCEPTION  -- 예외처리부 시작
  WHEN NO_DATA_FOUND THEN
    -- 사원이 존재하지 않을 경우는 -1을 반환한다.
    RETURN -1 ;
END ;
/
