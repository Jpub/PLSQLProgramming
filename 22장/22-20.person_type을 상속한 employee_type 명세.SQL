SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM person_type을 상속한 employee_type 명세부
CREATE OR REPLACE TYPE employee_type UNDER person_type (
             -- person_type을 상속하여 employee_type 정의
  empno    NUMBER(4),         -- 사번
  sal      NUMBER(7,2),       -- 급여
  deptno   NUMBER(2),         -- 부서 번호
  mgr      REF employee_type  -- 상급자 로우에 대한 논리적 포인터
) ;
/
