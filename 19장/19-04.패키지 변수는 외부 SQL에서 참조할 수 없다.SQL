SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 변수는 외부 SQL에서 참조할 수 없다.
SELECT pkg_emp.v_last_wage  -- 패키지 변수는 외부 SQL 문에서 참조할 수 없다.
FROM DUAL ;
