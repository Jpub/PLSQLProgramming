SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 재정의된 메소드 사용
DECLARE
  v_emp employee_type := employee_type('홍', '길동', '청학동', '일번지',
                                       1000, 9900, 10, NULL) ;
BEGIN
  DBMS_OUTPUT.PUT_LINE(v_emp.display) ;                  -- employee_type의 display 호출
  DBMS_OUTPUT.PUT_LINE((v_emp AS person_type).display) ; -- person_type의 display 호출
  DBMS_OUTPUT.PUT_LINE(person_type.display((v_emp AS person_type)));
                                                         --person_type의 display 호출
END ;
/
