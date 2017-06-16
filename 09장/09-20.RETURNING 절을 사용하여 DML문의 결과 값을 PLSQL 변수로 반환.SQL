SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM RETURNING 절을 사용하여 DML문의 결과 값을 PL/SQL 변수로 반환
DECLARE
  c_hiredate DATE := DATE'2016-01-02' ;
  v_empno    emp.empno   %TYPE ;
  v_ename    emp.ename   %TYPE ;
  v_hiredate emp.hiredate%TYPE ;
BEGIN
  DELETE FROM emp WHERE empno = 9000 ; -- 테스트 데이터 삭제
  -- INSERT 후 삽입된 값을 반환
  INSERT INTO emp(empno, ename, hiredate, deptno)
    VALUES (9000, '홍길동', c_hiredate, 40)
  RETURNING empno,   ename,   hiredate
       INTO v_empno, v_ename, v_hiredate;
  DBMS_OUTPUT.PUT_LINE('사원 추가=('||v_empno||', '||v_ename||', '||
                       TO_CHAR(v_hiredate, 'YYYY-MM-DD')||')') ;
  -- UPDATE 후 변경된 값을 반환
  UPDATE emp
     SET HIREDATE = c_hiredate
   WHERE empno = v_empno
   RETURNING empno,   ename,   hiredate
        INTO v_empno, v_ename, v_hiredate;
  DBMS_OUTPUT.PUT_LINE('사원 변경=('||v_empno||', '||v_ename||', '||
                       TO_CHAR(v_hiredate, 'YYYY-MM-DD')||')') ;
  -- DELETE 후 삭제된 사원의 사번, 이름, 입사일을 반환
  DELETE FROM emp
   WHERE empno = v_empno
    RETURNING empno,   ename,   hiredate
         INTO v_empno, v_ename, v_hiredate;
  DBMS_OUTPUT.PUT_LINE('사원 삭제=('||v_empno||', '||v_ename||', '||
                       TO_CHAR(v_hiredate, 'YYYY-MM-DD')||')') ;
  COMMIT ;
END ;
/