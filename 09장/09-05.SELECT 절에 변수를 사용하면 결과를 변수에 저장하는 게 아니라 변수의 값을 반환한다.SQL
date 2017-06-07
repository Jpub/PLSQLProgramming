SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 사번 7788은 SCOTT이다.
SELECT ename
  FROM emp
 WHERE empno = 7788;

PAUSE

REM SELECT절에 변수를 사용하면 결과가 변수에 저장되는 것이 아니라
REM 변수의 값을 SELECT하여 INTO 절의 변수에 저장한다.
DECLARE
  v_name   emp.ename%TYPE ;
  v_ename  emp.ename%TYPE ;
BEGIN
  v_name := 'TIGER' ;
  SELECT v_name
    INTO v_ename
    FROM emp
   WHERE empno = 7788 ;
   DBMS_OUTPUT.PUT_LINE('이름: '||v_ename) ;
END ;
/
