SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 1장의 익명 PL/SQL을 MERGE 문을 사용하여 재작성
MERGE INTO emp a
USING (SELECT 7788      AS empno,
              'SCOTT'   AS ename,
              'ANALYST' AS job,
              20        AS default_deptno
         FROM DUAL) b
ON (a.empno = b.empno)
WHEN MATCHED THEN
  UPDATE SET a.ename = b.ename,
             a.job   = b.job
WHEN NOT MATCHED THEN
  INSERT (a.empno, a.ename, a.job, a.deptno)
  VALUES (b.empno, b.ename, b.job, b.default_deptno) ;
