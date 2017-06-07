SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 저장 프로시저의 구조
CREATE OR REPLACE PROCEDURE raise_bonus(a_empno NUMBER, a_amt NUMBER)
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
      -- 사원이 존재하지 않을 경우는 수행을 중단하고 복귀한다. 반환값이 없는 것이 함수와 다른 점이다.
      RETURN ;
  END ;
  
  -- 보너스를 인상한다.
  IF a_amt IS NOT NULL 
  THEN
    MERGE INTO bonus
    USING DUAL
       ON (bonus.ename = v_ename)
     WHEN MATCHED THEN      -- 기존 보너스가 있는 경우는 인상할 값을 더한다.
       UPDATE SET comm = comm + a_amt
     WHEN NOT MATCHED THEN  -- 기존 보너스가 없는 경우는 새 로우를 추가
       INSERT (ename, comm) 
       VALUES (v_ename, a_amt) ;
  END IF ;
END ;
/
