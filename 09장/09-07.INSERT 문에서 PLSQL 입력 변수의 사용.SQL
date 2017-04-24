SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 앞에서 삽입한 로우를 삭제 
DELETE FROM emp WHERE empno = 9000 ; 

REM INSERT문에서 PL/SQL 입력 변수의 사용
DECLARE
  v_empno  emp.empno%TYPE ;
  v_ename  emp.ename%TYPE ;
  v_deptno emp.deptno%TYPE ;
BEGIN
  v_empno  := 9000 ;
  v_ename  := '홍길동';
  v_deptno := 30;

  INSERT INTO emp(empno,   ename,   hiredate, deptno)
  VALUES         (v_empno, v_ename, SYSDATE,  v_deptno) ; -- PL/SQL 변수 사용
  DBMS_OUTPUT.PUT_LINE('INSERT 건수: '||SQL%ROWCOUNT) ;   -- 변경된 건수 출력
  COMMIT ;
END ;
/
