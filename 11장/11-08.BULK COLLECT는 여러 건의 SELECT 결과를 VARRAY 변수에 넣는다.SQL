SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM BULK COLLECT를 사용하면 여러 건의 SELECT 결과를 
REM VARRAY 변수에 넣을 수 있다.
DECLARE
  TYPE string_array IS VARRAY(20) OF VARCHAR2(100) ;
  v_arr string_array ;
BEGIN
  -- 테이블 emp의 모든 로우의 ename을 VARRAY 컬렉션에 한 번에 적재한다.
  SELECT ename
    BULK COLLECT INTO v_arr
    FROM emp
   WHERE ROWNUM <= 20 ;
  DBMS_OUTPUT.PUT_LINE('VARRAY 컬렉션 건수 = '||v_arr.COUNT) ;
END ;
/
