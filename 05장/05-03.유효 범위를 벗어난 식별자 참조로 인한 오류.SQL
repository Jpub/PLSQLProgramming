SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 유효 범위를 벗어난 중첩된 블록 내의 변수 v_num_partitions를
REM 참조하므로 선언되지 않는 식별자 오류를 발생시긴다. 
DECLARE
  c_table_name CONSTANT STRING(30) := 'EMP' ;
BEGIN
  DBMS_OUTPUT.PUT_LINE('테이블 '||c_table_name||'의 파티션 개수 출력') ;
  DECLARE  -- 중첩된 블록
    v_num_partitions NUMBER ;
  BEGIN
    SELECT COUNT(*)
      INTO v_num_partitions
      FROM USER_TAB_PARTITIONS
     WHERE TABLE_NAME = c_table_name ;
  END ;
  DBMS_OUTPUT.PUT_LINE('파티션 개수 = '||v_num_partitions) ; -- 유효 범위를 벗어나서 사용됨
END ;
/
