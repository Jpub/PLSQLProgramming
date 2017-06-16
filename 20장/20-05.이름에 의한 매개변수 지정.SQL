SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 이름에 의한 매개변수 지정
REM 다음 두 개의 호출은 매개변수의 위치가 다르지만 실제로는 완전히 동일한 호출이다.
BEGIN raise_salary(a_empno => 7788, a_amt   => 100)  ; END ;
/
BEGIN raise_salary(a_amt   => 100,  a_empno => 7788) ; END ;
/
