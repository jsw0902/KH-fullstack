/*
        DML
            - DQL : SELECT (데이터의 변화가 없음)
            - 그 외 : INSERT, UPDATE, DELETE
            
        INSERT : 데이터를 삽입하는 SQL 구문
        UPDATE : 데이터를 수정하는 SQL 구문
        DELETE : 데이터를 삭제하는 SQL 구문
        
*/

/*
    - INSERT -
    
    [표현식]
    
    1) INSERT INTO 테이블명 VALUES (값1, 값2, 값3.......);
    2) INSERT INTO 테이블명 (컬럼1, 컬럼2, 컬럼3...) VALUES (값1, 값2, 값3.......);
    
*/

SELECT *
  FROM EMPLOYEE;
  
/*
    1번 표현식을 이용한 INSERT
    - 컬럼 순서를 지켜서 VALUES에 값을 나열해야 함.
*/
INSERT INTO EMPLOYEE
VALUES (900, '장승원', '020902-3111111', 'SIUUUUU@iei.or.ke', '0109999999', 'D9', 'J3',
        'S1', 10000000, 50, '201', SYSDATE, NULL, DEFAULT);
  
-- NOT ENOUGH VALUES : 값이 충분하지 않다.      
INSERT INTO EMPLOYEE
VALUES (901, '장승원', '020902-3111111', 'SIUUUUU@iei.or.ke', '0109999999', 'D9', 'J3'
);

-- TOO MANY VALUES : 명시되어 있는 컬럼 숫자보다, 값이 많다.
INSERT INTO EMPLOYEE
VALUES (900, '장승원', '020902-3111111', 'SIUUUUU@iei.or.ke', '0109999999', 'D9', 'J3',
        'S1', 10000000, 50, '201', SYSDATE, NULL, DEFAULT, '320', 3235253, 42342342);
        
/*
    2번 표현식을 이용한 INSERT
    - 제시한 컬럼에 대한 값만 INSERT 할 때 사용.
    - 제시하지 않은 컬럼의 값은 빈 값을 의미하는 NULL이 추가.
    - 테이블 생성 시, DEFAULT 값이 지정되어 있는 경우 INSERT에 제시하지 않아도 기본값이 추가됨.
*/

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, SAL_LEVEL, HIRE_DATE)
VALUES (901, '카리나', '000411-4548654', 'J1', 'S2', SYSDATE);

-- INSERT 이후, SELECT
SELECT *  -- ENT_YN은 INSERT하지 않았지만, DEFAULT 값이 지정되어 있어 추가된 것을 확인할 수 있음.
  FROM EMPLOYEE;
  
  
/*
    INSERT INTO 테이블명 (서브쿼리)
    
    - 값을 직접 명시하여 추가하는 것이 아니고,
      서브쿼리로 조회된 결과를 통쨰로 추가할 수 있음.
      
*/

-- 테스트 테이블 생성
CREATE TABLE EMP_01 (
       EMP_ID VARCHAR(3), -- 사원번호
       EMP_NAME VARCHAR2(20), -- 사원명
       DEPT_TITLE VARCHAR2(20) -- 부서명
);

-- 서브 쿼리의 결과 전체를 EMP_01 테이블에 INSERT
INSERT INTO EMP_01
(SELECT EMP_ID, EMP_NAME, DEPT_TITLE
  FROM EMPLOYEE
  LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
  );

SELECT *
  FROM EMP_01;
  
ROLLBACK;
/*
    INSERT ALL
    -- 여러 테이블에 한번에 데이터를 추가하는 구문
    
    INSERT ALL
    INTO 테이블명 VALUES (컬럼1,컬럼2,컬럼3)
    INTO 테이블명 VALUES (컬럼2,컬럼4,컬럼5)
*/

-- 테스트를 위한 테이블 생성
-- 데이터 구조(컬럼)만 복사하여 테이블 생성
CREATE TABLE EMP_DEPT
AS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
  FROM EMPLOYEE
 WHERE 1=0; -- 무조건 FALSE 나오게끔 작성하여, 조회되지 않도록


CREATE TABLE EMP_MANAGER
AS
SELECT EMP_ID, EMP_NAME, MANAGER_ID
  FROM EMPLOYEE
 WHERE 1=0; 

