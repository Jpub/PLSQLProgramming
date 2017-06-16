SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM ===========
REM tb_employee
REM ===========

REM 단일 칼럼 형식
INSERT INTO tb_employee VALUES(employee_type('홍', '길동', '청학동', '일번지', 1000, 9900, 10)) ;

REM 멀티 칼럼 형식
INSERT INTO tb_employee VALUES('손', '오공', '화과산 수렴동', '동굴', 1001, 9900, 10, NULL) ;

REM INSERT SELECT 문을 사용한 로우 객체 추가     
INSERT INTO tb_employee 
SELECT '전', '우치', '계룡산', '계룡사', 1002, 5000, 10, REF(e)
  FROM tb_employee e
 WHERE empno = 1000 ;

REM REF 변수를 사용한 로우 객체 추가
DECLARE
  v_ref_emp REF employee_type ;
BEGIN
  SELECT REF(E) INTO v_ref_emp 
    FROM tb_employee E
   WHERE empno = 1001 ;

  INSERT INTO tb_employee 
    VALUES('제갈', '공명', '촉한', '성도', 1003, 5000, 10, v_ref_emp ) ;
END ;
/
