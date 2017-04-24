SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 오라클 오류번호 "ORA-01847"을 예외명 invalide_date와 연결
DECLARE
  invalide_date EXCEPTION;                     -- 사용자 지정 예외
  PRAGMA EXCEPTION_INIT(invalide_date, -1847); -- ORA-01847과 연결
  -- ORA-01847: 달의 날짜는 1에서 말일 사이어야 합니다
  v_date DATE ;
BEGIN
  -- 오류 유발
  v_date := TO_DATE('2000-12-32', 'YYYY-MM-DD') ;
EXCEPTION
  WHEN invalide_date THEN
    DBMS_OUTPUT.PUT_LINE('날짜 오류가 검출되었습니다.') ;
END;
/
