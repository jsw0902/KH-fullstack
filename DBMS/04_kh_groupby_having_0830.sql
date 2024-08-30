/*
    GROUP BY
    - 그룹 함수 사용 시, 그룹의 기준을 작성하는 구문
    
    파싱(탐색) 순서
    SELECT 컬럼명, 그룹함수 FROM 테이블명 WHERE 조건식 GROUP BY 그룹 기준 HAVING 그룹함수 조건식 ORDER BY 정렬기준;
    
    FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY
    FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
*/

-- 전체 사원의 급여 총 합계
SELECT SUM(SALARY) FROM EMPLOYEE;

-- 직급별 급여 총 합계
SELECT SUM(SALARY) FROM EMPLOYEE GROUP BY job_code;

--부서별 급여 총 합계
SELECT DEPT_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE;

-- 부서별 직원 수
SELECT DEPT_CODE, COUNT(*) FROM EMPLOYEE GROUP BY DEPT_CODE;

-- 직급별 최소 급여
SELECT JOB_CODE, MIN(SALARY) FROM EMPLOYEE GROUP BY JOB_CODE;

-- 직급별 최대 급여 
SELECT JOB_CODE, MAX(SALARY) FROM EMPLOYEE WHERE JOB_CODE NOT IN('J1', 'J3') GROUP BY JOB_CODE
ORDER BY 1;

-- 각 직급별 총 사원 수, 보너스를 받는 사원 수, 급여의 한계, 평균 급여, 최대 급여, 최소 급여
SELECT JOB_CODE, DEPT_CODE,
       COUNT(*) "총 사원 수",
       COUNT(BONUS) "보너스를 받는 사원 수",
       SUM(SALARY) "급여의 합계",
       AVG(SALARY) "평균 급여",
       MAX(SALARY) "최대 급여",
       MIN(SALARY) "최소 급여"
    FROM EMPLOYEE
GROUP BY JOB_CODE, DEPT_CODE
ORDER BY JOB_CODE, DEPT_CODE;

-- 성별 최소 급여, 총 사원수
SELECT SUBSTR(EMP_NO, 8, 1),
       MIN(SALARY),
       COUNT(*)
    FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO, 8, 1);

SELECT DECODE(SUBSTR(EMP_NO, 8,1), '1','1','2','2','3','1','4','2') 성별,
       MIN(SALARY),
       COUNT(*)
    FROM EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남', '2', '여', '3', '남', '4', '여');

/*
    HAVING
        - 그룹 함수에 대한 조건식을 작성.
*/

-- 각 직급별 총 사원수를 조회. 단, 2명 이상인 경우.

SELECT JOB_CODE, COUNT(*) FROM EMPLOYEE GROUP BY JOB_CODE HAVING COUNT(*) > 1;

-- 부서별 평균 급여가 300만원 이상인 부서코드, 평균 급여 조회
SELECT DEPT_CODE,
        AVG(SALARY)
    FROM EMPLOYEE
GROUP BY DEPT_CODE HAVING AVG(SALARY) >= 300000;
--HAVING AVG(SALARY) BETWEEN 1000000 AND 3000000;

-- 보너스를 받지 않는 사원만 존재하는 부서 조회
SELECT DEPT_CODE, BONUS FROM EMPLOYEE ORDER BY DEPT_CODE;

-- 1) 부서별로 보너스를 받는 사원 수 조회
SELECT DEPT_CODE, COUNT(BONUS) -- 유효한 행의 숫자만 반환
FROM EMPLOYEE GROUP BY DEPT_CODE;

SELECT DEPT_CODE, COUNT(BONUS)
FROM EMPLOYEE GROUP BY DEPT_CODE HAVING COUNT(BONUS) = 0; -- 유효한 행이 없는! 즉, NULL 데이터만 포함한 부서코드

