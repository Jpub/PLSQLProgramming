SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 메소드 중복정의 명세
CREATE OR REPLACE TYPE employee_type UNDER person_type (  -- person_type을 상속
  empno  NUMBER(4),         -- 사번
  sal    NUMBER(7,2),       -- 급여
  deptno NUMBER(2),         -- 부서번호
  mgr    REF employee_type, -- 상급자 로우에 대한 논리적 포인터
  
  MEMBER FUNCTION gross_sal RETURN VARCHAR2,                    -- 급여 총액 Method 1
  MEMBER FUNCTION gross_sal(a_incentive number) RETURN VARCHAR2 -- 급여 총액 Method 2
) ;
/

PAUSE

REM 메소드 중복정의 본체
CREATE OR REPLACE TYPE BODY employee_type
AS
  -- 중복 정의 1: 사원의 급여를 반환
  MEMBER FUNCTION gross_sal RETURN VARCHAR2
  IS 
  BEGIN 
    RETURN NVL(sal, 0) ; 
  END ; 
  
  -- 중복 정의 2: 사원의 급여 + 인센티브를 반환
  MEMBER FUNCTION gross_sal(a_incentive number) RETURN VARCHAR2
  IS 
  BEGIN 
    RETURN NVL(sal, 0) + NVL(a_incentive,0) ; 
  END ; 
END ;
/
