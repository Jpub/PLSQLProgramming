SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 약한 타입의 커서 변수는 반환형이 서로 다른 쿼리에 대해서도 사용할 수 있다
DECLARE 
  v_cursor   SYS_REFCURSOR ;  -- 약한 타입의 커서 변수
  v_selector CHAR ;
  v_deptno   NUMBER ;
  
  -- a_selector 값에 따라서 서로 다른 개수와 타입을 반환하는 SELECT문을 사용하여 커서를 OPEN
  PROCEDURE open_cursor(a_cursor IN OUT SYS_REFCURSOR, a_selector CHAR, a_deptno NUMBER) IS
  BEGIN
    IF a_selector = 'E' THEN
      OPEN a_cursor FOR SELECT * FROM emp  WHERE deptno = a_deptno ;
    ELSE
      OPEN a_cursor FOR SELECT * FROM dept WHERE deptno = a_deptno ;
    END IF ;
  END ;

  -- a_selector 값에 따라서 서로 다른 개수와 타입을 반환하는
  -- 커서 변수에서 서로 다른 칼럼을 추출하여 화면에 출력
  PROCEDURE print_cursor(a_cursor IN OUT SYS_REFCURSOR, a_selector CHAR) IS
    v_emprec  emp %ROWTYPE ;
    v_deptrec dept%ROWTYPE ;
  BEGIN
    IF a_selector = 'E' THEN
      LOOP
        FETCH a_cursor INTO v_emprec ; -- emp 테이블의 여덟 개 칼럼을 레코드에 담음
        EXIT WHEN a_cursor%NOTFOUND ;
        -- emp 테이블의 네 칼럼을 출력
        DBMS_OUTPUT.PUT_LINE('EMPNO='||v_emprec.empno||', ENAME='||v_emprec.ename||
                             ', JOB='||v_emprec.job  ||', SAL='  ||v_emprec.sal) ;
      END LOOP ;
    ELSE
      LOOP
        FETCH a_cursor INTO v_deptrec ; -- dept 테이블의 세 칼럼을 레코드에 담음
        EXIT WHEN a_cursor%NOTFOUND ;
        -- dept 테이블의 세 칼럼을 출력
        DBMS_OUTPUT.PUT_LINE('DEPTNO='||v_deptrec.deptno||', DNAME='||v_deptrec.dname||
                             ', LOC=' ||v_deptrec.loc) ;
      END LOOP ;
    END IF ;
  END ;
BEGIN
 -- dept 테이블을 출력하도록 커서를 연다.
  v_selector := 'D' ;
  v_deptno   := 10 ;
  open_cursor (v_cursor, v_selector, v_deptno) ;  -- 커서 OPEN
  print_cursor(v_cursor, v_selector) ;            -- 커서 출력
  CLOSE v_cursor ;
  
  DBMS_OUTPUT.PUT_LINE('----') ;

  -- emp 테이블을 출력하도록 커서를 다시 연다.
  v_selector := 'E' ;
  v_deptno   := 10 ;
  open_cursor (v_cursor, v_selector, v_deptno) ;  -- 커서 OPEN
  print_cursor(v_cursor, v_selector) ;            -- 커서 출력
  CLOSE v_cursor ;
END ;
/
