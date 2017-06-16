SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 무조건 분기문: 더 깊은 레벨의 레이블을 참조하므로 오류
DECLARE
  v_bool BOOLEAN := TRUE;
BEGIN
  GOTO deeper_level ; -- 더 깊은 레벨의 레이블을 참조하므로 오류
 
  IF v_bool = TRUE THEN
  <<deeper_level>>
    NULL ;
  END IF;
END;
/
