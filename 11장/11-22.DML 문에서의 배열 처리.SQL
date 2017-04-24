SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

DROP TABLE t ;

REM 예제를 위한 테이블 생성
CREATE TABLE t (
  id   INTEGER PRIMARY KEY,
  name VARCHAR(100)
) ;

PAUSE

REM DML에서 배열 처리에 FOR ALL의 사용
DECLARE
  TYPE id_arr_type   IS TABLE OF PLS_INTEGER ;
  TYPE name_arr_type IS TABLE OF t.name%TYPE ;
  v_id_arr    id_arr_type   := id_arr_type(1,2,3,4,5) ;
  v_name_arr  name_arr_type := name_arr_type('이순신', '강감찬', '을지문덕', '계백', '김유신') ;
  v_name_arr2 name_arr_type := name_arr_type('강희안', '김홍도', '신윤복', '정선', '장승업') ;
BEGIN
  DELETE FROM t ;
  
  -- INSERT문에서의 배열 처리. ".."을 사용하여 범위 지정
  FORALL i IN v_id_arr.FIRST .. v_id_arr.LAST  -- ".."을 이용한 범위 지정
    INSERT INTO t(id, name) VALUES( v_id_arr(i), v_name_arr(i)) ;
  DBMS_OUTPUT.PUT_LINE('INSERT COUNT = '||SQL%ROWCOUNT) ;
  
  -- UPDATE문에서의 배열 처리. INDICES OF를 사용하여 범위 지정
  FORALL i IN INDICES OF v_id_arr  -- INDICES OF 를 이용한 범위 지정
    UPDATE t 
       SET name = v_name_arr(i)
     WHERE ID   = v_id_arr(i) ;
  DBMS_OUTPUT.PUT_LINE('UPDATE COUNT = '||SQL%ROWCOUNT) ;
  
  -- MERGE문에서의 배열 처리. ".."을 사용하여 범위 지정
  FORALL i IN v_id_arr.FIRST .. v_id_arr.LAST  -- ".."을 이용한 범위 지정
    MERGE INTO t
    USING (
      SELECT id
      FROM t
      WHERE id = v_id_arr(i)) u
    ON (t.id = u.id)
    WHEN MATCHED THEN
      UPDATE SET t.name = v_name_arr2(i)
    WHEN NOT MATCHED THEN
      INSERT (id, name)
      VALUES (v_id_arr(i), v_name_arr2(i));
  DBMS_OUTPUT.PUT_LINE('MERGE  COUNT = '||SQL%ROWCOUNT) ;
    
  -- DELETE문에서의 배열 처리. VALUES OF를 사용하여 범위 지정
  FORALL i IN VALUES OF v_id_arr  -- VALUES OF 를 이용한 범위 지정
    DELETE FROM t WHERE id = v_id_arr(i) ;
  DBMS_OUTPUT.PUT_LINE('DELETE COUNT = '||SQL%ROWCOUNT) ;
END ;
/
