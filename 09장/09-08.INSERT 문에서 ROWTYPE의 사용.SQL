SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 앞에서 삽입한 로우를 삭제 
DELETE FROM emp WHERE empno = 9000 ; 

REM %ROWTYPE 사용
DECLARE
  v_emprec emp%ROWTYPE ;  -- 레코드 변수
BEGIN
  v_emprec.empno    := 9000 ;
  v_emprec.ename    := '홍길동';
  v_emprec.deptno   := 30;
  v_emprec.hiredate := SYSDATE ;
  
  INSERT INTO emp
  VALUES      v_emprec;
  DBMS_OUTPUT.PUT_LINE('INSERT 건수: '||SQL%ROWCOUNT) ; -- 변경된 건수 출력
  COMMIT ;
END ;
/
