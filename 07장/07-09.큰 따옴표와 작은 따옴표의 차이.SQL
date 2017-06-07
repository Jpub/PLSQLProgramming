SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 문자형 리터럴은 작은 따옴표를 사용한다.
REM 큰 따옴표를 사용하면 문자형 리터럴이 아니라 식별자이다.
DECLARE
  c_name CONSTANT STRING(10) := 'Mr. Smith' ;
  "Mr. Scott" STRING(10) ;
BEGIN
  "Mr. Scott" := c_name ;
  DBMS_OUTPUT.PUT_LINE('이름='||"Mr. Scott") ;
END ;
/
