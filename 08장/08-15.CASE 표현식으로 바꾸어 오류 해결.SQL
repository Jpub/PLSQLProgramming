SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 다음과 같이 CASE 문으로 바꾸어 사용해야 함
DECLARE
  v_NUM NUMBER := 1 ;
BEGIN
  DBMS_OUTPUT.PUT_LINE(v_NUM || '은 ' || CASE MOD(v_NUM,2) WHEN 0 THEN '짝수'
                                              ELSE '홀수' END || '입니다.') ;
END ;
/
