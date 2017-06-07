SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM PL/SQL에서는 CLOB 타입과 VARCHAR2 타입간의 구별이 거의 없이 사용 가능하다.
DECLARE
  v_dname    VARCHAR2(32767) ;
  v_clob     CLOB ;
  v_varchar  VARCHAR2(4000) ;
  v_clob2    CLOB ;
  v_varchar2 VARCHAR2(4000) ;
BEGIN
  -- VARCHAR2 타입의 칼럼을 CLOB 타입의 변수에 저장할 수 있다.
  SELECT dname INTO v_clob
    FROM dept
   WHERE deptno = 10 ;
   
  -- CLOB 타입의 칼럼을 VARCHAR2 타입의 변수에 저장할 수 있다.
  SELECT SCRIPT INTO v_varchar
    FROM t_clob
   WHERE line# = 1 ;
  
  -- CLOB <-> VARCHAR2 간의 변환은 문제 없이 지원된다(VARCHAR2의 길이가 충분한 경우에 한한다).
  v_clob2    := v_varchar ;
  v_varchar2 := v_clob ;
  
  -- VARCHAR2 타입에 사용 가능한 내장함수를 CLOB 타입에도 동일하게 사용할 수 있다
  v_clob2  := UPPER(v_clob) ;
  v_dname  := LOWER(SUBSTR(v_clob, 1, 10)) ;
  
  -- VARCHAR2 변수에서 CLOB으로의 변환도 자동으로 수행된다.
  v_clob2  := INITCAP(v_dname) ;
  
  -- CLOB의 DBMS_OUTPUT 출력도 동일하게 지원된다.
  DBMS_OUTPUT.PUT_LINE('CLOB 출력: '||v_clob) ;
  
  -- DML에서 CLOB 타입의 변수를 VARCHAR2 타입 칼럼에 사용할 수 있다.
  UPDATE dept
     SET dname = v_clob
   WHERE deptno = 10 ;
  
  -- DML에서 VARCHAR2 타입의 변수를 CLOB 타입 칼럼에 사용할 수 있다.
  UPDATE t_clob
     SET script = v_varchar
   WHERE line# = 1 ;
END ;
/
