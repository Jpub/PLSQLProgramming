SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 프로시저 실행
DECLARE
  a_rslt_out BOOLEAN ;        -- 처리 성공 여부
  a_msg_out  VARCHAR2(1000) ; -- 처리 결과를 반환하는 변수
BEGIN
  register_employee(7788, 'SCOTT', 'ANALYST', a_rslt_out, a_msg_out) ;
  DBMS_OUTPUT.PUT_LINE(a_msg_out) ;
  IF a_rslt_out = TRUE THEN
    DBMS_OUTPUT.PUT_LINE('등록 성공!') ;
    COMMIT ;
  ELSE
    DBMS_OUTPUT.PUT_LINE('등록 실패!') ;
    ROLLBACK ;
  END IF ;
END ;
/
