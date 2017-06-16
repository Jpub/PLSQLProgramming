SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 객체 테이블에서 데이터 조회시 메소드의 사용
COL 성   FORMAT A4
COL 이름 FORMAT A4
COL 속성 FORMAT A68
SELECT family_name 성, given_name 이름, p.display() 속성
FROM tb_person p;
