SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 묵시적 커서 FOR LOOP
DECLARE
  v_total_pay NUMBER := 0 ; -- 급여 합계 계산
BEGIN
  -- 묵시적 커서 FOR LOOP 사용
  FOR t IN (SELECT ename, hiredate, deptno, NVL(sal,0)+NVL(comm,0) total_pay
              FROM emp
             WHERE deptno = 10)
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
