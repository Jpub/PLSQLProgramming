SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 커서에 대한 %ROWTYPE 사용
DECLARE
  -- 파라미터를 가지는 명시적 커서
  CURSOR ename_cursor IS
   SELECT empno, ename
     FROM emp ;
  v_emprec ename_cursor%ROWTYPE ; -- 커서에 대한 앵커를 사용한 레코드 선언
BEGIN
  -- 커서를 OPEN한다
  OPEN ename_cursor ;
  
  -- SELECT 결과를 FETCH한다.
  LOOP
    FETCH ename_cursor INTO v_emprec ; -- 레코드 변수에 결과를 저장한다.
    EXIT WHEN ename_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('EMPNO = '|| v_emprec.empno || '  ENAME = '||v_emprec.ename) ;
  END LOOP;
   
  -- 커서를 CLOSE한다.
  CLOSE ename_cursor ;
END ;
/
