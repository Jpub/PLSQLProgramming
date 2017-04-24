SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 기본 MERGE문
BEGIN
  MERGE INTO emp a
  USING DUAL
     ON (a.empno = 9000)
   WHEN MATCHED THEN     -- 사번이 9000인 로우 존재 시
     UPDATE
        SET a.comm = a.comm*1.1
   WHEN NOT MATCHED THEN -- 사번이 9000인 로우 미존재 시
     INSERT(empno, ename,   job,     hiredate, sal,  deptno)
     VALUES(9000,  '홍길동', 'CLERK', SYSDATE,  3000, 10) ;
  DBMS_OUTPUT.PUT_LINE('MERGE 건수: '||SQL%ROWCOUNT) ; -- 변경된 건수 출력
  COMMIT ;
END ;
/
