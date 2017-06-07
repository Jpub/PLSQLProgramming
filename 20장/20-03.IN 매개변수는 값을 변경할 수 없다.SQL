SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM IN 매개변수는 값을 변경할 수 없다
DECLARE
  PROCEDURE p(a_arg IN NUMBER) IS
  BEGIN
    a_arg := a_arg + 1 ; -- IN 모드의 매개변수 값을 변경하면 컴파일 오류 발생
  END ;
BEGIN
  p(1) ;
END ;
/