-- 아래 SELECT 결과의 컬럼을 VALUES의 값으로 지정.  
INSERT ALL
INTO EMP_DEPT VALUES (EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
INTO EMP_MANAGER VALUES (EMP_ID, EMP_NAME, MANAGER_ID)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID, HIRE_DATE
   FROM EMPLOYEE;
-- WHERE DEPT_CODE IN ('D5', 'D8'); --서브쿼리에 조건식 작성하여, 특정 행만 추가될 수 있도록 처리 가능.

ROLLBACK;

SELECT * FROM EMP_DEPT;
SELECT * FROM EMP_MANAGER;

INSERT ALL
WHEN HIRE_DATE < '2000/01/01' THEN -- 아래 SELECT 결과 중, 입사일자가 2000년 이전의 사원들만 EMP_DEPT에 추가
INTO EMP_DEPT VALUES (EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
WHEN HIRE_DATE >= '2000/01/01' THEN -- 아래 SELECT 결과 중, 입사일자가 2000년 이후인 사람들만 EMP_MANAGER에 추가
INTO EMP_MANAGER VALUES (EMP_ID, EMP_NAME, MANAGER_ID)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID, HIRE_DATE
   FROM EMPLOYEE;


/*

    - UPDATE -
    테이블내에 존재하는 데이터를 수정하는 구문


    [표현식]
    UPDATE 테이블명
       SET 컬럼명 = 변경값,
           컬럼명 = 변경값,
           컬럼명 = 변경값
           
    [WHERE 조건식] ==> 생략이 가능. 단, 생략 시 모든 행에 대한 업데이트가 진행되므로 주의
    
    
*/

CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPARTMENT;


SELECT * FROM DEPT_COPY;

-- 총무부 => 전략기획부로 부서명 변경
UPDATE DEPT_COPY -- 변경대상 테이블
   SET DEPT_TITLE = '전략기획부' -- 변경대상 컬럼 = 변경값 
 WHERE DEPT_ID = 'D9'; -- 변경대상 ROW
 

CREATE TABLE EMP_SALARY
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, BONUS
     FROM EMPLOYEE;
     
SELECT * FROM EMP_SALARY;

-- 노옹철 사원의 급여 400만원으로 변경

UPDATE EMP_SALARY
   SET SALARY = 4000000
 WHERE EMP_NAME = '노옹철';

-- 선동일 사원의 급여 750만원으로 변경하고, 보너스는 0.25로 변경
UPDATE EMP_SALARY
   SET SALARY = 7500000, BONUS = 0.25
 WHERE EMP_NAME = '선동일';
 
/*
    - 서브 쿼리를 통한 UPDATE
    
    UPDATE 테이블명
       SET 변경 컬럼 = (서브쿼리)
    [WHERE 조건식]
*/

-- 박명수 사원의 급여와 보너스를 유재식 사원과 동일하게 변경
UPDATE EMP_SALARY
   SET SALARY = (SELECT SALARY FROM EMP_SALARY WHERE EMP_NAME = '유재식'),
       BONUS = (SELECT BONUS FROM EMP_SALARY WHERE EMP_NAME = '유재식')
 WHERE EMP_NAME = '방명수';


-- 서브 쿼리로 조회한 첫번 째 컬럼값이 SALARY의 값으로
-- 서브 쿼리로 조회한 두번 째 컬럼값이 BONUS의 값으로
UPDATE EMP_SALARY
   SET (SALARY, BONUS) = (SELECT SALARY,BONUS FROM EMP_SALARY WHERE EMP_NAME = '유재식')  
 WHERE EMP_NAME = '방명수';

-- ASIA 근무 지역에 근무하는 사원들의 보너스율을 0.5로 변경
UPDATE EMP_SALARY
   SET BONUS = 0.2
 WHERE DEPT_CODE IN (
                    SELECT DEPT_CODE 
                    FROM EMP_SALARY
                    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
                    JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
                    WHERE LOCAL_NAME LIKE '%ASIA%');

/*
    DELETE
    - 테이블에 기록된 데이터를 삭제하는 구문
    
    [표현식]
    DELETE
    FROM 테이블명
    [WHERE 조건식] -- 생략 시, 전체 행이 삭제됨. 주의
    
*/

SELECT * FROM EMPLOYEE;

DELETE
  FROM employee
 WHERE EMP_ID = '900';
 
 -- 특정 컬럼의 값만을 삭제하는 것은 불가. DELETE는 행 단위로 삭제!
 -- DELETE FROM employee WHERE EMP_ID = '901';
 
 DELETE
   FROM EMPLOYEE
  WHERE EMP_ID = (SELECT EMP_ID FROM EMPLOYEE WHERE EMP_NAME = '카리나');
  
-- 현재 시간을 기준으로 특정 이전 시간의 데이터를 조회
-- DELETE 및 최종 반영 후, 데이터를 복구해야할 때 유용하게 사용될 수 있다.
SELECT *
  FROM EMP_01 AS OF TIMESTAMP(SYSTIMESTAMP-INTERVAL '1' MINUTE);
  
DELETE
  FROM EMP_01;
  
  
/*
    TRUNCATE
    
    - 테이블의 전체 데이터를 삭제할 때 사용되는 구문.
    - 성능적으로 DELETE보다 빠름.
    - 특정 조건식(WHERE) 작성 불가. 비교 연산이 없으므로 DELETE 성능적으로 우수.
    - ROLLBACK (복구)가 불가능
    
    [표현식]
    TRUNCATE TABLE 테이블명;
*/

DELETE
  FROM EMP_DEPT;
  
SELECT * FROM EMP_DEPT;

ROLLBACK;

TRUNCATE TABLE EMP_DEPT;