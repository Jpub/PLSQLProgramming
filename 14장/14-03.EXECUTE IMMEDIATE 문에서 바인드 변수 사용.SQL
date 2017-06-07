SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 바인드 변수 사용
REM 바인드 변수는 USING 절에 나열한다.
REM 변수 모드로 IN과 OUT을 사용할 수 있으며, 생략시에는 IN이 사용된다.
DECLARE
  v_query CONSTANT VARCHAR2(200) := 'SELECT COUNT(*)
                                       FROM emp
                                      WHERE deptno = :deptno
                                        AND job    = :job' ;
  v_deptno emp.deptno%TYPE ;
  v_cnt    PLS_INTEGER ;
BEGIN
  v_deptno := 20 ;
  -- 바인드 값은 변수, 상수, 리터럴을 모두 사용할 수 있다.
  EXECUTE IMMEDIATE v_query 
               INTO v_cnt 
              USING IN v_deptno, 'CLERK';
  DBMS_OUTPUT.PUT_LINE('COUNT = '||v_cnt) ;
END ;
/
