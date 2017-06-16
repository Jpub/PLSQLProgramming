SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 시퀀스를 SQL 문에 포함하여 사용
DECLARE
  v_seq_value NUMBER;
BEGIN
  -- SQL을 사용하여 시퀀스 값을 얻어옴
  -- "v_seq_value := emp_seq.NEXTVAL"에 비해 비효율적임
  SELECT emp_seq.NEXTVAL
    INTO v_seq_value
    FROM DUAL ;
 
  DBMS_OUTPUT.PUT_LINE ('시퀀스 값: ' || TO_CHAR(v_seq_value));
END ;
/
