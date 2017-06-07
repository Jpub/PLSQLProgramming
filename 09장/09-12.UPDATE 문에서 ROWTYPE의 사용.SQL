SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM %ROWTYPE 사용
DECLARE
  v_emprec emp%ROWTYPE ; -- 레코드 변수 선언
BEGIN
  v_emprec.empno := 9000 ;
  
  -- 원래의 값을 조회한다.
  SELECT *
    INTO v_emprec
    FROM emp
   WHERE empno = v_emprec.empno ;
  
  -- 이름과 부서 번호 필드 값을 변경한다.
  v_emprec.ename  := '홍길동';
  v_emprec.deptno := 40;
  
  -- 변경된 값을 테이블에 반영한다.
  UPDATE emp
     SET ROW   = v_emprec -- 레코드 변수를 사용한 UPDATE
   WHERE empno = v_emprec.empno ;
  COMMIT ;
END ;
/
