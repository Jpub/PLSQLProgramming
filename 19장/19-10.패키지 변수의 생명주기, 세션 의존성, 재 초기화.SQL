SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 패키지 변수의 생명주기, 세션 의존성, 재 초기화 예제

REM 다음 문장이 실행될 때 패키지 변수가 초기화된다.
SELECT pkg_seq.get_nextval FROM dual ;

PAUSE

SELECT pkg_seq.get_nextval FROM dual ;

PAUSE

SELECT pkg_seq.get_nextval FROM dual ;

PAUSE

REM 패키지가 재컴파일되면 패키지는 메모리에서 제거된다.
ALTER PACKAGE pkg_seq COMPILE ;


PAUSE

REM 다음 문장이 실행될 때 패키지 변수가 다시 초기화된다.
SELECT pkg_seq.get_nextval FROM dual ;

PAUSE

SELECT pkg_seq.get_nextval FROM dual ;


PAUSE

REM SQL*Plus를 종료 후 재접속한다.
REM EXIT

REM sqlplus scott/tiger

REM 재접속 하면 패키지는 메모리에 존재하지 않고, 다음 줄에서 다시 초기화된다.
SELECT pkg_seq.get_nextval FROM dual ;