SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 저장 프로시저
CREATE OR REPLACE PROCEDURE raise_salary(a_empno NUMBER, a_amt NUMBER)
-- 사원의 급여를 인상하는 프로시저
IS
BEGIN
  -- 급여를 인상한다.
  IF a_amt IS NOT NULL 
  THEN
    UPDATE emp
       SET sal = sal + a_amt
     WHERE empno = a_empno ;
  END IF ;
END ;
/
