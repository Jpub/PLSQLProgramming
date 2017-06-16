SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

DROP TABLE tb_person ;

REM person_type의 객체 테이블 생성
CREATE TABLE tb_person OF person_type ;
ALTER TABLE tb_person ADD CONSTRAINT pk_person PRIMARY KEY(family_name, given_name) ;

PAUSE

DROP TABLE tb_employee ;

REM employee_type의 객체 테이블 생성
CREATE TABLE tb_employee OF employee_type ;
ALTER TABLE tb_employee ADD CONSTRAINT pk_employee PRIMARY KEY(empno) ;
