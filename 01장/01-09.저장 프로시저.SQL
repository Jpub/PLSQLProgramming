SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE register_employee(
          a_empno        NUMBER,   -- 입력 변수: 등록할 사번 매개변수
          a_ename        VARCHAR2, -- 입력 변수: 등록할 이름 매개변수
          a_job          VARCHAR2, -- 입력 변수: 등록할 업무 매개변수
          a_rslt_out OUT BOOLEAN,  -- 출력 변수: 처리 성공 여부
          a_msg_out  OUT VARCHAR2  -- 출력 변수: 처리 결과를 반환하는 변수
        )
IS
  -- 상수
  c_default_deptno CONSTANT NUMBER := 20 ; -- DEFAULT 부서 코드

  -- 변수
  v_cnt      NUMBER ;       -- 건수
BEGIN
  -- 주어진 사번의 존재 여부 확인
  --   v_cnt > 0 : 존재
  --         = 0 : 없음
  SELECT COUNT(*)
    INTO v_cnt
    FROM emp
   WHERE empno = a_empno ;

  -- 1. 해당 사번이 emp 테이블에 존재하면
  IF v_cnt > 0 THEN
    --  1.1 (사원명, 업무)를 (v_ename, v_job)으로 변경
    UPDATE emp
       SET ename = a_ename,
           job   = a_job
     WHERE ename = a_ename ;
       
    a_msg_out := '사원 "' || a_ename || '"의 정보가 변경되었습니다.' ;
  ELSE  
    -- 새로운 사원 정보를 테이블에 등록
    INSERT INTO emp(empno, ename, job, deptno)
    VALUES (a_empno, a_ename, a_job, c_default_deptno) ;
    
    a_msg_out := '신입사원 "' || a_ename || '"이(가) 등록되었습니다.' ;
  END IF ;
  a_rslt_out := TRUE ;
  
EXCEPTION WHEN OTHERS THEN
  ROLLBACK ; -- 모든 변경 취소
  a_msg_out  := '응용 프로그램 오류 발생' || CHR(10) || SQLERRM ;
  a_rslt_out := FALSE ;
END ;
/
