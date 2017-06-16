SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 트리거 예제
CREATE OR REPLACE TRIGGER tr_emp_ins_upd_validate
  BEFORE INSERT OR UPDATE OF sal, comm ON emp
  REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
BEGIN
  IF INSERTING THEN
    IF :NEW.sal < 0 THEN 
      DBMS_OUTPUT.PUT_LINE('급여가 음수입니다.');
      :NEW.sal := NULL ;
    END IF ;
    IF :NEW.comm < 0 THEN 
      DBMS_OUTPUT.PUT_LINE('커미션이 음수입니다.');
      :NEW.comm := NULL ;
    END IF ;
  ELSIF UPDATING THEN
    IF :OLD.sal > :NEW.sal THEN 
      DBMS_OUTPUT.PUT_LINE('급여가 낮아졌습니다.');
      :NEW.sal := :OLD.sal;
    END IF ;
    IF :OLD.comm > :NEW.comm THEN 
      DBMS_OUTPUT.PUT_LINE('커미션이 낮아졌습니다.');
      :NEW.comm := :OLD.comm ;
    END IF ;
  END IF ;
END;
/
