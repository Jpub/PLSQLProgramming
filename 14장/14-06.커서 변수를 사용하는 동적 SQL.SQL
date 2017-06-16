SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 커서 변수를 사용하는 동적 SQL
DECLARE
  TYPE empcur_type IS REF CURSOR;
  v_emp_cur       empcur_type; -- 커서 변수
  emp_rec         emp%ROWTYPE;
  v_stmt          VARCHAR2(200);
  v_empno         NUMBER ;
BEGIN
  -- 실행할 동적 SQL 문:
  v_stmt  := 'SELECT * FROM emp WHERE empno = :empno';
  v_empno := 7788 ;  -- 바인드 변수의 값으로 사용할 사번
  
  -- 쿼리문 v_stmt에 대한 v_emp_cur 커서를 OPEN
  OPEN v_emp_cur FOR v_stmt USING v_empno ;

  -- 결과 로우를 한 건씩 FETCH
  LOOP
    FETCH v_emp_cur INTO emp_rec;
    EXIT WHEN v_emp_cur%NOTFOUND;
  END LOOP;

  -- 사용 완료된 커서를 CLOSE
  CLOSE v_emp_cur;
END;
/
