SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 중복 정의된 서브 프로그램은 호출되는 매개변수 데이터 타입에 따라서 서로 다른 버전이 호출됨
COL 사번매개변수버전 FORMAT A20
COL 이름매개변수버전 FORMAT A20
SELECT pkg_emp.emp_dept_name(7788)  AS 사번매개변수버전 
     , pkg_emp.emp_dept_name('SCOTT') AS 이름매개변수버전 
  FROM DUAL ;
