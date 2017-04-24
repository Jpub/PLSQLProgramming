SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 저장 함수 실행: SELECT 문 사용
SELECT ename, empno, sal, comm, get_wage(empno) 급여합계
  FROM emp
 WHERE deptno = 30
   AND get_wage(empno) >= 2000
 ORDER BY ename;
