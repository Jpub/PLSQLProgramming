SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 주석의 사용 형태

BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello,') ; -- 문장 뒤에 나타나는 행 주석
  -- 전체 행에 대한 행 주석
  /*
   여러 줄에 걸치는
   블록 주석
   */
  DBMS_OUTPUT.PUT_LINE('World!') ; /* 단일 행의 블록 주석 */
  DBMS_OUTPUT. /* 단일 행의 블록 주석 */ PUT_LINE('World!') ;
END;
/
