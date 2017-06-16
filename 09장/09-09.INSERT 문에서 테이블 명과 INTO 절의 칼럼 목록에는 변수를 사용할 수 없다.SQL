SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM INSERT 문에서 테이블 명과 INTO 절의 칼럼 목록에는 변수를 사용할 수 없다.
REM 다음 프로그램은 오류를 발생시킨다.
DECLARE
  v_colname VARCHAR2(30) := 'ename';
BEGIN
  INSERT INTO emp(empno, /* 변수 */v_colname, hiredate, deptno)
  VALUES         (9000,            '홍길동',  SYSDATE,  30) ;
  DBMS_OUTPUT.PUT_LINE('INSERT 건수: '||SQL%ROWCOUNT) ; -- 변경된 건수 출력
  COMMIT ;
END ;
/
