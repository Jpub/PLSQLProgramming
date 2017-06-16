SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM LIMIT 키워드를 사용하지 않는 경우
REM SAMPLE 또는 FETCH FIRST를 사용
REM FETCH FIRST는 버전 12c 이상에서만 지원되며, 11.2까지는 지원되지 않는다.
DECLARE
  TYPE emp_tab_type IS TABLE OF emp%ROWTYPE ;
  v_emp emp_tab_type ;
BEGIN 
  -- SAMPLE절을 사용하여 건수 제한
  -- SAMPLE 뒤의 숫자 10은 건수가 아니라 퍼센트(%)를 지정하는 숫자다.
  -- 정확히 10%를 조회하는 것이 아니라 10%에 해당되는 건수를 추정하는 방법을 사용하므로
  -- 실제로 조회되는 결과 건수는 매 실행시 마다 달라질 수 있다.
  SELECT * 
    BULK COLLECT INTO v_emp
    FROM emp SAMPLE (10) ;  -- 10%를 샘플링하여 조회한다.
  DBMS_OUTPUT.PUT_LINE('SAMPLE 건수: '||v_emp.COUNT) ;
  
  -- FETCH FIRST절을 사용하여 건수를 제한
  -- 12c에서 새로 생긴 기능이다. 버전 11.x 까지는 실행하면 오류가 발생한다.
  SELECT *
    BULK COLLECT INTO v_emp
    FROM emp
   FETCH FIRST 10 ROWS ONLY ; -- 버전 11.2 이하에서는 컴파일 오류 발생
  DBMS_OUTPUT.PUT_LINE('FETCH FIRST 10 건수: '||v_emp.COUNT) ;
END ;
/
