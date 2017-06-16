SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 함수의 선언부
CREATE OR REPLACE FUNCTION f RETURN NUMBER
IS
  /* ====== 함수 선언부 시작 ====== */
  FUNCTION get_emp_sal(a_empno NUMBER) RETURN NUMBER ; -- 함수 전방 선언
  
  no_emp_found EXCEPTION ;                  -- 사용자 지정 예외 선언
  
  TYPE number_arr_type IS TABLE OF NUMBER ; -- 타입 선언
  v_empno_arr number_arr_type ;             -- 변수 선언
  
  c_nulm_comm CONSTANT NUMBER := 0 ;        -- 상수 선언
  
  v_wage      NUMBER ;                      -- 변수 선언
  
  CURSOR emp_cursor(a_empno NUMBER) IS      -- 커서 선언
    SELECT sal + NVL(comm,0) comm
      FROM emp
     WHERE empno = a_empno ;
  
  FUNCTION get_emp_sal(a_empno NUMBER) RETURN NUMBER IS -- 함수 정의
    v_sal NUMBER ;
  BEGIN
    OPEN emp_cursor(7788) ;
    FETCH emp_cursor INTO v_sal ;
    CLOSE emp_cursor ;
    RETURN v_sal ;
  END ;
  /* ====== 함수 선언부 끝   ====== */
BEGIN
  NULL ;
END ;
/