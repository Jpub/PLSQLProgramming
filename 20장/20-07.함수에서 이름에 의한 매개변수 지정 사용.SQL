SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 함수에서 이름에 의한 매개변수 지정 사용
SELECT ename, empno, sal, comm
     , get_wage(empno) 급여               -- 위치에 의한 매개변수 지정 
  FROM emp 
 WHERE deptno = 30 
   AND get_wage(a_empno => empno) >= 2000 -- 이름에 의한 매개변수 지정
 ORDER BY ename;
