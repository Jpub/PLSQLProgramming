SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 疙矫利 目辑 加己
DECLARE
  CURSOR emp_cursor IS
    SELECT ename, hiredate
      FROM emp
     WHERE deptno = 10 
     ORDER BY hiredate desc;
BEGIN
  FOR t IN emp_cursor
  LOOP
    DBMS_OUTPUT.PUT_LINE(RPAD(t.ename, 6,' ')||
      ', 涝荤 老磊='|| TO_CHAR(t.hiredate, 'YYYY-MM-DD')) ;
    IF emp_cursor%ROWCOUNT >= 3 THEN -- 疙矫利 目辑 加己 目辑疙%ROWCOUNT
      EXIT ;
    END IF ;
  END LOOP ;
END ;
/
