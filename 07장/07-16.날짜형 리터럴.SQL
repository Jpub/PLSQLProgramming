SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

REM 다양한 날짜형 리터럴 예제
DECLARE
  v_dt          DATE ;
  v_ts          TIMESTAMP ;
  v_tstz        TIMESTAMP WITH TIME ZONE ;
  v_intervalY2M INTERVAL YEAR    TO MONTH ; -- 기본은 YEAR(2)
  v_intervalY3M INTERVAL YEAR(3) TO MONTH ;
  v_intervalDS  INTERVAL DAY TO SECOND(9) ;
BEGIN
  -- 날짜형 리터럴
  v_dt := TO_DATE('2013-01-01', 'YYYY-MM-DD') ;
  v_dt := DATE'2013-01-01' ;
  
  -- 일시형 리터럴
  v_dt := TO_DATE('2013-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS') ;
  v_dt := TIMESTAMP'2013-01-01 12:00:00' ;
  
  -- TIMESTAMP형 리터럴
  v_ts := TO_TIMESTAMP('2013-01-01 12:00:00.123', 'YYYY-MM-DD HH24:MI:SS.FF') ;
  v_ts := TIMESTAMP'2013-01-01 12:00:00.123' ;
  v_ts := TO_TIMESTAMP_TZ('2013-01-01 12:00:00 +02:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM') ;
  
  -- TIMESTAMP WITH TIME ZONE형 리터럴
  v_ts := TIMESTAMP'2013-01-01 12:00:00 +02:00' ;
  
  -- INTERVAL YEAR TO MONTH형 리터럴
  v_intervalY3M := INTERVAL '123-4' YEAR TO MONTH ; -- 123년 4개월
  v_intervalY3M := INTERVAL '123' YEAR ;            -- 123년
  v_intervalY3M := INTERVAL '50' MONTH ;            -- 50개월(4년 2개월)
  -- v_intervalY2M := INTERVAL '123' YEAR ; -- ORA-01873: 간격의 선행 정밀도가 너무 작습니다
  
  -- INTERVAL DAY TO SECOND형 리터럴
  v_intervalDS := INTERVAL '4 5:12:10.222' DAY TO SECOND ;
END ;
/

