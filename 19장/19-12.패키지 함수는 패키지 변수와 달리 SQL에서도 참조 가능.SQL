SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 함수는 패키지 변수와 달리 SQL에서도 참조 가능
SELECT pkg_emp.get_wage(empno) FROM emp WHERE empno = 7788;
