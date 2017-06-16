SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 함수의 반환형으로 Associative Array 사용
DECLARE
  TYPE int_array IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER; -- Associative Array ADT
  v_fibonacci int_array ; -- 피보나치 수열을 저장할 배열
  c_order CONSTANT PLS_INTEGER := 20 ;

  /*
   * N 개의 피보나치 수열을 계산하여 배열을 반환하는 함수
   * 피보나치 수열은 처음 두 개의 항이 0과 1이고, 세 번째 항부터는
   * F(n) = F(n-1) + F(n-2)의 점화식으로 주어지는 수열이다.
   */
  FUNCTION fibonacci_sequence(num IN PLS_INTEGER) RETURN int_array
  IS
    v_arr int_array; -- 반환할 피보나치 수열(Associative Array)
  BEGIN
    v_arr(1) := 0 ;      -- 첫 번째 항
    v_arr(2) := 1 ;      -- 2 번째 항
    FOR i IN 3..num LOOP -- 3번째 항 이상
      v_arr(i) := v_arr(i-1) + v_arr(i-2) ; 
    END LOOP;
    RETURN v_arr ; -- Associative Array를 반환
  END ;

BEGIN
  v_fibonacci := fibonacci_sequence(c_order) ; -- 함수가 반환한 Associative Array
  DBMS_OUTPUT.PUT_LINE('피보나치 수열의 '||c_order||'개 항') ;
  FOR i IN 1 .. c_order
  LOOP
    DBMS_OUTPUT.PUT(CASE WHEN 1 < i THEN ', ' END || v_fibonacci(i)) ;
  END LOOP ;
  DBMS_OUTPUT.PUT_LINE('') ;
END;
/
