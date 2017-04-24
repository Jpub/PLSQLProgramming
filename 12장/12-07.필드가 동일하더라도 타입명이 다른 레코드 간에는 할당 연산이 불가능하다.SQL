SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 필드가 동일하더라도 타입명이 다른 레코드 간에는 할당 연산이 불가능하다.
REM 다음 예제에서 emp_rec1과 emp_rec2는 다른 타입이므로 
REM 할당 연산을 사용할 수 없다.
DECLARE
  TYPE emp_rec1 IS RECORD (
    empno emp.empno%TYPE,
    ename emp.ename%TYPE
  );
  TYPE emp_rec2 IS RECORD (
    empno emp.empno%TYPE,
    ename emp.ename%TYPE
  );

  v_emp1 emp_rec1;
  v_emp2 emp_rec2;
BEGIN
  v_emp1 := v_emp2 ; -- 필드의 데이터 타입이 동일해도 레코드 타입이 다르므로 오류
END;
/
