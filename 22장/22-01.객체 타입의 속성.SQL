SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

DROP TABLE tb_employee ;
DROP TABLE tb_emp ;
DROP TABLE tb_person ;
DROP TYPE employee_type ;
DROP TYPE person_type ;

REM person_type 抗力
CREATE OR REPLACE TYPE person_type AS OBJECT (
  family_name VARCHAR2(30),  -- 己
  given_name  VARCHAR2(30),  -- 捞抚
  address_1   VARCHAR2(60),  -- 扁夯 林家
  address_2   VARCHAR2(30)   -- 惑技 林家
) ;
/
