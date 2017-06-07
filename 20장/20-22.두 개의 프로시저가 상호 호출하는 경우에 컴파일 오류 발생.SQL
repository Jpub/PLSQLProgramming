SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 2개의 프로시저가 상호 호출하는 경우에는 컴파일이 불가능하다
DECLARE
  -- 프로시저 p1은 프로시저 p2를 호출한다.
  PROCEDURE p1(a_num1 NUMBER) IS
  BEGIN
    p2(a_num1); -- p2가 뒤에 선언되므로 이 지점에서는 식별자가 유효하지 않아서 오류가 발생한다.
  END;

  -- 프로시저 p2는 프로시저 p1을 호출한다
  PROCEDURE p2(a_num2 NUMBER) IS
  BEGIN
    p1(a_num2); -- p1이 먼저 정의되었으므로 오류가 발생하지 않는다.
  END;

BEGIN
  NULL;
END;
/
