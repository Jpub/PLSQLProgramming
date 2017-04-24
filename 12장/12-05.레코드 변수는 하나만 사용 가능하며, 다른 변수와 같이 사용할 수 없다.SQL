SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 레코드 변수는 하나만 사용 가능하며, 다른 변수와 같이 사용할 수 없다.
DECLARE
  -- 테이블 emp의 일부 칼럼을 레코드로 선언
  TYPE emp_basic_info_type IS RECORD (
    empno    emp.empno   %TYPE,
    ename    emp.ename   %TYPE,
    job      emp.job     %TYPE,
    mgr      emp.mgr     %TYPE,
    hiredate emp.hiredate%TYPE,
    deptno   emp.deptno  %TYPE
  ) ;           
  -- 테이블 emp의 나머지 칼럼을 레코드로 선언
  TYPE emp_salary_info_type IS RECORD (
    sal      emp.sal     %TYPE,
    comm     emp.comm    %TYPE
  ) ;
  
  -- 레코드 변수
  v_emp_basic  emp_basic_info_type ;
  v_emp_salary emp_salary_info_type ;
  
  -- 개별 스칼라 변수
  v_sal    emp.sal     %TYPE ;
  v_comm   emp.comm    %TYPE ;
BEGIN
  -- 두 개의 레코드 변수를 INTO절에 사용할 수는 없다.
  -- 파싱 단계에서 다음의 오류가 발생한다.
  -- PLS-00494: coercion into multiple record targets not supported
  SELECT empno, ename, job, mgr, hiredate, deptno, sal, comm
    INTO v_emp_basic, v_emp_salary
    FROM emp
   WHERE empno = 7788 ;
   
  -- 레코드 변수와 스칼라 변수를 혼합하여 INTO절에 사용할 수도 없다.
  -- 파싱 단계에서 다음의 오류가 발생한다.
  -- PLS-00494: coercion into multiple record targets not supported
  SELECT empno, ename, job, mgr, hiredate, deptno, sal, comm
    INTO v_emp_basic, v_sal, v_comm
    FROM emp
   WHERE empno = 7788 ;
END ;
/
