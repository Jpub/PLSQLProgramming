SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 컬렉션을 반환하는 함수
CREATE OR REPLACE FUNCTION get_emp_list(a_deptno NUMBER)
  RETURN empno_arr_type
IS
  v_empno_arr empno_arr_type ;
BEGIN
  SELECT empno
    BULK COLLECT INTO v_empno_arr 
    FROM emp
   WHERE deptno = a_deptno
   ORDER BY empno;
  RETURN v_empno_arr ;
END ;
/
