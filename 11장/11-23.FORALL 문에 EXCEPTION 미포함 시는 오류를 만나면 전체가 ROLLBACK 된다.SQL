SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM EXCEPTION 미포함시는 오류를 만나면 전체가 ROLLBACK된다.
REM 예제에서는 PK 칼럼 id에 3이 2건이 중복되어 오류가 발생하고 전체가 ROLLBACK된다.
DECLARE
  TYPE ID_ARR_TYPE IS TABLE OF PLS_INTEGER ;
  v_id_arr ID_ARR_TYPE := ID_ARR_TYPE(1,2,3,3,5) ; -- 중복 키 값(3이 두 개) 포함
BEGIN
  DELETE FROM t ;
  COMMIT ;
  -- INSERT 문의 배열 처리
  FORALL i IN v_id_arr.FIRST .. v_id_arr.LAST
    INSERT INTO T VALUES( v_id_arr(i), v_id_arr(i)) ;
END ;
/

PAUSE

SELECT COUNT(*) FROM t ;

