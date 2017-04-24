SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 조건 분기문
DECLARE
  v_cnt  NUMBER ;
  v_type STRING(10) ;
BEGIN
  -- 테이블 emp가 생성되어 있는지 확인한다.
  -- 딕셔너리 뷰 user_tables에는 계정에 생성된 모든 테이블 목록이 들어 있다.
  SELECT COUNT(*)
    INTO v_cnt
    FROM USER_TABLES
   WHERE TABLE_NAME = 'EMP' ;

  IF v_cnt > 0 THEN  -- 테이블이 USER_TABLES에 등록되어 있으면 0보다 크다.
    DBMS_OUTPUT.PUT_LINE('테이블 EMP가 존재합니다.') ;
  ELSE               -- COUNT가 0이면 테이블이 존재하지 않는 경우이다.
    DBMS_OUTPUT.PUT_LINE('테이블 EMP가 존재하지 않습니다.') ;
  END IF ;
END ;
/
