SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 테이블 데이터의 타입 변환

DELETE FROM tb_person ;

REM SQL에서 슈퍼타입과 서브타입 간의 변환
INSERT INTO tb_person VALUES(person_type('홍', '길동', '청학동 일번지', '')) ;
INSERT INTO tb_person VALUES(employee_type('손', '오공', '화과산 수렴동', '동굴', 1001, 9900, 10, NULL)) ;

PAUSE

REM 저장된 데이터의 조회
COL FULL_NAME FORMAT A10
COL DISPLAY   FORMAT A68
SELECT a.full_name() full_name, a.display() display 
  FROM tb_person a ;
