SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 레코드의 모든 필드를 한 번에 초기화 하는 기능은 기본으로 제공되지 않는다.
REM 필요하면 유사한 기능을 가지는 함수를 만들어 사용해야 한다.
DECLARE
  TYPE emp_rec IS RECORD (
    empno emp.empno%TYPE,
    ename emp.ename%TYPE
  );
  
  v_emp emp_rec;
  
  -- 생성자 역할을 하는 함수를 만든다.
  FUNCTION make_emp_rec(a_empno emp.empno%TYPE,
                        a_ename emp.ename%TYPE) RETURN emp_rec
  IS
    v_rec emp_rec ;
  BEGIN
    v_rec.empno := a_empno ;
    v_rec.ename := a_ename ;
    RETURN v_rec ;
  END ;

BEGIN
  v_emp := make_emp_rec('9000', '홍길동') ; -- 생성자 역할의 함수를 사용한다.
END;
/
