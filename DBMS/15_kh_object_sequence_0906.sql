/*
    시퀀스(SEQUENCE)
    
    - 자동으로 연속된 숫자를 발생시켜주는 객체
    - 정수값을 순차적으로 증가시키며 발생시킴.
    
    [표현식]
    
    CREATE SEQUENCE 시퀀스명
    [START WITH 시작숫자]       -- 처음 발생한 숫자  (기본값 1)
    [INCREMENT BY 증감숫자]     -- 몇씩 증가시킬건지 (기본값1)
    [MAXVALUE 최대값]           -- 최대값 지정 (기본값 엄청 크다)
    [MINVALUE 최소값]           -- 최소값 지정 (기본값 1)
    [CYCLE | NOCYCLE]          -- 값 순환 여부 (CYCLE로 설정된 경우 최대값 이후, 순환)
    [NOCACHE | CACHE]          -- 캐시 메모리 할당. (캐시 : 발생될 숫자를 미리 저장해놓는 공간)
*/

CREATE SEQUENCE SEQ_EMPNO; -- 아무 옵션을 지정하지 않아도 생성 가능
DROP SEQUENCE SEQ_EMPNO;


CREATE SEQUENCE SEQ_EMPNO
START WITH 3        -- 처음 시작값
INCREMENT BY 1      -- 증가값
MAXVALUE 10         -- 최대값
MINVALUE 1          -- 최소값
NOCYCLE;             -- 순환하지 않음!

SELECT SEQ_EMPNO.CURRVAL FROM DUAL;     -- 오류 : 처음 한번은 NEXTVAL를 통해 값을 증가 시켜야 함.
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;     -- NEXTVAL : 다음 값
SELECT SEQ_EMPNO.CURRVAL FROM DUAL;     -- CURRVAL : 현재 값 (마지막에 성공적으로 수행된 NEXTVAL의 값)

-- MAXVALUE까지 NEXTVAL 수행!
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;   
SELECT SEQ_EMPNO.CURRVAL FROM DUAL; -- 10 == MAXVALUE
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; -- 최대값 도달 후, 시퀀스의 옵션이 NOCYCLE이기 때문에 오류 발생!


DROP SEQUENCE SEQ_EMPNO;

CREATE SEQUENCE SEQ_EMPNO
START WITH 3        -- 처음 시작값
INCREMENT BY 1      -- 증가값
MAXVALUE 10         -- 최대값
MINVALUE 1          -- 최소값
CYCLE               -- 값 순환
NOCACHE;             

SELECT SEQ_EMPNO.CURRVAL FROM DUAL;
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; -- MAXVALUE까지 증가 후, CYCLE로 설정되어 값이 초기화된다.
-- 단, 순환되었을 때 처음 값이 MINVALUE!!




--------------------------------------------------------------------------------
/*
    테이블과 시퀀스의 독립적인 관계
*/

CREATE TABLE EMP_COPY2
AS
SELECT EMP_ID, EMP_NAME, PHONE
  FROM EMPLOYEE
 WHERE 1=0;

CREATE SEQUENCE SEQ_EMPNO
START WITH 1        -- 처음 시작값
INCREMENT BY 1      -- 증가값
MAXVALUE 10         -- 최대값
MINVALUE 1          -- 최소값
CYCLE               -- 값 순환
NOCACHE; 

SELECT *
  FROM EMP_COPY2;

  
INSERT INTO EMP_COPY2 VALUES (SEQ_EMPNO.NEXTVAL, '장승원', '01012345678'); -- EMP_ID == 1
SELECT SEQ_EMPNO.CURRVAL FROM DUAL; -- 이전 INSERT가 정상적으로 수행되어, 마지막 NEXTVAL인 1을 출력


INSERT INTO EMP_COPY2 VALUES (SEQ_EMPNO.NEXTVAL, '카리나', '01012345678', 1234);
SELECT SEQ_EMPNO.CURRVAL FROM DUAL; -- 이전 INSERT에서 컬럼 갯수 오류가 발생하여, 마지막 NEXTVAL인 1을 출력


INSERT INTO EMP_COPY2 VALUES (SEQ_EMPNO.NEXTVAL, '윈터', '010654654654654');
SELECT SEQ_EMPNO.CURRVAL FROM DUAL; -- 컬럼의 갯수 비교 수, 내부 값을 순차적으로 검사(길이, 자료형)하기 때문에 NEXTVAL이 수행되었음.



/*
    1부터 9999까지 1씩 증가하는 시퀀스.
    CYCLE로 설정된 경우.
*/
SELECT TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(SEQ_EMPNO.NEXTVAL, 4, '0') FROM DUAL; -- 하루에 9999개 등록 가능
SELECT TO_CHAR(SYSDATE, 'YYMMDDHH') || LPAD(SEQ_EMPNO.NEXTVAL, 4, '0') FROM DUAL; -- 1시간에 9999개 등록 가능
SELECT TO_CHAR(SYSDATE, 'YYMMDDHH24MI') || LPAD(SEQ_EMPNO.NEXTVAL, 4, '0') FROM DUAL; -- 1분에 9999개 등록 가능


