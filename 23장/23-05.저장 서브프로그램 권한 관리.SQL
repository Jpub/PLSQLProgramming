SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM ===========================================
REM DBA 계정에서 ROLE 생성
REM ===========================================
CREATE ROLE scott_pgm_role ;

REM ===========================================
REM scott_pgm_role을 계정 tiger, hr, sh에 부여
REM ===========================================
GRANT scott_pgm_role TO tiger ;
GRANT scott_pgm_role TO hr ;
GRANT scott_pgm_role TO sh ;

CONN scott/tiger

REM ===========================================
REM 저장 서브프로그램의 실행 권한을 ROLE에 부여
REM ===========================================
GRANT EXECUTE ON factorial TO scott_pgm_role ;
GRANT EXECUTE ON pkg_emp   TO scott_pgm_role ;
GRANT EXECUTE ON log_msg   TO scott_pgm_role ;
