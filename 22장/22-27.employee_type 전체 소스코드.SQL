SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 앞의 예제에서 생성한 테이블을 삭제
DROP TABLE tb_employee ;

REM employee_type 명세
CREATE OR REPLACE TYPE employee_type UNDER person_type (  -- person_type을 상속
  empno    NUMBER(4),         -- 사번
  sal      NUMBER(7,2),       -- 급여
  deptno   NUMBER(2),         -- 부서 번호
  mgr      REF employee_type, -- 상급자 로우에 대한 논리적 포인터

  OVERRIDING MEMBER FUNCTION display RETURN VARCHAR2, -- person_type의 display를 재정의
  MEMBER FUNCTION  dept_name    RETURN VARCHAR2,      -- 부서명
  MEMBER FUNCTION  manager_name RETURN VARCHAR2,      -- 상급자명
  MEMBER PROCEDURE validate_sal(SELF IN OUT employee_type),       -- 급여 정합성 검사
  MEMBER FUNCTION  gross_sal    RETURN VARCHAR2,                  -- 급여 총액 Method 1
  MEMBER FUNCTION  gross_sal(a_incentive number) RETURN VARCHAR2, -- 급여 총액 Method 2
  CONSTRUCTOR FUNCTION  employee_type( -- 생성자
                          a_family_name VARCHAR2, a_given_name VARCHAR2,
                          a_address_1   VARCHAR2, a_address_2  VARCHAR2,
                          a_empno       NUMBER,   a_sal        NUMBER,
                          a_deptno      NUMBER
                        ) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION  employee_type( -- 생성자
                          a_family_name VARCHAR2, a_given_name VARCHAR2,
                          a_address_1   VARCHAR2, a_address_2  VARCHAR2,
                          a_empno       NUMBER,   a_sal        NUMBER
                        ) RETURN SELF AS RESULT
) ;
/

PAUSE

REM employee_type 본체
CREATE OR REPLACE TYPE BODY employee_type
AS
  -- person_type의 display를 재정의(Override)
  OVERRIDING MEMBER FUNCTION display RETURN VARCHAR2
  IS
  BEGIN
    -- 슈퍼타입의 메소드는 (SELF AS 슈퍼타입명). 을 프리픽스로 하여 호출한다.
    RETURN (SELF AS person_type).display ||', 사번:'|| empno ||
           ', 급여:'|| NVL(sal, 0) || ', 부서 번호:' || deptno ;
  END ;

  -- 사원의 부서명 반환
  MEMBER FUNCTION dept_name RETURN VARCHAR2
  IS
    v_dname dept.dname%TYPE ;
  BEGIN
    SELECT a.dname INTO v_dname
      FROM dept a
     WHERE a.deptno = SELF.deptno ;
    RETURN v_dname ;
  END ;

  -- 현재 사원(SELF)의 매니저 사번(mgr)에 해당하는 Row를 찾아 이름 반환
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

  -- 급여 정합성을 검사하고 부당한 부분을 바로잡는다.
  MEMBER PROCEDURE validate_sal(SELF IN OUT employee_type)
  IS
    c_minimum_salary CONSTANT NUMBER := 500 ; -- 최저 임금
  BEGIN
    IF sal < c_minimum_salary THEN
      sal := c_minimum_salary  ;
      DBMS_OUTPUT.PUT_LINE('사원 ' || SELF.full_name() || '(사번 ' || empno ||
        ')의 급여가 최저 임금보다 작습니다. 최저 임금으로 보정되었습니다.') ;
    END IF ;
  END ;

  -- 사원의 급여를 반환
  MEMBER FUNCTION gross_sal RETURN VARCHAR2
  IS
  BEGIN
    RETURN NVL(sal, 0) ;
  END ;

  -- 사원의 급여 + 인센티브를 반환
  MEMBER FUNCTION gross_sal(a_incentive number) RETURN VARCHAR2
  IS
  BEGIN
    RETURN NVL(sal, 0) + NVL(a_incentive,0) ;
  END ;

  -- 기본 생성자가 아닌 추가 생성자 정의
  CONSTRUCTOR FUNCTION employee_type(a_family_name VARCHAR2, a_given_name VARCHAR2,
                                     a_address_1   VARCHAR2, a_address_2  VARCHAR2,
                                     a_empno       NUMBER,   a_sal        NUMBER,
                                     a_deptno      NUMBER) RETURN SELF AS RESULT
  IS
  BEGIN
    family_name := a_family_name ;
    given_name  := a_given_name  ;
    address_1   := a_address_1   ;
    address_2   := a_address_2   ;
    empno       := a_empno       ;
    sal         := a_sal         ;
    deptno      := a_deptno      ;
    mgr         := NULL          ;
    RETURN ;
  END ;

  -- 기본 생성자가 아닌 추가 생성자 정의
  CONSTRUCTOR FUNCTION employee_type(a_family_name VARCHAR2, a_given_name VARCHAR2,
                                     a_address_1   VARCHAR2, a_address_2  VARCHAR2,
                                     a_empno       NUMBER,   a_sal        NUMBER
                                    ) RETURN SELF AS RESULT
  IS
  BEGIN
    family_name := a_family_name ;
    given_name  := a_given_name  ;
    address_1   := a_address_1   ;
    address_2   := a_address_2   ;
    empno       := a_empno       ;
    sal         := a_sal         ;
    deptno      := NULL          ;
    mgr         := NULL          ;
    RETURN ;
  END ;
END ;
/
