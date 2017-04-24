SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM %ROWTYPE을 사용하면 프로그램이 간단해 진다.
DECLARE
  v_emprec  emp%ROWTYPE ; -- 레코드 변수 선언
BEGIN
  v_emprec.empno := 7788 ;
  SELECT *
    INTO v_emprec  -- 레코드 변수 사용
    FROM emp
   WHERE empno = v_emprec.empno ;
   DBMS_OUTPUT.PUT_LINE('이름     : '||v_emprec.ename) ;
   DBMS_OUTPUT.PUT_LINE('부서 번호: '||v_emprec.deptno) ;
END ;
/
