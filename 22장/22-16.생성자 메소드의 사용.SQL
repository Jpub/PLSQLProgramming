SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 생성자 메소드의 사용

REM person_type의 객체 테이블 생성
CREATE TABLE tb_person OF person_type ;

PAUSE

REM 시스템 정의 생성자(네 개의 매개변수) 사용
INSERT INTO tb_person VALUES(person_type('홍', '길동', '청학동', '일번지')) ;

PAUSE

REM 사용자 정의 생성자(두 개의 매개변수) 사용
INSERT INTO tb_person VALUES(person_type('김', '삿갓')) ;

PAUSE

REM 데이터 조회
COL FAMILY_NAME FORMAT A11
COL GIVEN_NAME  FORMAT A10
COL ADDRESS_1   FORMAT A20
COL ADDRESS_2   FORMAT A20
SELECT * FROM TB_PERSON ;
