SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 오라클에서 지원하지 않는 기능을 Java로 구현하기
REM SHA-256 암호화 예제

REM 자바 소스 생성

REM SQL*Plus가 &&(자바의 AND 연산자)를 치환 변수로 인식하지 않게 한다.
SET DEFINE OFF

CREATE OR REPLACE JAVA SOURCE NAMED "Sha256Encryption" AS

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import sun.misc.BASE64Encoder;

public class Sha256Encryption {
  public static String encrypt(String clearText) {
    try {
      if (clearText != null && clearText != "") {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(clearText.getBytes());
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(md.digest());
      } else {
        return "";
      }
    } catch (NoSuchAlgorithmException e) {
      return "";
    }
  }
}
/

PAUSE

REM 함수 명세
CREATE OR REPLACE FUNCTION sha256_encrypt(clear_text VARCHAR2) RETURN VARCHAR2 
  AS LANGUAGE JAVA
  NAME 'Sha256Encryption.encrypt(java.lang.String) return java.lang.String';
/

PAUSE

REM 한 번 실행된 Java 저장 프로그램을 재생성하면 첫 번째 실행시에 다음 오류가 발생한다.
REM ORA-29549: SCOTT.Sha256Encryption 클래스가 변경되었고, 자바 세션 상태가 삭제되었습니다
REM 이런 경우에는 동일 문장을 한번 더 실행하거나 SQL*Plus를 종료한 후 다시 접속해야 한다.

PAUSE

REM 함수 실행
COL 암호값 FORMAT A70
SELECT sha256_encrypt('Java Stored Program') 암호값 FROM DUAL ;
