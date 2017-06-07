SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 예외 처리에서 주로 하는 작업
REM 1. 트랜잭션 마무리(주로 ROLLBACK을 수행함)
DECLARE
  v_sal  NUMBER ;
  v_comm NUMBER ;
BEGIN
  -- 정상 수행
  SELECT sal INTO v_sal 
    FROM emp
   WHERE ename = 'SMITH' ;
   
  UPDATE emp 
     SET comm = v_sal * 0.05
   WHERE ename = 'SMITH' ;
  
  -- SELECT 문에서 NO_DATA_FOUND 예외 발생(ENAME='Martin'은 없음).
  SELECT sal INTO v_sal
    FROM emp
   WHERE ename = 'Martin' ;
   
  UPDATE emp 
     SET comm = v_sal * 0.05
   WHERE ename = 'Martin' ;
   
-- NO_DATA_FOUND 예외 처리기
EXCEPTION WHEN NO_DATA_FOUND THEN
  -- 트랜잭션 취소
  ROLLBACK ;
END ;
/
