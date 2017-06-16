SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM =========
REM tb_person
REM =========

REM 단일 칼럼 형식과 멀티 칼럼 형식을 사용하여 객체 테이블에 데이터 INSERT
REM 단일 칼럼 형식 
INSERT INTO tb_person VALUES(person_type('홍', '길동', '청학동 일번지', '')) ;
INSERT INTO tb_person VALUES(person_type('김', '삿갓')) ;
REM 멀티 칼럼 형식
INSERT INTO tb_person VALUES('손', '오공', '화과산 수렴동', '동굴') ;
