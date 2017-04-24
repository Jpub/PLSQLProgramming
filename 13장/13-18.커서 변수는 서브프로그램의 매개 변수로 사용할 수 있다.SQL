SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 커서 변수는 서브 프로그램의 매개 변수로 사용할 수 있다.
DECLARE
  TYPE emp_rec IS RECORD (
    empno emp.empno%TYPE,
    ename emp.ename%TYPE
  );
  TYPE     emp_cursor_type IS REF CURSOR RETURN emp_rec; -- 레코드 타입의 커서 변수
  v_empcur emp_cursor_type;                              -- 커서 변수
  
  PROCEDURE print_emp(a_empcur emp_cursor_type) IS    -- 커서 변수를 프로시저의 매개변수로 사용
    v_emprec emp_rec ;
  BEGIN
    LOOP
      FETCH a_empcur INTO v_emprec ;
      EXIT WHEN a_empcur%NOTFOUND ;
      DBMS_OUTPUT.PUT_LINE('EMPNO=' ||v_emprec.empno||', ENAME=' || v_emprec.ename) ;
    END LOOP ;
  END ;
BEGIN
  OPEN v_empcur FOR SELECT empno, ename FROM EMP ;
  print_emp(v_empcur) ; -- 커서를 매개변수로 전달
  CLOSE v_empcur ;
END;
/
