SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM SELECT 문에서 PL/SQL 입력 변수의 사용
DECLARE
  v_empno  emp.empno%TYPE ;
  v_ename  emp.ename%TYPE ;
  v_rate   number := 1.1 ;
  v_sal    number ;
BEGIN
  v_empno := 7788 ;
  SELECT ename
       , (sal+comm)*v_rate  -- SELECT 칼럼에 입력 변수 v_rate를 사용
    INTO v_ename, v_sal     -- 출력 변수
    FROM emp 
   WHERE empno = v_empno ;  -- 리터럴을 입력 변수 v_empno로 대체
END ;
/
