SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM SELECT 문의 결과 저장을 위한 일반적인 변수 선언 방법
REM 변수를 선언하고 사용해야 하는 불편함이 있고, 
REM 프로그램의 길이가 길어진다.
DECLARE
  v_ename     emp.ename   %TYPE ;
  v_hiredate  emp.hiredate%TYPE ;
  v_deptno    emp.ename   %TYPE ;
  v_sal       emp.sal     %TYPE ;
BEGIN
  BEGIN
    SELECT ename, 
           hiredate, 
           deptno, 
           sal
      INTO v_ename,
           v_hiredate,
           v_deptno,
           v_sal 
      FROM emp
     WHERE empno = 7788 ;
    DBMS_OUTPUT.PUT_LINE(v_ename   ||', '||
                         v_hiredate||', '||
                         v_deptno  ||', '||
                         v_sal) ;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    NULL ;
  END ;
END ;
/
