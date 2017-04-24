SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 서브프로그램 정의의 중첩
CREATE OR REPLACE PROCEDURE raise_bonus2(a_empno NUMBER, a_amt NUMBER)
-- 테이블 bonus에 사원의 커미션 값을 인상하는 프로시저
IS
  v_emp_name emp.ename%TYPE ;
  
  -- 사원의 이름을 얻는 함수. raise_bonus2 내부에 중첩되어 정의됨
  FUNCTION get_ename(a_empno NUMBER) RETURN VARCHAR2
  IS
    v_ename emp.ename%TYPE ;
  BEGIN
    SELECT ename 
      INTO v_ename
      FROM emp
     WHERE empno = a_empno ;
    RETURN v_ename ;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL ;
  END ;
  
  -- 사원의 보너스를 인상하는 프로시저. raise_bonus2 내부에 중첩되어 정의됨
  PROCEDURE raise_bonus(a_ename VARCHAR2, a_amt NUMBER)
  IS
  BEGIN
    MERGE INTO bonus
    USING DUAL
       ON (bonus.ename = a_ename)
     WHEN MATCHED THEN      -- 기존 보너스가 있는 경우는 인상할 값을 더한다.
       UPDATE SET comm = comm + a_amt
     WHEN NOT MATCHED THEN  -- 기존 보너스가 없는 경우는 새 로우를 추가
       INSERT (ename, comm) 
       VALUES (a_ename, a_amt) ;
  END ;
BEGIN
  v_emp_name := get_ename(a_empno) ;
  IF a_amt IS NOT NULL 
  THEN
    raise_bonus(v_emp_name, a_amt) ;
  END IF ;
END ;
/
