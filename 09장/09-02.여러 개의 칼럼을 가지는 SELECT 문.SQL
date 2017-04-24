SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 여러 개 칼럼 SELECT
DECLARE
  v_empno  emp.empno %TYPE ;
  v_ename  emp.ename %TYPE ;
  v_deptno emp.deptno%TYPE ;
  v_job    emp.job   %TYPE ;
BEGIN
  SELECT EMPNO,   ENAME,   DEPTNO,   JOB
    INTO v_empno, v_ename, v_deptno, v_job -- 출력 변수의 개수는 SELECT 되는 칼럼의 수와 같다.
    FROM emp 
   WHERE empno = 7788 ;
END ;
/
