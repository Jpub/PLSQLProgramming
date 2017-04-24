SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM %ROWTYPE을 사용한 레코드 타입 지정
DECLARE
  v_emprec  emp%ROWTYPE ; -- 테이블을 참조하여 선언(로우 앵커). e_emprec는 RECORD가 됨
  v_emprec2 v_emprec%TYPE ;  -- RECORD 변수 v_emprec를 참조하여 선언(변수 앵커)
  
  CURSOR emp_cursor(a_empno NUMBER) IS
    SELECT empno, ename, hiredate
      FROM emp 
     WHERE empno = a_empno ;
  v_emprec3 emp_cursor%ROWTYPE ;  -- 커서 선언을 참조하여 레코드 변수 선언
BEGIN
  SELECT * INTO v_emprec
    FROM EMP
   WHERE ROWNUM = 1 ;
  v_emprec2 := v_emprec ;
  
  OPEN emp_cursor(7788) ;
  FETCH emp_cursor INTO v_emprec3 ;
  CLOSE emp_cursor ;
END ;
/
