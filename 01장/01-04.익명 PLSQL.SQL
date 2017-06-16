SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

DECLARE
  -- 상수
  c_default_deptno CONSTANT NUMBER := 20 ; -- 기본 부서 코드

  -- 처리대상 사원 정보를 값으로 가지는 변수 정의
  v_empno    NUMBER(4)    := 7788    ;    -- 처리 대상 사번
  v_ename    VARCHAR2(10) := 'SCOTT' ;    -- 처리 대상 사원명
  v_job      VARCHAR2(9)  := 'ANALYST' ;  -- 처리 대상 사원의 업무

  -- 추가 변수
  v_cnt      NUMBER ;       -- 건수
BEGIN
  -- 주어진 사번의 존재 여부 확인
  --   v_cnt > 0 : 존재
  --         = 0 : 없음
  SELECT COUNT(*)
    INTO v_cnt
    FROM emp
   WHERE empno = v_empno ;

  -- 1. 해당 사번이 emp 테이블에 존재하면
  IF v_cnt > 0 THEN
    --  1.1 (사원명, 업무)를 (v_ename, v_job)으로 변경
    UPDATE emp
       SET ename = v_ename,
           job   = v_job
     WHERE empno = v_empno ;
       
    DBMS_OUTPUT.PUT_LINE('사원 "' || v_ename || '"의 정보가 변경되었습니다.') ;
  ELSE  -- 2. 해당 사번이 emp 테이블에 존재하지 않으면
    -- 새로운 사원 정보를 테이블에 등록
    INSERT INTO emp(empno, ename, job, deptno)
    VALUES (v_empno, v_ename, v_job, c_default_deptno) ;
    
    DBMS_OUTPUT.PUT_LINE('신입사원 "' || v_ename || '"이(가) 등록되었습니다.') ;
  END IF ;
  COMMIT ;
EXCEPTION WHEN OTHERS THEN
  ROLLBACK ; -- 모든 변경 취소
  DBMS_OUTPUT.PUT_LINE('응용 프로그램 오류 발생' || CHR(10) || SQLERRM) ;
END ;
/
