SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 커서의 칼럼이 표현식인데 앵커로 참조된다면
REM 표현식 칼럼은 반드시 앨리어스를 사용해야 한다.
DECLARE
  -- 명시적 커서
  CURSOR emp_cursor IS
   SELECT empno           사번
        , ename           이름
        , sal+NVL(comm,0) 총급여 -- 앵커로 참조되는 칼럼이 표현식이라면 앨리어스가 필요
     FROM emp ;
  v_emp_rec emp_cursor%ROWTYPE ;
BEGIN
  OPEN emp_cursor ;
  
  DBMS_OUTPUT.PUT_LINE('사번 이름       총급여') ;
  DBMS_OUTPUT.PUT_LINE('==== ========== ======') ;
  LOOP
    FETCH emp_cursor INTO v_emp_rec ;
    EXIT WHEN emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(' ' ||TO_CHAR(v_emp_rec.사번, '9999') || ' ' || 
                         RPAD(v_emp_rec.이름, 10) || ' ' ||
                         TO_CHAR(v_emp_rec.총급여, '99999')) ;
  END LOOP;
   
  -- 커서를 CLOSE한다.
  CLOSE emp_cursor ;
END ;
/
