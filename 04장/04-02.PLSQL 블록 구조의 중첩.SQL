SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM PL/SQL 블록 구조의 중첩

-- 최상위 블록
DECLARE
  v_str VARCHAR2(100) ;
  v_num NUMBER := 0 ;
BEGIN
  v_str := 'Hello, world!' ;
  DBMS_OUTPUT.PUT_LINE(v_str) ;
 
  -- 중첩된 블록 1
  BEGIN
    v_num := v_num + 10 ;
  END ;
  
  DBMS_OUTPUT.PUT_LINE('v_num = '||v_num) ;
  
  -- 중첩된 블록 2
  DECLARE
    v_num2 NUMBER ;
  BEGIN
    v_num2 := 3 ;
    v_num := v_num * v_num2 ;

    IF v_num >= 100 THEN
    -- 다시 중첩된 블록
    BEGIN
      v_num := MOD(v_num, 100) ;
    END ;
    END IF ;
  END ;
  
  DBMS_OUTPUT.PUT_LINE('v_num = '||v_num) ;

EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE(SQLERRM) ; -- 오류 메시지 출력
END ;
/
