SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 관계형 테이블에 칼럼 객체로 저장
DROP TABLE tb_emp ;
CREATE TABLE tb_emp (
  person  person_type,       -- 칼럼 객체 선언
  empno   NUMBER(4),         -- 사번
  sal     NUMBER(7,2),       -- 급여
  deptno  NUMBER(2),         -- 부서 번호
  mgr     REF employee_type  -- 상급자에 대한 참조
) ;
