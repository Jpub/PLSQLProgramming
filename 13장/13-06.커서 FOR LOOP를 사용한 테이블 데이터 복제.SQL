SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM emp와 동일한 구조의 테이블 emp2 생성
DROP TABLE emp2 ;
CREATE TABLE emp2 AS SELECT * FROM EMP WHERE ROWNUM = 0 ;

PAUSE

REM emp2는 현재 빈 테이블이다.
SELECT COUNT(*) FROM emp2; 

PAUSE

REM 커서 FOR LOOP를 사용한 테이블 데이터 복제
BEGIN
  FOR c IN (SELECT * FROM emp)  -- 커서 FOR LOOP를 사용하여 테이블 복사
  LOOP
    INSERT INTO emp2 VALUES c ;
  END LOOP ;
END ;
/

PAUSE

REM 테이블 emp의 모든 로우를 emp2로 복사해서 14건이 되었다.
SELECT COUNT(*) FROM emp2; 
