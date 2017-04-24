SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 시퀀스 emp_seq가 존재한다면 삭제
DROP SEQUENCE emp_seq ;

REM 시퀀스 emp_seq 생성
CREATE SEQUENCE emp_seq ;

PAUSE

REM 시퀀스를 SQL 문 없이 직접 사용
DECLARE
  v_seq_value NUMBER;
BEGIN
  -- SQL 없이 시퀀스를 직접 사용하는 방법
  v_seq_value := emp_seq.NEXTVAL;
 
  DBMS_OUTPUT.PUT_LINE ('시퀀스 값: ' || TO_CHAR(v_seq_value));
END ;
/
