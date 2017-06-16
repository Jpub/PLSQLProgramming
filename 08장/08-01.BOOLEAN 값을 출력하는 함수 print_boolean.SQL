SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM BOOLEAN 값을 출력하는 함수
CREATE OR REPLACE PROCEDURE print_boolean(v_msg VARCHAR2, v_bool BOOLEAN) IS
BEGIN
  IF v_bool IS NULL THEN
    dbms_output.put_line(v_msg || ' : NULL') ;
  ELSIF v_bool = TRUE THEN
    dbms_output.put_line(v_msg || ' : TRUE') ;
  ELSE
    dbms_output.put_line(v_msg || ' : FALSE') ;
  END IF ;
END ;
/
