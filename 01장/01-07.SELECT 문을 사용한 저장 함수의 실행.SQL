SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM SELECT 문에서 함수 실행
SELECT deptno  부서번호
     , dname   부서명
     , loc     위치
     , get_dept_employee_count(deptno) 사원수
  FROM dept ;
