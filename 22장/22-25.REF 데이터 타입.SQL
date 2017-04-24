SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

DROP TABLE tb_employee ;

REM REF 데이터 타입을 사용한 객체 타입 명세
CREATE OR REPLACE TYPE employee_type UNDER person_type (  -- person_type을 상속
  empno    NUMBER(4),         -- 사번
  sal      NUMBER(7,2),       -- 급여
  deptno   NUMBER(2),         -- 부서 번호
  mgr      REF employee_type, -- 상급자 로우에 대한 논리적 포인터
  
  MEMBER   FUNCTION  manager_name RETURN VARCHAR2  -- 상급자 명
) ;
/

PAUSE

REM REF 데이터 타입을 사용한 객체 타입 본체
CREATE OR REPLACE TYPE BODY employee_type
AS
  -- 사원(SELF)의 매니저 사번(mgr)에 해당하는 Row를 찾아 이름 반환
  MEMBER FUNCTION manager_name RETURN VARCHAR2  -- 상급자명
  IS
    v_mgr employee_type ;
  BEGIN
    BEGIN
      SELECT DEREF(mgr)  -- DEREF는 참조(REF)를 실제 값으로 바꿔주는 함수다.
        INTO v_mgr 
        FROM DUAL ;
      RETURN v_mgr.full_name() ;
    EXCEPTION WHEN OTHERS THEN
      RETURN NULL ; -- 상급자가 없으면 NULL 반환
    END ;
  END ;
END ;
/
