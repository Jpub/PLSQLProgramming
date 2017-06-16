SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 전방 선언으로 프로시저의 상호 호출 문제 해결
DECLARE
  -- 프로시저 p2를 전방 선언하여 오류를 방지한다.
  PROCEDURE p2(a_num2 NUMBER) ;
  
  -- 프로시저 p1은 프로시저 p2를 호출한다.
  PROCEDURE p1(a_num1 NUMBER) IS
  BEGIN
    p2(a_num1); -- p2가 전방 선언 되었으므로 오류가 발생하지 않는다.
  END;

  -- 프로시저 p2는 프로시저 p1을 호출한다.
  PROCEDURE p2(a_num2 NUMBER) IS
  BEGIN
    p1(a_num2); -- p1이 먼저 정의되었으므로 오류가 발생하지 않는다.
  END;

BEGIN
  NULL;
END;
/
