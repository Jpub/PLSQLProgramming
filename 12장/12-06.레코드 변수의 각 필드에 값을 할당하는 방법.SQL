SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 기본 예제
REM 레코드 변수의 필드는 필드별로 값을 할당해야 한다.
DECLARE
  TYPE emp_rec IS RECORD (
    empno emp.empno%TYPE,
    ename emp.ename%TYPE
  );
 
  v_emp1 emp_rec;
  v_emp2 emp_rec;
  v_emp3 emp_rec;
BEGIN
  v_emp1.empno := 9000 ; v_emp1.ename := '홍길동'; -- 1. 필드별로 값을 할당
  v_emp2 := v_emp1;                                -- 2. 다른 레코드를 복사
  SELECT empno, ename INTO v_emp3                  -- 3. 쿼리 결과를 레코드에 저장
    FROM emp
   WHERE empno = 7788;
END;
/
