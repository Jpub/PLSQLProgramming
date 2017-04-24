SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM DBMS_SQL을 사용한 SELECT 문 처리
DECLARE
  v_cursor_id NUMBER;
  v_sql_stmt  VARCHAR2(4000) := Q'<SELECT *
                                     FROM emp
                                    WHERE deptno   = :deptno
                                      AND hiredate >= TO_DATE(:hiredate, 'YYYY-MM-DD')>' ;
  
  TYPE vc_array IS TABLE OF VARCHAR2(100);
  v_bind_var    vc_array ;  
  v_bind_val    vc_array ;
  v_ret         NUMBER;
  
  v_desc_tab    DBMS_SQL.DESC_TAB;
  v_col_cnt     PLS_INTEGER ;
  v_str_var     VARCHAR2(100);
  v_num_var     NUMBER;
  v_date_var    DATE;
  v_row_cnt     PLS_INTEGER ;
BEGIN
  -- 바인드 변수와 값 목록
  v_bind_var := vc_array('deptno', 'hiredate') ;   -- 바인드 변수
  v_bind_val := vc_array('10'    , '1981-07-01') ; -- 바인드 값
  
  -- SQL 커서를 열고 커서 번호를 반환받는다.
  v_cursor_id := DBMS_SQL.OPEN_CURSOR;
  
  -- SQL을 파싱한다.
  DBMS_SQL.PARSE(v_cursor_id, v_sql_stmt, DBMS_SQL.NATIVE);
  
  -- 바인드 변수에 값을 바인드 한다.
  FOR i IN 1 .. v_bind_var.COUNT LOOP
    DBMS_SQL.BIND_VARIABLE(v_cursor_id, v_bind_var(i), v_bind_val(i));
  END LOOP;
  
  -- SELECT문의 칼럼 정보를 가져온다.
  DBMS_SQL.DESCRIBE_COLUMNS(v_cursor_id, v_col_cnt, v_desc_tab);

  -- SELECT될 칼럼을 정의한다.
  FOR i IN 1 .. v_col_cnt LOOP
    IF    v_desc_tab(i).col_type = DBMS_SQL.NUMBER_TYPE THEN -- NUMBER형 칼럼
      DBMS_SQL.DEFINE_COLUMN(v_cursor_id, i, v_num_var);
    ELSIF v_desc_tab(i).col_type = DBMS_SQL.DATE_TYPE THEN   -- 일시간형 칼럼
      DBMS_SQL.DEFINE_COLUMN(v_cursor_id, i, v_date_var); 
    ELSE                                                     -- 그 외는 모두 문자형으로 처리
      DBMS_SQL.DEFINE_COLUMN(v_cursor_id, i, v_str_var, 100); 
    END IF;
  END LOOP;
  
  -- 커서를 실행한다.
  v_ret := DBMS_SQL.EXECUTE(v_cursor_id);
  
  -- 값을 출력
  v_row_cnt := 0 ;
  WHILE DBMS_SQL.FETCH_ROWS(v_cursor_id) > 0 
  LOOP
    v_row_cnt := v_row_cnt + 1 ;
    DBMS_OUTPUT.PUT_LINE(v_row_cnt||'번째 로우') ;
    FOR i IN 1 .. v_col_cnt LOOP
      IF (v_desc_tab(i).col_type = DBMS_SQL.NUMBER_TYPE) THEN  -- NUMBER형 칼럼 값
        DBMS_SQL.COLUMN_VALUE(v_cursor_id, i, v_num_var);
        DBMS_OUTPUT.PUT_LINE(CHR(9)||rpad(v_desc_tab(i).col_name, 8, ' ') || ' : ' || v_num_var) ;
      ELSIF (v_desc_tab(i).col_type = DBMS_SQL.DATE_TYPE) THEN -- 일시간형 칼럼 값
        DBMS_SQL.COLUMN_VALUE(v_cursor_id, i, v_date_var);
        DBMS_OUTPUT.PUT_LINE(CHR(9)||rpad(v_desc_tab(i).col_name, 8, ' ') || ' : ' ||
                             TO_CHAR(v_date_var,'YYYY-MM-DD')) ;
      ELSE                                                     -- 그 외는 모든 문자형 값
        DBMS_SQL.COLUMN_VALUE(v_cursor_id, i, v_str_var);
        DBMS_OUTPUT.PUT_LINE(CHR(9)||rpad(v_desc_tab(i).col_name, 8, ' ') || ' : ' || v_str_var) ;
      END IF;
    END LOOP;
  END LOOP;
  
  -- 커서를 닫는다.
  DBMS_SQL.CLOSE_CURSOR(v_cursor_id) ;
END;
/
