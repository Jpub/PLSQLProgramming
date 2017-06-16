SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 다차원 컬렉션을 지원하지는 않지만 유사하게 사용할 수는 있다.
DECLARE
  TYPE arr_1d_type IS TABLE OF VARCHAR2(100);  -- Nested Table
  v_arr1_1 arr_1d_type := arr_1d_type('사과', '배');             -- 초기화
  v_arr1_2 arr_1d_type := arr_1d_type('오렌지', '자몽', '망고'); -- 초기화
  v_arr1_3 arr_1d_type := arr_1d_type('포도', '앵두');           -- 초기화

  TYPE arr_2d_type IS TABLE OF arr_1d_type;    -- 2차원 Nested Table 타입 선언
  v_arr2 arr_2d_type := arr_2d_type(v_arr1_1, v_arr1_2); -- 2차원 컬렉션 초기화(1차원 컬렉션 사용)

BEGIN
  v_arr2.EXTEND;
  v_arr2(3) := v_arr1_3;
  DBMS_OUTPUT.PUT_LINE('v_arr2(2)(3) = '||v_arr2(2)(3)); -- 다차원 배열의 항목 참조
END;
/
