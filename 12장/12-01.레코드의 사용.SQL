SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 기본 예제
DECLARE
  TYPE emp_type IS RECORD ( -- 세 개의 필드를 가지는 레코드 선언
    empno  NUMBER(4) NOT NULL := 0, -- NOT NULL 필드는 반드시 초깃값을 지정해야 함
    ename  emp.ename%TYPE,          -- 칼럼 앵커를 사용한 필드 선언
    job    VARCHAR2(9)              -- 필드의 데이터 타입을 직접 지정
  ) ;
  v_emp emp_type ;                 -- 타입을 사용하여 변수(인스턴스) 선언
BEGIN
  -- 레코드의 필드에 값을 할당
  v_emp.empno := 9000 ;
  v_emp.ename := '홍길동' ;
  v_emp.job   := '의적' ;

  DBMS_OUTPUT.PUT_LINE('EMPNO = ' || v_emp.empno) ;
  DBMS_OUTPUT.PUT_LINE('ENAME = ' || v_emp.ename) ;
  DBMS_OUTPUT.PUT_LINE('JOB   = ' || v_emp.job  ) ;
END ;
/
