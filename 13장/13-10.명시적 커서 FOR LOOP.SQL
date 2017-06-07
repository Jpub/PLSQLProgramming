SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

DECLARE
  v_total_pay NUMBER := 0 ;
  -- 앞의 예제에서 FOR문에 포함되었던 SELECT문을 커서 문으로 선언하여 사용
  CURSOR emp_cursor IS
   SELECT ename, hiredate, deptno, nvl(sal,0)+nvl(comm,0) total_pay
     FROM emp
    WHERE deptno = 10 ;
BEGIN
  -- "(SELECT문)" 대신 위에서 선언한 커서명 emp_cursor를 사용
  FOR t IN emp_cursor
  LOOP
    DBMS_OUTPUT.PUT_LINE(RPAD(t.ename, 6,' ')||
        ', 입사 일자='|| TO_CHAR(t.hiredate, 'YYYY-MM-DD')||
        ', 급여='||t.total_pay) ;
    v_total_pay := v_total_pay + NVL(t.total_pay, 0) ;
  END LOOP ;
  DBMS_OUTPUT.PUT_LINE('---------------------------') ;
  DBMS_OUTPUT.PUT_LINE('급여 합계= $'||v_total_pay) ;
END ;
/
