SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 커서 매개변수를 사용하지 않고 글로벌 변수를 사용한 경우
REM 모듈화의 두 가지 원칙인 높은 응집도와 낮은 결합도를 
REM 정면으로 위배하는 나쁜 코딩 방법의 사례다.
DECLARE
  v_name  emp.ename%TYPE ;
  v_empno NUMBER ;
  
  -- 매개변수를 가지지 않는 커서
  CURSOR ename_cursor IS
   SELECT ename
     FROM emp
    WHERE empno = v_empno ; -- 매개변수로 상위 블록에 선언된 변수를 사용한다.
BEGIN
  v_empno := 7788 ;
  
  -- 커서를 OPEN한다. 위에서 설정한 변수 v_empno의 값 7788이 커서 OPEN시에 사용된다.
  OPEN ename_cursor ;
  
  -- SELECT 결과를 FETCH한다.
  FETCH ename_cursor 
   INTO v_name ;
  DBMS_OUTPUT.PUT_LINE('이름 = '||v_name) ;
   
  -- 커서를 CLOSE한다.
  CLOSE ename_cursor ;
END ;
/
