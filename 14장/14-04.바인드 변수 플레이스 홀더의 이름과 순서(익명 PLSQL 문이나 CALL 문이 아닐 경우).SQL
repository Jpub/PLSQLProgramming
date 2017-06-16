SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 바인드 변수 플레이스 홀더의 이름과 순서
REM 가. 익명 PL/SQL문도 아니고 CALL 문도 아닐 경우
REM     바인드 변수의 사용 횟수만큼 USING 절에 값 제공
DECLARE
  v_ename_in  VARCHAR2(10) := 'Scott' ;
  v_ename     VARCHAR2(10) ;
  v_job       VARCHAR2(10) := 'ANALYST';
BEGIN
  EXECUTE IMMEDIATE 'SELECT ename 
                       FROM emp 
                      WHERE ename IN (:ename, UPPER(:ename), 
                                      LOWER(:ename), INITCAP(:ename))
                        AND job = :job'
          INTO  v_ename
          USING v_ename_in, v_ename_in, v_ename_in, v_ename_in, v_job ;
  DBMS_OUTPUT.PUT_LINE('이름='||v_ename ||', 업무='||v_job) ;
END ;
/
