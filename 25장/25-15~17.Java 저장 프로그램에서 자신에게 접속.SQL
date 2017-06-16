SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 자바 저장 프로그램에서 자신을 실행한 오라클 데이터베이스에 접속하기

REM 자바 소스 생성
CREATE OR REPLACE JAVA SOURCE NAMED "EmpUtil" AS

import java.sql.*;
import oracle.jdbc.*;

public class EmpUtil {

  /*****************************************************
   * 새로운 사원을 등록한다.
   *****************************************************/
  public static void addEmployee(int empno, String ename, String job, int mgr,
                                 Date hiredate, float sal, float comm, int deptno) {
    try {
      Connection conn = DriverManager.getConnection("jdbc:default:connection:");

      StringBuffer strSQL = new StringBuffer();
      //strSQL.append("INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) ") ;
      //strSQL.append("VALUES(?, ?, ?, ?, ?, ?, ?, ?)") ;
      strSQL.append("INSERT INTO emp (empno,    ename, job,  mgr, ") ;
      strSQL.append("                 hiredate, sal,   comm, deptno) ") ;
      strSQL.append("VALUES(?, ?, ?, ?, ?, ?, ?, ?)") ;

      PreparedStatement pStmt = conn.prepareStatement(strSQL.toString());
      int pos = 1 ;
      pStmt.setInt   (pos++, empno   );
      pStmt.setString(pos++, ename   );
      pStmt.setString(pos++, job     );
      pStmt.setInt   (pos++, mgr     );
      pStmt.setDate  (pos++, hiredate);
      pStmt.setFloat (pos++, sal     );
      pStmt.setFloat (pos++, comm    );
      pStmt.setInt   (pos++, deptno  );
      pStmt.executeUpdate();
      pStmt.close();
    } catch (SQLException e) {
      System.err.println("addEmployee에서 오류 발생:\n" + e.getMessage());
    }
  }

  /*****************************************************
   * 상급자의 이름을 가져온다.
   *****************************************************/
  public static String getManagerName(int empno) {

    String mgrName = "" ;
    try {
      Connection conn = DriverManager.getConnection("jdbc:default:connection:");

      StringBuffer strSQL = new StringBuffer();
      strSQL.append("SELECT (SELECT ename FROM emp m WHERE m.empno = e.mgr) ") ;
      strSQL.append("  FROM emp e ") ;
      strSQL.append(" WHERE empno = ? ") ;

      PreparedStatement pStmt = conn.prepareStatement(strSQL.toString());
      pStmt.setInt(1, empno);
      ResultSet rs = pStmt.executeQuery();
      if (rs.next()) {
        mgrName = rs.getString(1);
      }
      rs.close();
      pStmt.close();
    } catch (SQLException e) {
      System.err.println("getManagerName에서 오류 발생:\n" + e.getMessage());
    }
    return mgrName;
  }
}
/

PAUSE

SET SERVEROUTPUT ON
CALL dbms_java.set_output(2000);

PAUSE

REM 패키지 명세
CREATE OR REPLACE PACKAGE emp_util 
IS
  PROCEDURE add_employee(empno NUMBER, ename VARCHAR2, job VARCHAR2,
                         mgr NUMBER, hiredate DATE, sal NUMBER,
                         comm NUMBER, deptno NUMBER) ;
  FUNCTION  get_manager_name(empno NUMBER) RETURN VARCHAR2 ;
END ;
/

PAUSE

REM 패키지 본체
CREATE OR REPLACE PACKAGE BODY emp_util
IS
  PROCEDURE add_employee(empno NUMBER, ename VARCHAR2, job VARCHAR2,
                         mgr NUMBER, hiredate DATE, sal NUMBER,
                         comm NUMBER, deptno NUMBER)
    AS LANGUAGE JAVA
    NAME 'EmpUtil.addEmployee(int, java.lang.String, java.lang.String,
                              int, java.sql.Date, float, float, int)' ;
    
  FUNCTION get_manager_name(empno NUMBER) RETURN VARCHAR2 
    AS LANGUAGE JAVA
    NAME 'EmpUtil.getManagerName(int) return java.lang.String' ;
END ;
/

PAUSE

REM 이전 테스트 데이터 삭제
DELETE FROM emp WHERE empno = 9000 ;

PAUSE

REM 한 번 실행된 Java 저장 프로그램을 재생성하면 첫 번째 실행시에 다음 오류가 발생한다.
REM ORA-29549: SCOTT.EmpUtil 클래스가 변경되었고, 자바 세션 상태가 삭제되었습니다
REM 이런 경우에는 동일 문장을 한번 더 실행하거나 SQL*Plus를 종료한 후 다시 접속해야 한다.

PAUSE

REM add_employee 프로시저 호출
BEGIN
  -- 사원 등록 프로시저 호출
  emp_util.add_employee(9000, '홍길동', '의적', 7839, DATE'1600-01-01', 9900, NULL, 10) ;
END ;
/

PAUSE

REM 사원의 상급자 조회
COL EMPNO    FORMAT 99999
COL ENAME    FORMAT A10
COL MGR      FORMAT 99999
COL MGR_NAME FORMAT A10
SELECT empno, ename, mgr, emp_util.get_manager_name(empno) mgr_name
  FROM emp 
 ORDER BY empno;
