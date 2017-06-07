SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM LIMIT 절 사용
DECLARE 
  TYPE emp_rec  IS TABLE OF emp%ROWTYPE ;
  v_emp_arr     emp_rec ;
  c_size_limit  CONSTANT PLS_INTEGER := 10 ; -- 한 번에 읽어 들일 최대 건수 제한
  v_fetched     PLS_INTEGER ; 
  CURSOR c IS  -- 이 유형의 처리는 CURSOR를 사용한다.
    SELECT * 
    FROM   emp; 
BEGIN 
  v_fetched := 0 ;
  OPEN c; -- 커서 열기
  LOOP 
    FETCH c BULK COLLECT INTO v_emp_arr
      LIMIT c_size_limit; -- LIMIT를 사용하여 한 번에 읽어 들일 최대 건수를 제한한다.
    
    DBMS_OUTPUT.PUT_LINE(v_emp_arr.COUNT||'건') ;
    
    IF 0 < v_emp_arr.COUNT THEN
      FOR i IN v_emp_arr.FIRST .. v_emp_arr.LAST
      LOOP
        DBMS_OUTPUT.PUT_LINE(CHR(9)||'순서 = ' || TO_CHAR(v_fetched+i, '99') || 
           '  사번 = '||v_emp_arr(i).empno||', 이름 = ' || v_emp_arr(i).ename) ;
      END LOOP ;
      v_fetched := c%ROWCOUNT ; -- 처리된 건수
    END IF ;

    EXIT WHEN c%NOTFOUND; -- 더 이상의 데이터가 없으면 종료한다. 모든 처리가 끝난 후에 호출해야 한다.
  END LOOP; 
 
  CLOSE c; 
END;
/

PAUSE

REM LIMIT 절에 c_size_limit = 7을 지정한 경우
REM 마지막에 "0건"이 출력되고 나서 목록이 출력되지 않는다.
REM FETCH 건수가 0 건이지만 NO_DATA_FOUND 예외가 발생하지 않는다.
DECLARE 
  TYPE emp_rec  IS TABLE OF emp%ROWTYPE ;
  v_emp_arr     emp_rec ;
  c_size_limit  CONSTANT PLS_INTEGER := 7 ; -- 한 번에 읽어 들일 최대 건수 제한
  v_fetched     PLS_INTEGER ; 
  CURSOR c IS  -- 이 유형의 처리는 CURSOR를 사용한다.
    SELECT * 
    FROM   emp; 
BEGIN 
  v_fetched := 0 ;
  OPEN c; -- 커서 열기
  LOOP 
    FETCH c BULK COLLECT INTO v_emp_arr
      LIMIT c_size_limit; -- LIMIT를 사용하여 한 번에 읽어 들일 최대 건수를 제한한다.
    
    DBMS_OUTPUT.PUT_LINE(v_emp_arr.COUNT||'건') ;
    
    IF 0 < v_emp_arr.COUNT THEN
      FOR i IN v_emp_arr.FIRST .. v_emp_arr.LAST
      LOOP
        DBMS_OUTPUT.PUT_LINE(CHR(9)||'순서 = ' || TO_CHAR(v_fetched+i, '99') || 
           '  사번 = '||v_emp_arr(i).empno||', 이름 = ' || v_emp_arr(i).ename) ;
      END LOOP ;
      v_fetched := c%ROWCOUNT ; -- 처리된 건수
    END IF ;

    EXIT WHEN c%NOTFOUND; -- 더 이상의 데이터가 없으면 종료한다. 모든 처리가 끝난 후에 호출해야 한다.
  END LOOP; 
 
  CLOSE c; 
END;
/
