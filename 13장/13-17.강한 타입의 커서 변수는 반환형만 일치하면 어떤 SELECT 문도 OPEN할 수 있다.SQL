SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 강한 타입의 커서 변수는 반환되는 칼럼의 개수와 타입만 일치하면
REM 어떤 SELECT 문에 대해서도 OPEN 가능하다.
DECLARE
  TYPE emp_rec IS RECORD (
    empno emp.empno%TYPE,
    ename emp.ename%TYPE,
    sal   emp.sal  %TYPE
  );
  v_emprec emp_rec ; -- FETCH 결과를 저장할 레코드 변수
  TYPE     emp_cursor_type IS REF CURSOR RETURN emp_rec; -- 커서 타입
  v_empcur emp_cursor_type;                              -- 커서 변수
BEGIN
  -- 첫 번째 SQL문에 대해 커서 변수를 OPEN
  OPEN v_empcur FOR SELECT empno, ename, sal FROM EMP WHERE deptno = 10 ;
  LOOP
    FETCH v_empcur INTO v_emprec ;
    EXIT WHEN v_empcur%NOTFOUND ;
    DBMS_OUTPUT.PUT_LINE('EMPNO='||v_emprec.empno||', ENAME='||v_emprec.ename||
                         ', SAL='||v_emprec.sal) ;
  END LOOP ;
  CLOSE v_empcur ;
  
  DBMS_OUTPUT.PUT_LINE(' ') ;
  
  -- 두 번째 SQL문에 대해 커서 변수를 OPEN
  OPEN v_empcur FOR SELECT empno, ename, sal+NVL(comm,0) FROM EMP WHERE deptno = 20 ;
  LOOP
    FETCH v_empcur INTO v_emprec ;
    EXIT WHEN v_empcur%NOTFOUND ;
    DBMS_OUTPUT.PUT_LINE('EMPNO='||v_emprec.empno||', ENAME='||v_emprec.ename||
                         ', SAL='||v_emprec.sal) ;
  END LOOP ;
  CLOSE v_empcur ;
END;
/
