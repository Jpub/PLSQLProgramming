SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

DECLARE
  CURSOR emp_cursor IS
    SELECT empno, ename, job, sal
    FROM emp 
    WHERE sal < 1500
    FOR UPDATE; -- 조회와 동시에 LOCK을 건다.
BEGIN
  FOR e IN emp_cursor
  LOOP
    IF e.job = 'SALESMAN' THEN
      UPDATE emp
         SET comm = comm * 1.1
       WHERE CURRENT OF emp_cursor ; -- 현재 커서가 위치한 로우만을 UPDATE
    END IF;
  END LOOP;
END;
/
