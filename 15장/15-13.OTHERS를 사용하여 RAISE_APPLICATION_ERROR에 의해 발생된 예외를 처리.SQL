SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM RAISE_APPLICATION_ERROR를 사용하여 발생시킨 예외를 OTHERS로 처리
REM 예외가 발생하지 않음
DECLARE
  v_deptno dept.deptno%TYPE := 30 ;
  v_empno  emp.empno  %TYPE := 7900 ;
  v_dname  dept.dname %TYPE ;
  v_ename  emp.ename  %TYPE ;
BEGIN
  SELECT MAX(dname) dname
    INTO v_dname
    FROM dept
   WHERE deptno = v_deptno ;
  IF v_dname IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, '부서 번호 '||v_deptno||'이 존재하지 않습니다.') ;
  END IF ;

  BEGIN
    SELECT ename
      INTO v_ename
      FROM emp
     WHERE empno = v_empno ;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20002, '사원 번호 '||v_empno||'이 존재하지 않습니다.') ;
  END ;
  
  DBMS_OUTPUT.PUT_LINE('부서와 사원 데이터에 이상이 없습니다.') ;
  
EXCEPTION WHEN OTHERS THEN
  IF SQLCODE = -20001 THEN
    DBMS_OUTPUT.PUT_LINE('부서 오류') ;
    DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
  ELSIF SQLCODE = -20002 THEN
    DBMS_OUTPUT.PUT_LINE('사원 오류') ;
    DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
  END IF ;
END ;
/

PAUSE

REM RAISE_APPLICATION_ERROR를 사용하여 발생시킨 예외를 OTHERS로 처리
REM 존재하지 않는 부서명으로 인한 예외 발생
DECLARE
  v_deptno dept.deptno%TYPE := 50 ; -- 부서번호 50은 존재하지 않음
  v_empno  emp.empno  %TYPE := 7900 ;
  v_dname  dept.dname %TYPE ;
  v_ename  emp.ename  %TYPE ;
BEGIN
  SELECT MAX(dname) dname
    INTO v_dname
    FROM dept
   WHERE deptno = v_deptno ;
  IF v_dname IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, '부서 번호 '||v_deptno||'이 존재하지 않습니다.') ;
  END IF ;

  BEGIN
    SELECT ename
      INTO v_ename
      FROM emp
     WHERE empno = v_empno ;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20002, '사원 번호 '||v_empno||'이 존재하지 않습니다.') ;
  END ;
  
  DBMS_OUTPUT.PUT_LINE('부서와 사원 데이터에 이상이 없습니다.') ;
  
EXCEPTION WHEN OTHERS THEN
  IF SQLCODE = -20001 THEN
    DBMS_OUTPUT.PUT_LINE('부서 오류') ;
    DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
  ELSIF SQLCODE = -20002 THEN
    DBMS_OUTPUT.PUT_LINE('사원 오류') ;
    DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
  END IF ;
END ;
/

PAUSE

REM RAISE_APPLICATION_ERROR를 사용하여 발생시킨 예외를 OTHERS로 처리
REM 존재하지 않는 사번으로 인한 예외 발생
DECLARE
  v_deptno dept.deptno%TYPE := 30 ;
  v_empno  emp.empno  %TYPE := 7901 ; -- 사번 7901은 존재하지 않음
  v_dname  dept.dname %TYPE ;
  v_ename  emp.ename  %TYPE ;
BEGIN
  SELECT MAX(dname) dname
    INTO v_dname
    FROM dept
   WHERE deptno = v_deptno ;
  IF v_dname IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, '부서 번호 '||v_deptno||'이 존재하지 않습니다.') ;
  END IF ;

  BEGIN
    SELECT ename
      INTO v_ename
      FROM emp
     WHERE empno = v_empno ;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20002, '사원 번호 '||v_empno||'이 존재하지 않습니다.') ;
  END ;
  
  DBMS_OUTPUT.PUT_LINE('부서와 사원 데이터에 이상이 없습니다.') ;
  
EXCEPTION WHEN OTHERS THEN
  IF SQLCODE = -20001 THEN
    DBMS_OUTPUT.PUT_LINE('부서 오류') ;
    DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
  ELSIF SQLCODE = -20002 THEN
    DBMS_OUTPUT.PUT_LINE('사원 오류') ;
    DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
  END IF ;
END ;
/
