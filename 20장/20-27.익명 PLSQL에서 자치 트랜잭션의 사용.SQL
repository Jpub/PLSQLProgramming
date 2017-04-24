SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 익명 PL/SQL에서 자치 트랜잭션의 사용
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION ; -- 자치 트랜잭션 선언.
  v_empno NUMBER := 7788 ;
  v_amt   NUMBER := 100 ;
BEGIN
  UPDATE emp
     SET sal = sal + v_amt
   WHERE empno = v_empno ;
  COMMIT ; -- 트랜잭션을 COMMIT한다. 메인 트랜잭션은 COMMIT되지 않는다.
END ;
/
