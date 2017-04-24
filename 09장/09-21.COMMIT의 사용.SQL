SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM COMMIT의 사용
BEGIN
  DELETE FROM emp WHERE empno = 9000 ; -- 이전 예제에서 생성된 데이터 삭제
  COMMIT ;
  INSERT INTO emp(empno, ename, hiredate, sal) VALUES (9000, '홍길동', SYSDATE, 9000) ;
  UPDATE EMP SET sal = sal + 100 WHERE empno = 9000 ;
  COMMIT ;
END ;
/
