SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 변수를 패키지 본체의 초기화부에서 초기화
CREATE OR REPLACE PACKAGE BODY pkg_xyz
IS
  v_pkg_var_3 NUMBER := 3 ; -- 전용 패키지 변수. 선언시 초기화
  v_pkg_var_4 NUMBER ;      -- 전용 패키지 변수. 미초기화
BEGIN
  -- 초기화부에서 패키지 변수 초기화
  v_pkg_var_2 := 2 ; -- 공용 패키지 변수를 초기화
  v_pkg_var_4 := 4 ; -- 전용 패키지 변수를 초기화
END ;
/
