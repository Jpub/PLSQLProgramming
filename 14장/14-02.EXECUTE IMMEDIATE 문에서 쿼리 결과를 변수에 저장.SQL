SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 쿼리 결과를 변수에 저장
DECLARE
  v_query CONSTANT VARCHAR2(200) := 'SELECT empno, ename
                                       FROM emp
                                      WHERE empno = 7788' ;
  TYPE emp_type IS RECORD (
      empno emp.empno%TYPE,
      ename emp.ename%TYPE
  ) ;
  v_rec   emp_type ;        -- 레코드 변수
  v_empno emp.empno%TYPE ;  -- 스칼라 변수
  v_ename emp.ename%TYPE ;  -- 스칼라 변수
  
  TYPE emp_arr IS TABLE OF emp_type ;
  v_emps emp_arr ;          -- 레코드 컬렉션 변수
BEGIN
  -- INTO 스칼라 변수
  EXECUTE IMMEDIATE v_query INTO v_empno, v_ename;
  DBMS_OUTPUT.PUT_LINE(v_empno||', '||v_ename) ;
  
  -- INTO 레코드 변수
  EXECUTE IMMEDIATE v_query INTO v_rec;
  DBMS_OUTPUT.PUT_LINE(v_rec.empno||', '||v_rec.ename) ;
  
  -- INTO 레코드 컬렉션 변수
  EXECUTE IMMEDIATE 'SELECT empno, ename FROM emp' BULK COLLECT INTO v_emps ;
  DBMS_OUTPUT.PUT_LINE('사원 수: '||v_emps.COUNT) ;
END ;
/
