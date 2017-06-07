SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM PL/SQL문을 동적으로 실행
DECLARE
  v_stmt   VARCHAR2(1000) ;
  v_empno  emp.empno %TYPE ;
  v_ename  emp.ename %TYPE ;
  v_dname  dept.dname%TYPE ;
BEGIN
  -- 실행할 동적 PL/SQL 문
  -- 사번을 입력으로 하여 사원명과 소속 부서를 출력
  v_stmt := 'DECLARE
               vv_ename emp.ename %TYPE ;
               vv_dname dept.dname%TYPE ;
             BEGIN
               DBMS_OUTPUT.PUT_LINE(''조회할 사번 = ''||:empno) ;
               SELECT ename,   dname
                 INTO vv_ename, vv_dname
                 FROM emp e, dept d
                WHERE e.empno  = :empno
                  AND e.deptno = d.deptno;
               :ename := vv_ename ;
               :dname := vv_dname ;
             END;';

  v_empno := 7788 ;
  -- 동적 PL/SQL 문 실행
  EXECUTE IMMEDIATE v_stmt 
              USING IN  v_empno,  -- 입력 변수(IN은 생략 가능)
                    OUT v_ename,  -- 출력 변수(OUT 필수)
                    OUT v_dname;  -- 출력 변수(OUT 필수)
  DBMS_OUTPUT.PUT_LINE(v_ename||'의 소속 부서 = '||v_dname) ;
END;
/
