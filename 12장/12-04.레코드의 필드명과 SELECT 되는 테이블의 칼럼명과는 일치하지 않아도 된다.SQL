SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 레코드의 필드명과 SELECT 되는 테이블의 칼럼명과는 일치하지 않아도 된다.
DECLARE
  TYPE emp_type IS RECORD (
    emp_no    NUMBER(4),      -- empno 대신 emp_no 사용
    emp_name  emp.ename%TYPE, -- ename 대신 emp_name 사용
    job       VARCHAR2(10)    -- 데이터 타입과 길이는 호환성만 있으면 된다.
  ) ;
  v_emp emp_type ;
BEGIN
  -- SELECT되는 칼럼명과 이 값을 할당할 레코드 필드명이 같지 않아도 전혀 문제가 없다.
  SELECT empno, ename, job
    INTO v_emp
    FROM emp
   WHERE empno = 7788 ;

  DBMS_OUTPUT.PUT_LINE('EMPNO = ' || v_emp.emp_no) ;
  DBMS_OUTPUT.PUT_LINE('ENAME = ' || v_emp.emp_name) ;
  DBMS_OUTPUT.PUT_LINE('JOB   = ' || v_emp.job) ;
END ;
/
