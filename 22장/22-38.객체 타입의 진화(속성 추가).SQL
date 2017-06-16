SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 객체 타입에 속성 추가
ALTER TYPE employee_type
  ADD ATTRIBUTE (phone_number VARCHAR2(11),
               gender       VARCHAR2( 1)) CASCADE ;
