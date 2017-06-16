SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM NOCOPY 매개변수의 사용시에는 매개변수 원자성이 보장되지 않는다.
DECLARE
  v_my_exception EXCEPTION ;
  
  v1 NUMBER := 0 ;
  v2 NUMBER := 0 ;
  
  -- 매개변수의 원자성 보장
  PROCEDURE p_normal(a_1 OUT NUMBER, a_2 OUT NUMBER)
  IS
  BEGIN
    -- 예외 발생 이전에 매개변수 값을 변경하지만 메인 블록으로 전달되지 않는다.
    a_1 := 10 ;
    RAISE v_my_exception ; -- 예외 발생
    a_2 := 10 ;
  END ;
  
  -- NOCOPY 매개변수. 메모리 복사로 인한 부하는 사라지나, 매개변수의 원자성 미보장
  PROCEDURE p_nocopy(a_1 OUT NOCOPY NUMBER, a_2 OUT NOCOPY NUMBER)
  IS
  BEGIN
    -- NOCOPY를 사용했기 때문에, 예외가 발생하면 변경이 메인 블록으로 전달된다.
    a_1 := 10 ;
    RAISE v_my_exception ; -- 예외 발생
    a_2 := 10 ;
  END ;
BEGIN
  DBMS_OUTPUT.PUT_LINE('p_normal(NOCOPY 미사용) 호출 전 : v1 = '|| v1 || ', v2 = ' || v2) ;
  BEGIN
    p_normal(v1, v2) ; -- 매개변수 원자성 보장 버전 호출
  EXCEPTION WHEN v_my_exception THEN NULL ;
  END ;

  DBMS_OUTPUT.PUT_LINE('p_normal(NOCOPY 미사용) 호출 후 : v1 = '|| v1 || ', v2 = ' || v2) ;
  BEGIN
    p_nocopy(v1, v2) ; -- NOCOPY로 인한 매개변수 원자성 미보장 버전 호출
  EXCEPTION WHEN v_my_exception THEN NULL ;
  END ;
  DBMS_OUTPUT.PUT_LINE('p_nocopy(NOCOPY 사용  ) 호출 후 : v1 = '|| v1 || ', v2 = ' || v2) ;
END ;
/
