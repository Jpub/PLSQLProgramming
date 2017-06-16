SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 로우 앵커를 사용하여 재작성
DECLARE
  v_emp emp%ROWTYPE ; -- 로우 앵커를 사용한 레코드 변수 선언
BEGIN
  -- 레코드의 필드에 값을 할당
  v_emp.empno := 9000 ;
  v_emp.ename := '홍길동' ;
  v_emp.job   := '의적' ;

  DBMS_OUTPUT.PUT_LINE('EMPNO = ' || v_emp.empno) ;
  DBMS_OUTPUT.PUT_LINE('ENAME = ' || v_emp.ename) ;
  DBMS_OUTPUT.PUT_LINE('JOB   = ' || v_emp.job  ) ;
END ;
/

