SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 바인드 변수 플레이스 홀더의 이름과 순서
REM 나. 익명 PL/SQL문이거나 CALL 문일 경우
REM     변수의 개수 만큼 USING 절에 값 제공
DECLARE
  c_stmt CONSTANT VARCHAR2(1000) := 
    Q'<BEGIN
         :a := :a + :b ;
         DBMS_OUTPUT.PUT_LINE('a='||:a||', b='||:b);
       END;>' ;
  v_a NUMBER := 2 ;
  v_b NUMBER := 3 ;
BEGIN
  EXECUTE IMMEDIATE c_stmt USING IN OUT v_a, v_b;
END ;
/
