SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 커서 변수 선언
DECLARE
  TYPE empcursor_type     IS REF CURSOR RETURN emp%ROWTYPE;     -- 강한 타입(테이블%ROWTYPE)
  TYPE genericcursor_type IS REF CURSOR;                        -- 약한 타입

  v_c1 empcursor_type;
  v_c2 genericcursor_type;
  v_c3 SYS_REFCURSOR;  -- 타입 선언 없이 사용 가능
  
  TYPE empcursor_type2 IS REF CURSOR RETURN v_c1%ROWTYPE;       -- 강한 타입(변수%ROWTYPE)
  v_c4 empcursor_type2;
  
  CURSOR emp_cursor IS
    SELECT empno, ename
      FROM emp ;
  TYPE empcursor_type3 IS REF CURSOR RETURN emp_cursor%ROWTYPE; -- 강한 타입(커서%ROWTYPE)
  v_c5 empcursor_type3;

  TYPE emp_rec IS RECORD (
    empno emp.empno%TYPE,
    ename emp.ename%TYPE
  );
  TYPE empcursor_type4 IS REF CURSOR RETURN emp_rec;            -- 강한 타입(레코드 타입)
  v_c6 empcursor_type4;  
BEGIN
  NULL;
END;
/
