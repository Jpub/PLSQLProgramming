SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM %TYPE을 사용한 데이터 타입 지정
DECLARE
  v_ename  emp.ename%TYPE ; -- 칼럼의 타입을 참조하여 데이터 타입을 지정(칼럼 앵커)
  v_ename2 v_ename%TYPE ;   -- 위의 변수 v_ename의 타입을 참조하여 데이터 타입을 지정(변수 앵커)
BEGIN
  SELECT ename INTO v_ename
    FROM EMP
   WHERE ROWNUM = 1 ;
  v_ename2 := v_ename ;
END ;
/
