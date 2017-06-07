SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지에서 자치 트랜잭션의 사용
CREATE OR REPLACE PACKAGE pkg_emp
IS  -- 패키지 명세에는 자치 트랜잭션 선언이 없다.
  PROCEDURE raise_salary(a_empno NUMBER, a_amt NUMBER) ;
END ;
/

CREATE OR REPLACE PACKAGE BODY pkg_emp
IS
  PROCEDURE raise_salary(a_empno NUMBER, a_amt NUMBER)
  -- 사원의 급여를 인상하는 프로시저
  IS
    -- 패키지 본체의 서브프로그램에서 자치 트랜잭션을 선언한다.
    PRAGMA AUTONOMOUS_TRANSACTION ;
  BEGIN
    -- 급여를 인상한다.
    IF a_amt IS NOT NULL 
    THEN
      UPDATE emp
         SET sal = sal + a_amt
       WHERE empno = a_empno ;
      COMMIT ; -- 트랜잭션을 COMMIT한다. 메인 트랜잭션은 COMMIT되지 않는다.
    END IF ;
  END ;
END ;
/
