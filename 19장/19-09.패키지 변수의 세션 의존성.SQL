SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM =====================================
REM 세션 1

REM 세션 1에서 첫 번째 실행
SELECT pkg_seq.get_nextval FROM dual ;

REM 세션 1에서 두 번째 실행
SELECT pkg_seq.get_nextval FROM dual ;

REM =====================================
REM 세션 2

REM 세션 2에서 첫 번째 실행
SELECT pkg_seq.get_nextval FROM dual ;

REM =====================================
REM 세션 1

REM 세션 1에서 세 번째 실행
SELECT pkg_seq.get_nextval FROM dual ;

