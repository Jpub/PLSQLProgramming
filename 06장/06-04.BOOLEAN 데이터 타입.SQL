SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM BOOLEAN 데이터 타입의 사용 예제
DECLARE
  v_bool          BOOLEAN ;          -- BOOLEAN 타입 변수 선언. 초깃값은 NULL
  v_true          BOOLEAN := TRUE ;  -- 초깃값이 TRUE인 변수 선언
  c_true CONSTANT BOOLEAN := FALSE ; -- 값이 FALSE인 BOOLEAN형의 상수 선언
BEGIN
  v_bool := (2 < 3) ; -- 결과가 BOOLEAN 값인 계산식
END ;
/
