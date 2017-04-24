SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM employee_type의 객체 테이블 생성
CREATE TABLE tb_employee OF employee_type ;

PAUSE

REM mgr 속성이 NULL인 로우 추가 
INSERT INTO tb_employee VALUES('홍', '길동', '청학동', '일번지', 1000, 9900, 10, NULL) ;

REM INSERT SELECT문을 사용하여 mgr 값을 가지는 로우 객체 추가
INSERT INTO tb_employee 
SELECT '전', '우치', '계룡산', '계룡사', 1002, 5000, 10, REF(e)
  FROM tb_employee e
 WHERE empno = 1000 ;

PAUSE

REM 삽입된 데이터 조회
COL 이름   FORMAT A10
COL 상급자 FORMAT A10
SELECT e.full_name() 이름, e.manager_name() 상급자
  FROM tb_employee e ;
