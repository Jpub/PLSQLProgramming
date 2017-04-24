SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 프리픽스 Q를 사용하지 않을 경우 문자열 중간의 작은따옴표는
REM 모두 겹따옴표로 변경해야 하므로 어려움이 있다.
DECLARE
  v_SQL VARCHAR2(1000) ;
BEGIN
  v_SQL := 'SELECT EMPNO, ENAME
              FROM EMP
             WHERE ENAME IN (''SMITH'', ''ALLEN'', ''WARD'', ''JONES'', ''MARTIN'')' ;
  DBMS_OUTPUT.PUT_LINE(v_SQL) ;
END ;
/
