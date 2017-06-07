SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 명백히 한 건만을 조회하는 경우라도 
REM 프로그램을 간단히 하기 위해 FOR LOOP 사용
BEGIN
  FOR t IN (SELECT ename, 
                   hiredate, 
                   deptno, 
                   sal
              FROM emp
             WHERE empno = 7788)
  LOOP
    DBMS_OUTPUT.PUT_LINE(t.ename   ||', '||
                         t.hiredate||', '||
                         t.deptno  ||', '||
                         t.sal) ;
  END LOOP ;
END ;
/
