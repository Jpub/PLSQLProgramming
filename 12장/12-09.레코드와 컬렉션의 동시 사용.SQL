SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 레코드와 컬렉션을 혼합하여 동시에 사용하는 예제
DECLARE
  TYPE city_tab_type IS TABLE OF VARCHAR2(64) INDEX BY PLS_INTEGER ; -- 컬렉션
  TYPE name_rec IS RECORD (                                      -- 레코드
    first_name  VARCHAR2(30),
    last_name   VARCHAR2(30)
  ) ;
  TYPE emp_rec IS RECORD (                                       -- 컬렉션과 레코드의 혼합
    empno emp.empno%TYPE DEFAULT 1000,
    ename name_rec,      -- 레코드가 레코드의 필드가 될 수 있다.
    city  city_tab_type  -- 컬렉션이 레코드의 필드가 될 수 있다.
  );
  TYPE people_type IS VARRAY(10) OF name_rec ; -- 레코드의 컬렉션이 가능하다. 
  TYPE emp_type    IS VARRAY(10) OF emp_rec  ; -- 레코드의 컬렉션
BEGIN
  NULL ;
END;
/
