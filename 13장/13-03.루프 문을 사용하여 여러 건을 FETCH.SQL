SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM LOOP 문을 사용하여 여러 건을 FETCH
DECLARE
  v_empno NUMBER ;
  v_ename emp.ename%TYPE ;
  
  -- 파라미터를 가지는 명시적 커서
  CURSOR ename_cursor IS
   SELECT empno, ename
     FROM emp
    ORDER BY empno;
BEGIN
  -- 커서를 OPEN한다.
  OPEN ename_cursor ;
  
  -- SELECT 결과를 FETCH한다.
  LOOP
    FETCH ename_cursor INTO v_empno, v_ename;
    EXIT WHEN ename_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('EMPNO = '|| v_empno || '  ENAME = '||v_ename) ;
  END LOOP;
   
  -- 커서를 CLOSE한다.
  CLOSE ename_cursor ;
END ;
/
