SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 메소드 재정의 본체부
CREATE OR REPLACE TYPE BODY employee_type
AS
  -- person_type의 display를 재정의
  OVERRIDING MEMBER FUNCTION display RETURN VARCHAR2
  IS
  BEGIN
    -- 슈퍼타입의 메소드는 (SELF AS 슈퍼타입명). 을 프리픽스로 하여 호출한다.
    RETURN (SELF AS person_type).display ||', 사번:'|| empno ||
           ', 급여:'|| NVL(sal, 0) || ', 부서 번호:' || deptno ;
  END ;
END ;
/
