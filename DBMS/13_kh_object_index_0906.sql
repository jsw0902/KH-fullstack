/*
    INDEX : DBMS에서 쿼리의 수행 성능을 높이기 위해서, 특정 컬럼에 설정하는 객체
    
    
    특징)
    
    - DML(INSERT, UPDATE, DELETE)가 자주 실행되는 컬럼에 대해서, INDEX 설정 시 성능 저하가 발생할 수 있음.
    - 일반적으로 SELECT SQL의 수행 성능을 높이기 위해서 사용되는 객체.
    
    - PRIMARY KEY 컬럼에 대해서 설정하거나, WHERE 조건식에 자주 사용되는 컬럼에 대해서 일반적으로 생성한다.
    
    [표현식]
    
    CREATE INDEX 인덱스명 ON 테이블명(컬럼명);    
*/

-- EMPLOYEE 테이블의 EMP_NAME 컬럼에 INDEX 설정
CREATE INDEX IDX_NAME ON EMPLOYEE(EMP_NAME);




-- EXAMA 계정으로 접속하여, index 설정 시 수행 속도 향상 테스트!


SELECT STUDENT_NO,
       STUDENT_NAME,
       DEPARTMENT_NAME,
       STUDENT_SSN,
       STUDENT_ADDRESS,
       ENTRANCE_DATE,
       PROFESSOR_NAME,
       ROUND((SELECT AVG(POINT) FROM TB_GRADE G WHERE G.STUDENT_NO = S.STUDENT_NO), 1) AS POINT_AVG
  FROM TB_STUDENT S
  LEFT JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
  LEFT JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO);

-- 인덱스 미 설정시 : 0.011
CREATE INDEX IDX_GRADE_STD_NO ON TB_GRADE(STUDENT_NO);
-- 인덱스 설정 시 : 0.002

-- 인덱스 삭제
DROP INDEX IDX_GRADE_STD_NO;

