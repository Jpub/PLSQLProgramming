SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

DROP TABLE t_clob ;

REM 예제용 테이블 생성
CREATE TABLE t_clob (
 line#  NUMBER,
 script CLOB
) ;

PAUSE

REM CLOB의 사용
DECLARE
  v_rec t_clob%ROWTYPE ;
BEGIN
  DELETE FROM t_clob ;

  v_rec.line#  := 1 ;
  v_rec.script := '옛날에 옛날에 어느 깊은 산속 연못 가에 도토리 나무가 서 있었습니다.' ;
  INSERT INTO T_CLOB VALUES v_rec ;

  v_rec.line#  := 2 ;
  v_rec.script := '어느 해 날씨가 너무 좋아서 도토리 나무에 도토리가 정말 많이 열렸습니다.' ;
  INSERT INTO t_clob VALUES v_rec ;
  
  SELECT line#, script
    INTO v_rec
    FROM t_clob
   WHERE line# = 1 ;
  DBMS_OUTPUT.PUT_LINE(v_rec.line#||' : '||v_rec.script) ;
END ;
/
