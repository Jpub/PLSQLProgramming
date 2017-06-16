SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 변수를 선언과 동시에 초기값 부여
CREATE OR REPLACE PACKAGE pkg_xyz
IS
  v_pkg_var_1 NUMBER := 1 ; -- 공용 패키지 변수. 선언시 초기화
  v_pkg_var_2 NUMBER ;      -- 공용 패키지 변수. 미초기화
END ;
/
