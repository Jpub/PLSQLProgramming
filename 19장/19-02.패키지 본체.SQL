SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 본체
CREATE OR REPLACE PACKAGE BODY pkg_emp
IS
  --------------------------------------
  -- 전용 상수 선언
  --------------------------------------
  c_null_commission    CONSTANT NUMBER :=  0 ;
  c_failed_return_wage CONSTANT NUMBER := -1 ;

  --------------------------------------
  -- 전용 커서 선언
  --------------------------------------
  CURSOR emp_cursor(a_empno NUMBER) IS
    -- 사번이 a_empno인 사원의 급여와 커미션의 합을 조회한다.
    SELECT sal + NVL(comm, c_null_commission) comm
      FROM emp
     WHERE empno = a_empno ;
  
  --------------------------------------
  -- 공용 서브프로그램 정의
  --------------------------------------  
  FUNCTION get_wage(a_empno NUMBER) RETURN NUMBER
  -- 사원의 급여와 커미션의 합을 반환하는 함수
  IS
  BEGIN
    FOR rec IN emp_cursor(a_empno)
    LOOP
      -- 사원이 존재하는 경우에는 급여를 반환한다.
      v_last_wage := rec.comm ;
      return rec.comm ;
    end loop ;
    -- 사원이 존재하지 않을 경우는 -1을 반환한다.
    RETURN c_failed_return_wage ;
  END ;

  PROCEDURE raise_bonus(a_empno NUMBER, a_amt NUMBER)
  -- 테이블 bonus에 사원의 커미션 값을 인상하는 프로시저
  IS
    v_ename emp.ename%TYPE ;
  BEGIN
    -- 사원의 이름을 얻는다.
    BEGIN
      SELECT ename 
        INTO v_ename
        FROM emp
       WHERE empno = a_empno ;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        -- 사원이 존재하지 않을 경우는 수행을 중단하고 복귀한다.
        -- 반환값이 없는 것이 함수와 다른 점이다.
        RETURN ;
    END ;
    
    -- 보너스를 인상한다.
    IF a_amt IS NOT NULL 
    THEN
      MERGE INTO bonus
      USING DUAL
         ON (bonus.ename = v_ename)
       WHEN MATCHED THEN -- 기존 보너스가 있는 경우는 인상할 값을 더한다.
         UPDATE SET comm = comm + a_amt
       WHEN NOT MATCHED THEN  -- 기존 보너스가 없는 경우는 새 로우를 추가
         INSERT (ename, comm) 
         VALUES (v_ename, a_amt) ;
    END IF ;
  END ;

BEGIN -- 패키지 초기화부
  v_last_wage := -1 ;
END ;
/
