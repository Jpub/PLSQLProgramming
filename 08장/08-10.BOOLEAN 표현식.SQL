SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

DECLARE
  v_bool BOOLEAN ;
BEGIN
  v_bool := FALSE ;
  
  -- IF문의 분기 조건 판단에 사용
  IF v_bool = TRUE THEN
    DBMS_OUTPUT.PUT_LINE('v_bool이 참입니다.') ;
  ELSE
    DBMS_OUTPUT.PUT_LINE('v_bool이 거짓입니다.') ;
  END IF ;
  
  v_bool := FALSE ;
  -- WHILE문의 순환 조건 판단에 사용
  WHILE v_bool = FALSE 
  LOOP
    v_bool := TRUE ;
  END LOOP ;
    
  v_bool := FALSE; 
  -- BOOLEAN 표현식에 NOT 사용
  WHILE NOT v_bool = FALSE 
  LOOP
    v_bool := TRUE ;
  END LOOP ;
END ;
/
