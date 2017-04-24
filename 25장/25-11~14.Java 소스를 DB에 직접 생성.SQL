REM 1. 자바 소스 생성
CREATE OR REPLACE JAVA SOURCE NAMED "MyStringUtility" AS
public class MyStringUtility {
  public static String reverseString(String s) {
    return ( new StringBuffer(s) ).reverse().toString();
  }
}
/

PAUSE

REM 2. 자바 저장 프로시저 호출 명세
CREATE OR REPLACE FUNCTION reverse_string(string VARCHAR2) RETURN VARCHAR2
  AS LANGUAGE JAVA
  NAME 'MyStringUtility.reverseString(java.lang.String) return java.lang.String';
/

PAUSE

REM 한 번 실행된 자바 저장 프로그램을 재생성하면 첫 번째 실행시에 다음 오류가 발생한다.
REM ORA-29549: SCOTT.MyStringUtility 클래스가 변경되었고, 자바 세션 상태가 삭제되었습니다
REM 이런 경우에는 동일 문장을 한번 더 실행하거나 SQL*Plus를 종료한 후 다시 접속해야 한다.

PAUSE

REM 3. 자바 저장 프로시저 실행
COL 문자열 FORMAT A70
SELECT reverse_string('PL/SQL 프로그래밍') 문자열 FROM DUAL ;

PAUSE

REM 4. 자바 저장 프로시저 삭제
DROP FUNCTION reverse_string ;
DROP JAVA SOURCE "MyStringUtility" ;
