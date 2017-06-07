SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 예외 처리에서 주로 하는 작업
REM 2. 변수나 반환 값 지정
DECLARE
  v_name  VARCHAR2(100);
BEGIN
  BEGIN
    SELECT ename INTO v_name
      FROM emp
    WHERE empno = -1;  -- 사원 번호 -1은 존재하지 않음
  EXCEPTION WHEN NO_DATA_FOUND THEN
    -- 사원 미존재 시 사원명을 특정 값으로 함
    v_name := '<존재하지 않는 사원>' ;
  END ;
  DBMS_OUTPUT.PUT_LINE('사원명 : ' || v_name) ;
END;
/
