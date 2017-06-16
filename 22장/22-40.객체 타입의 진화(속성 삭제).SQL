SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 객체 타입의 속성 삭제
ALTER TYPE employee_type
  DROP ATTRIBUTE (phone_number, gender) CASCADE ;
