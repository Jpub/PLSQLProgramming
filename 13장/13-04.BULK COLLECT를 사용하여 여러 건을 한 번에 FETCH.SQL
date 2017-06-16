SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM BULK COLLECT를 사용하여 여러 건을 한 번에 FETCH
DECLARE
  TYPE empno_arr IS TABLE OF NUMBER ;
  TYPE ename_arr IS TABLE OF emp.ename%TYPE ;
  
  v_empno empno_arr;
  v_ename ename_arr ;
  
  -- 파라미터를 가지는 명시적 커서
  CURSOR ename_cursor IS
   SELECT empno, ename
     FROM emp ;
BEGIN
  -- 커서를 OPEN한다.
  OPEN ename_cursor ;
  
  -- SELECT 결과를 FETCH하여 컬렉션에 담는다.
  FETCH ename_cursor 
   BULK COLLECT INTO v_empno, v_ename;

  DBMS_OUTPUT.PUT_LINE('사원 수 = '|| v_empno.COUNT) ;
   
  -- 커서를 CLOSE한다.
  CLOSE ename_cursor ;
END ;
/
