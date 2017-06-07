SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 문자형 데이터 타입의 선언 예제
DECLARE
  v_char_default       CHAR          ; -- 크기 1 인 CHAR
  v_char_size          CHAR(10)      ; -- 크기 10인 CHAR
  v_nchar_default      NCHAR         ; -- 크기 1 인 NCHAR
  v_nchar_size         NCHAR(10)     ; -- 크기 10인 NCHAR
  --v_varchar_default  VARCHAR2      ; -- VARCHAR2는 크기를 생략할 수 없음(오류 발생)
  v_varchar_size       VARCHAR2(10)  ; -- 크기 10인 VARCHAR
  --v_nvarchar_default NVARCHAR2     ; -- NVARCHAR2는 크기를 생략할 수 없음(오류 발생)
  v_nvarchar_size      NVARCHAR2(10) ; -- 크기 10인 NVARCHAR
BEGIN
  NULL ; -- 아무 것도 하지 않음
END ;
/
