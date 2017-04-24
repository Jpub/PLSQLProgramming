SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 프리픽스 Q를 사용한 다음 문자열 리터럴의 예는
REM 모두 올바른 사용이며 모두 동일한 값이다.
BEGIN
  DBMS_OUTPUT.PUT_LINE(Q'[Scott's cat]') ;
  DBMS_OUTPUT.PUT_LINE(Q'{Scott's cat}') ;
  DBMS_OUTPUT.PUT_LINE(Q'<Scott's cat>') ;
  DBMS_OUTPUT.PUT_LINE(Q'(Scott's cat)') ;
  DBMS_OUTPUT.PUT_LINE(Q'!Scott's cat!') ;
  DBMS_OUTPUT.PUT_LINE(Q'#Scott's cat#') ;
  DBMS_OUTPUT.PUT_LINE(Q'aScott's cata') ;
  DBMS_OUTPUT.PUT_LINE(Q'SScott's catS') ;
  DBMS_OUTPUT.PUT_LINE(Q'가Scott's cat가') ;
END ;
/
