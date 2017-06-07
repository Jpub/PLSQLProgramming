SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 위치에 의한 매개변수 지정과 이름에 의한 매개변수 지정의 혼합 사용
call raise_salary(7788, a_amt => 100) ;
