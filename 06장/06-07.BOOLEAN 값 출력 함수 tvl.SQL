SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM tvl 함수
REM 첫 번째 매개변수 값이 TRUE 이면 두 번째 매개변수 값을
REM                       FALSE이면 세 번째 매개변수 값을
REM                       NULL 이면 네 번째 매개변수 값을 반환
CREATE OR REPLACE FUNCTION tvl
                    (a_boolean  BOOLEAN,         -- 논릿값
                     a_trueval  VARCHAR2,        -- TRUE 일 때 반환값
                     a_falseval VARCHAR2,        -- FALSE일 때 반환값
                     a_nullval  VARCHAR2 := NULL -- NULL 일 때 반환값
                    ) RETURN VARCHAR2 
IS
BEGIN
  RETURN CASE WHEN a_boolean = TRUE  THEN a_trueval 
              WHEN a_boolean = FALSE THEN a_falseval
              WHEN a_boolean IS NULL THEN a_nullval 
         END ;                         
END ;
/
