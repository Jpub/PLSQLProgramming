SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM DELETE문에서 PL/SQL 입력 변수의 사용
DECLARE
  v_empno emp.empno%TYPE := 9000 ;
BEGIN
  DELETE FROM emp
   WHERE empno = v_empno ;
  DBMS_OUTPUT.PUT_LINE('DELETE 건수: '||SQL%ROWCOUNT) ; -- 변경된 건수 출력
  COMMIT ;
END ;
/
