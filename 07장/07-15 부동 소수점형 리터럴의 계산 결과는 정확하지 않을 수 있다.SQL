SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 부동 소수점형 리터럴은 값이 정확하지 않을 수 있다.
REM 동일한 상수 9.95이지만 부동소숫점형을 사용하면
REM 정확한 값을 가지지 못한다.
REM 따라서 부동소수점형은 금융 계산에 사용할 수 없으며,
REM 금융 계산에는 NUMBER 형을 사용해야 한다.
DECLARE
  v_num NUMBER ;
BEGIN
  DBMS_OUTPUT.PUT_LINE('NUMBER                : '||9.95) ;
  DBMS_OUTPUT.PUT_LINE('부동 소수점           : '||9.95F) ;
  DBMS_OUTPUT.PUT_LINE('TO_CHAR(9.95 ,''99.0'') :'||TO_CHAR(9.95 ,'99.0')) ;
  DBMS_OUTPUT.PUT_LINE('TO_CHAR(9.95F,''99.0'') :'||TO_CHAR(9.95F,'99.0')) ;
  DBMS_OUTPUT.PUT_LINE('ROUND(9.95 ,1)        : '||ROUND(9.95 ,1)) ;
  DBMS_OUTPUT.PUT_LINE('ROUND(9.95F,1)        : '||ROUND(9.95F,1)) ;

  v_num := 9.95F ; -- 부동 소수점형 리터럴을 NUMBER형 변수에 바로 할당해도 값이 정확하지 않다.
  DBMS_OUTPUT.PUT_LINE('부동 소수점 변수      : '||v_num) ;
END ;

/
