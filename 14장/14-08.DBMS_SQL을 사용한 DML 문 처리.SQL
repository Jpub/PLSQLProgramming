SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM DBMS_SQL을 사용한 DML 문 처리
DECLARE
  v_cursor_id NUMBER;
  v_sql_stmt  VARCHAR2(4000) := Q'<INSERT INTO emp(empno, ename, job, mgr,
                                           hiredate, sal, comm, deptno)
                                     VALUES(:empno, :ename, :job, :mgr,
                                         SYSDATE, :sal, :comm, :deptno)
                                       RETURNING hiredate into :hiredate>';
  
  v_emp       emp%ROWTYPE;
  v_ret       NUMBER;
  
  v_desc_tab  DBMS_SQL.DESC_TAB;
  v_col_cnt   PLS_INTEGER ;
  v_str_var   VARCHAR2(100);
  v_num_var   NUMBER;
  v_date_var  DATE;
  v_row_cnt   PLS_INTEGER ;
BEGIN
  -- INSERT할 값
  v_emp.empno    := 7000 ;
  v_emp.ename    := '이순신' ;
  v_emp.job      := '군인' ;
  v_emp.mgr      := NULL ;
  v_emp.hiredate := NULL ;     -- hiredate는 SYSDATE를 반환받음
  v_emp.sal      := 9999 ;
  v_emp.comm     := NULL ;
  v_emp.deptno   := 40 ;
  
  -- 기존 테스트 데이터 삭제
  DELETE FROM emp WHERE empno = v_emp.empno ;
  
  -- SQL 커서를 열고 커서 번호를 반환받는다.
  v_cursor_id := DBMS_SQL.OPEN_CURSOR;
  
  -- SQL을 파싱한다.
  DBMS_SQL.PARSE(v_cursor_id, v_sql_stmt, DBMS_SQL.NATIVE);
  
  -- 바인드 변수에 값을 바인드 한다.
  DBMS_SQL.BIND_VARIABLE(v_cursor_id, 'empno'   , v_emp.empno   );
  DBMS_SQL.BIND_VARIABLE(v_cursor_id, 'ename'   , v_emp.ename   );
  DBMS_SQL.BIND_VARIABLE(v_cursor_id, 'job'     , v_emp.job     );
  DBMS_SQL.BIND_VARIABLE(v_cursor_id, 'mgr'     , v_emp.mgr     );
  DBMS_SQL.BIND_VARIABLE(v_cursor_id, 'hiredate', v_emp.hiredate);
  DBMS_SQL.BIND_VARIABLE(v_cursor_id, 'sal'     , v_emp.sal     );
  DBMS_SQL.BIND_VARIABLE(v_cursor_id, 'comm'    , v_emp.comm    );
  DBMS_SQL.BIND_VARIABLE(v_cursor_id, 'deptno'  , v_emp.deptno  );
                                                 
  -- 커서를 실행한다.
  v_ret := DBMS_SQL.EXECUTE(v_cursor_id);
  
  -- OUT 변수 값을 받음
  DBMS_SQL.VARIABLE_VALUE(v_cursor_id, 'hiredate', v_emp.hiredate); -- RETURNING절의 반환값
  DBMS_OUTPUT.PUT_LINE(v_emp.ename || '의 입사일 : '||TO_CHAR(v_emp.hiredate, 'YYYY-MM-DD')) ;
  
  -- 커서를 닫는다.
  DBMS_SQL.CLOSE_CURSOR(v_cursor_id) ;
END;
/

PAUSE
REM 테스트 데이터를 삭제한다.
DELETE FROM emp WHERE empno = 7000 ;
COMMIT ;
