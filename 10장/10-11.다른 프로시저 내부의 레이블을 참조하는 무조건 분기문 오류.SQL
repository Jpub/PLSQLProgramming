SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 무조건 분기문: 다른 프로시저의 레이블을 참조하므로 오류
DECLARE
 PROCEDURE p AS
 BEGIN
  <<subprogram_p>>
   NULL ;
 END ;
BEGIN
  GOTO subprogram_p ; -- 다른 프로시져 내부의 레이블을 참조하므로 오류
END;
/
