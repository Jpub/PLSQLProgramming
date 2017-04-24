SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM UPDATE 문에서 PL/SQL 입력 변수의 사용
DECLARE
  v_empno  emp.empno%TYPE := 9000 ;
  v_deptno emp.deptno%TYPE := 40 ;
BEGIN
  UPDATE emp
     SET deptno = v_deptno  -- 입력 변수
   WHERE empno  = v_empno ; -- 입력 변수
  DBMS_OUTPUT.PUT_LINE('UPDATE 건수: '||SQL%ROWCOUNT) ; -- 변경된 건수 출력
  COMMIT ;
END ;
/
