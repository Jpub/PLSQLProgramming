SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 멀티칼럼과 단일칼럼 해석 방식에 따른 쿼리문

REM 하나의 칼럼을 가지는 테이블로 해석한 쿼리
COL VALUE FORMAT A70
SELECT VALUE(a) AS "VALUE"
  FROM tb_person a 
 ORDER BY family_name, given_name ;

REM 여러 칼럼을 가지는 테이블로 해석한 쿼리
COL FAMILY_NAME FORMAT A11
COL GIVEN_NAME  FORMAT A10
COL ADDRESS_1   FORMAT A20
COL ADDRESS_2   FORMAT A20
SELECT a.*
  FROM tb_person a
 ORDER BY family_name, given_name ;
