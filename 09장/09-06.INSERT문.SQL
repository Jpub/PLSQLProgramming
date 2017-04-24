SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 사번 9000을 삭제
DELETE FROM emp WHERE empno = 9000 ; 

REM 기본 INSERT문
BEGIN
  INSERT INTO emp(empno, ename,    hiredate, deptno)
  VALUES         (9000, '홍길동', SYSDATE,  30) ;
  DBMS_OUTPUT.PUT_LINE('INSERT 건수: '||SQL%ROWCOUNT) ; -- 변경된 건수 출력
  COMMIT ;
END ;
/
