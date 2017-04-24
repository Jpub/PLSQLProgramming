SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 사용자 정의 예외명
DECLARE
  no_emp_found EXCEPTION ; -- 사용자 지정 예외 선언
  v_cnt        PLS_INTEGER ;
  v_empno      emp.empno%TYPE ;
BEGIN
  v_empno := -1 ; -- 존재하지 않는 사원 번호
  -- 사원이 존재하는 지 확인한다.
  SELECT COUNT(*) INTO v_cnt
    FROM emp
   WHERE EMPNO = v_empno ;
  IF v_cnt = 0 THEN -- 사원이 존재하지 않으면 사용자 예외 발생
    RAISE no_emp_found ;
  END IF ;
  UPDATE emp
     SET SAL = SAL*1.05
   WHERE EMPNO = v_empno ;
EXCEPTION WHEN no_emp_found THEN -- 사용자 지정 예외를 처리
  DBMS_OUTPUT.PUT_LINE('처리할 사원이 존재하지 않습니다.') ;
END ;
/
