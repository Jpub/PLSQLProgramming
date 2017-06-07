SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 서브프로그램 내부에 선언된 식별자의 유효범위는
REM 레이블이 없어도 "서브프로그램명.식별자"로 참조 가능하다.
CREATE OR REPLACE PROCEDURE check_salary(a_empno NUMBER)
IS
  v_name VARCHAR2(10) ;
  v_num  NUMBER ;
  
  FUNCTION check_bonus(a_empno NUMBER) RETURN BOOLEAN
  IS 
    v_num NUMBER ;
  BEGIN
    SELECT comm 
      INTO v_num
      FROM emp
     WHERE empno = a_empno ;
     
    DBMS_OUTPUT.PUT_LINE(v_name||'의 커미션: '||v_num) ;
    
    -- 커미션은 급여 금액을 초과하지 못한다.
    IF check_salary.v_num < v_num THEN
      RETURN FALSE ;
    ELSE
      RETURN TRUE ;
    END IF ;
  END ;
  
BEGIN
  SELECT ename, sal
    INTO v_name, v_num
    FROM emp
   WHERE empno = a_empno ;
   
  IF NOT check_bonus(a_empno) THEN
    DBMS_OUTPUT.PUT_LINE('사원 '||v_name||'의 커미션이 과도합니다') ;
  ELSE
    DBMS_OUTPUT.PUT_LINE('사원 '||v_name||'의 급여 데이터가 정상입니다') ;
  END IF ;
END ;
/
