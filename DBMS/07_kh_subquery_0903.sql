/*
    서브쿼리 (SUB QUERY)
    
    - 하나의 SELECT 문장 내부에, 포함된 또 하나의 SELECT 문법
    
    * 주의 사항 *
    - 서브쿼리는 반드시 소괄호()로 묶어야 한다.
    - 서브쿼리는 다양한 위치에서 사용이 가능하다.
    - FROM절에 사용되는 서브쿼리 이외의 위치에서 ORDER BY 사용이 불가능하다.

    * 서브쿼리의 구분
    
    - 서브쿼리의 결과값에 따라서 아래와 같이 구분된다.
    
    - 단일행           : 서브쿼리의 조회 결과값이 단일값일 때 (1행 1열)
    - 다중행           : 서브쿼리의 조회 결과값이 여러행일 때 (N행 1열)
    - 다중열           : 서브쿼리의 조회 결과값이 여러열일 때 (1행 N열)
    - 다중행 다중열     : 서브쿼리의 조회 결과값이 여러행 여러열일 때 (N행 N열)
    
    - 상관            : 서브쿼리 실행 시, 메인쿼리의 각 행을 참조하는 상호연관 서브쿼리
    - 스칼라          : 단일값을 반환하는 서브쿼리
*/

-- 노옹철 사원과 같은 부서에 속한 사원들 조회
SELECT *
  FROM EMPLOYEE
 WHERE EMP_NAME = '노옹철';
 
 SELECT *
   FROM EMPLOYEE
  WHERE DEPT_CODE = 'D9'; -- 위에서 조회된 부서코드를 가진 사원들 조회
  
-- 서브쿼리를 사용한 "노옹철 사원과 같은 부서에 속한 사원들" 조회
SELECT *
   FROM EMPLOYEE
  WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철');
  
  
-- 전 직원의 평균 급여보다 많은 급여를 받는 사원들의 정보 조회
SELECT AVG(SALARY)
  FROM EMPLOYEE; -- 3047662
  
SELECT *
  FROM EMPLOYEE
WHERE SALARY > 3047662; -- 평균 급여보다 많이 받는 사원들

-- 서브쿼리 사용
SELECT *
  FROM EMPLOYEE
 WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);
 
-------------------------- 단일행 서브쿼리 --------------------------

-- 1) 전 직원 평균 급여보다 급여를 더 적게 받는 사원들 정보 조회
SELECT *
  FROM EMPLOYEE
 --WHERE SALARY < 평균급여;
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEE);

-- 2) 최저 급여를 받는 사원 정보
SELECT *
  FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);

-- 3) 노옹철 사원의 급여보다 많이 받는 사원 정보 조회
-- 노옹철 사원의 급여 정보를 알아야한다. => 메인 쿼리의 WHERE, 서브 쿼리의 WHERE
SELECT *
  FROM EMPLOYEE
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '노옹철');

-- 4) D1,D2 부서에 근무하는 사원들 중, 급여가 D5 부서 직원들의 평균 급여보다 많은 급여를 받는 사원들 조회
SELECT *
  FROM EMPLOYEE
WHERE DEPT_CODE IN ('D1', 'D2')
   AND SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE = 'D5');


-- 5) 부서별 급여합이 가장 큰 부서의 부서 코드와 급여의 합계 조회
SELECT MAX(SUM(SALARY)) -- 부서별 급여 합계 중, 가장 큰 값
  FROM EMPLOYEE
 GROUP BY DEPT_CODE;
 
SELECT DEPT_CODE, SUM(SALARY)
  FROM EMPLOYEE
 GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                        FROM EMPLOYEE
                       GROUP BY DEPT_CODE);
                       
-- 6) 전지연 사원과 같은 부서원들의 사번, 사원명, 전화번호, 입사일 조회
-- 단, 전지연 사원은 제외하고 출력

SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE
  FROM EMPLOYEE
 WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '전지연')
   --AND EMP_NAME != '전지연';
   AND EMP_ID != (SELECT EMP_ID FROM EMPLOYEE WHERE EMP_NAME = '전지연');
   
----------------------------------다중행 서브쿼리------------------------------------------
/*
    서브쿼리의 결과값이 여러 행 일 때
    
    * 다중행 서브쿼리에서 주로 사용되는 연산자 : IN, ANY, ALL
    
    IN : 여러개의 결과값 중에서 하나라도 일치하는 값이 있는지
    
    A > ANY 서브쿼리 : 여러개의 결과값중에서 A값이 "한개라도" 클 경우. (여러개 결과값중에서 가장 작은값보다 클 경우)
    A < ANY 서브쿼리 : 여러개의 결과값중에서 A값이 "한개라도" 작을 경우 (여러개의 결과값중에서 가장 큰 값보다 작을 경우)
    
        A > ANY (값1, 값2, 값3)
        A > 값1 OR A > 값2 OR A > 값3 과 같은 의미.
    
    A > ALL 서브쿼리 : 여러개의 "모든" 결과값들 보다 A가 클 경우
    A < ALL 서브쿼리 : 여러개의 "모든" 결과값들 보다 A가 작을 경우
    100 < ANY (50, 80, 150)    
        
        A > ALL (값1, 값2, 값3)
        A > 값1 AND A> 값2 AND A > 값3 과 같은 의미.
        
   A > ALL 서브쿼리 : 여러개의 "모든" 결과값들 보다 A가 클 경우
   A < ALL 서브쿼리 : 여러개의 "모든" 결과값들 보다 A가 작을 경우
*/

-- IN

-- 담당하고 있는 사원이 여러명인 사원
SELECT MANAGER_ID, COUNT(MANAGER_ID)
  FROM EMPLOYEE
  GROUP BY MANAGER_ID
  HAVING COUNT(MANAGER_ID) > 1;
  
SELECT *
  FROM EMPLOYEE
 WHERE EMP_ID IN ('200', '204', '207', '214');
 
SELECT *
  FROM EMPLOYEE
 WHERE EMP_ID IN (SELECT MANAGER_ID
                 FROM EMPLOYEE
                 GROUP BY MANAGER_ID
                 HAVING COUNT(MANAGER_ID) > 1);
                 
-- 부서별 최고 급여를 받는 직원
-- = 연산자로 비교할 수 없는 이유 : 서브쿼리의 결과 행 중 어떤것과 비교할지 알 수 없음.
SELECT *
  FROM EMPLOYEE
  WHERE SALARY IN (SELECT MAX(SALARY)
                  FROM EMPLOYEE
                  GROUP BY DEPT_CODE);
 -- 유재식, 윤은해 사원과 같은 직급인 사원들의 사번, 사원명, 직급코드, 급여
 SELECT *
  FROM EMPLOYEE
 WHERE EMP_NAME IN ('유재식', '윤은해');
 
 SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
   FROM EMPLOYEE
  WHERE JOB_CODE IN ('J3', 'J7');
  
SELECT EMP_ID, EMP_NAME, JOB_CODE
  FROM EMPLOYEE
 WHERE JOB_CODE IN (SELECT JOB_CODE
                   FROM EMPLOYEE
                  WHERE EMP_NAME IN ('유재식', '윤은해'));
                  
                  
SELECT JOB_CODE
  FROM EMPLOYEE
 WHERE EMP_NAME IN ('유재식', '정중하');
 
 SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
   FROM EMPLOYEE
  WHERE JOB_CODE IN ('J3', 'J3');
  
SELECT EMP_ID, EMP_NAME, JOB_CODE
  FROM EMPLOYEE -- 서브쿼리의 결과가 1행이기 때문에, = 연산이 가능하다
 WHERE JOB_CODE = (SELECT DISTINCT JOB_CODE
                   FROM EMPLOYEE
                  WHERE EMP_NAME IN ('유재식', '정중하'));
                  
-- ANY
SELECT * FROM EMPLOYEE WHERE SALARY > ANY(2000000, 3000000) ORDER BY SALARY;
-- SELECT * FROM EMPLOYEE WHERE SALARY > 2000000 OR SALARY > 3000000 ORDER BY SALARY;
SELECT * FROM EMPLOYEE WHERE SALARY < ANY(2000000, 3000000) ORDER BY SALARY;
-- SELECT * FROM EMPLOYEE WHERE SALARY < 2000000 OR SALARY < 3000000 ORDER BY SALARY;
SELECT * FROM EMPLOYEE WHERE SALARY = ANY(2000000, 3000000) ORDER BY SALARY;
-- SELECT * FROM EMPLOYEE WHERE SALARY = 2000000 OR SALARY = 3000000 ORDER BY SALARY;


-- 대리 직급이지만, 과장 직급 급여들 중 최소 급여보다 많이 받는 사원
SELECT SALARY
  FROM EMPLOYEE
  JOIN JOB USING (JOB_CODE)
 WHERE JOB_NAME = '과장';
 
SELECT *
  FROM EMPLOYEE
  JOIN JOB USING (JOB_CODE)
 WHERE JOB_NAME = '대리'
   AND (SALARY > 2200000 OR SALARY > 2500000 OR SALARY > 3760000);
   
SELECT *
  FROM EMPLOYEE
  JOIN JOB USING (JOB_CODE)
 WHERE JOB_NAME = '대리'
   AND SALARY > ANY (SELECT SALARY
                       FROM EMPLOYEE
                       JOIN JOB USING (JOB_CODE)
                      WHERE JOB_NAME = '과장');
                      
-- ALL
SELECT * FROM EMPLOYEE WHERE SALARY > ALL(2000000, 6000000); -- 결국 600만원보다 큰 급여를 바드는 사원 조회
-- SELECT * FROM EMPLOYEE WHERE SALARY > 200000 AND SALARY > 6000000;
SELECT * FROM EMPLOYEE WHERE SALARY < ALL(2000000, 6000000); -- 결국 200만원보다 작은 급여를 받는 사원 조회
-- SELECT * FROM EMPLOYEE WHERE SALARY < 200000 AND SALARY < 6000000;
--SELECT * FROM EMPLOYEE WHERE SALARY = ALL(2000000, 6000000); -- 200만원이면서 600만원인 경우는 없음


---------------------------------다중열 서브 쿼리-----------------------------------------
/*
    서브쿼리의 결과값이 1행 N열인 경우.
    
    * 비교대상 컬럼 순서와, 서브쿼리 결과 컬럼 순서 동일해야 함!
*/


-- 하이유 사원과 동일한 부서코드, 동일한 직급코드에 해당하는 사원들 조회
SELECT DEPT_CODE, JOB_CODE
  FROM EMPLOYEE
 WHERE EMP_NAME = '하이유';
 
SELECT *
  FROM EMPLOYEE
 WHERE (DEPT_CODE, JOB_CODE) = (SELECT DEPT_CODE, JOB_CODE
          FROM EMPLOYEE
         WHERE EMP_NAME = '하이유');
         
         
         
         
-- 박나리 사원과 동일한 직급코드, 매니저 정보를 가지고 있는 사원정보
SELECT *
  FROM EMPLOYEE
 WHERE (JOB_CODE, MANAGER_ID) IN (SELECT JOB_CODE, MANAGER_ID
                                    FROM EMPLOYEE
                                   WHERE EMP_NAME = '박나라'); 
                                   
----------------------------------다중행 다중열 서브쿼리----------------------------------------
/*
    서브쿼리의 결과값이 N행 N열일 때
*/

-- 각 직급별 최소 급여를 받는 사원 정보 조회

SELECT *
  FROM EMPLOYEE -- 다중행이므로 = 연산 불가.
 WHERE (JOB_CODE, SALARY) = (SELECT JOB_CODE, MIN(SALARY)
                               FROM EMPLOYEE
                              GROUP BY JOB_CODE);
                              
                              
-----------------------상관 서브쿼리----------------------------------
/*
    상호연관 서브쿼리
    - 메인쿼리와 서브쿼리와 서로 연관되어 있는 쿼리.
    - 서브 쿼리 실행 시, 메인 쿼리의 데이터를 가지고 실행하는 구조.
*/


-- 관리자가 있는 사원들의 정보 조회
SELECT *
  FROM EMPLOYEE E
 WHERE EXISTS 
 (SELECT 1 FROM EMPLOYEE M WHERE E.MANAGER_ID = M.EMP_ID);
-- 서브쿼리가 실행될 때, 메인 쿼리의 각 데이터를 참조하고 있음. E.MANAGER_ID = M.EMP_ID
-- SELECT 1이 작성 가능한 이유는, 메인 쿼리가 서브쿼리의 결과 "값"에 따라 처리하는게 아닌 일치하는 행이 존재하는지만 판단하기 때문이다.
-- E.MANAGER_ID 1개당, M.EMP_ID 23개 행과 비교 연산 진행.


-- 부서가 총무부인 사원들의 정보
SELECT *
  FROM EMPLOYEE E
WHERE EXISTS (SELECT 1 FROM DEPARTMENT WHERE DEPT_TITLE = '총무부' AND E.DEPT_CODE = DEPT_ID);

----------------------------------- 스칼라 서브쿼리-------------------------------
/*
    단일값을 반환하는 스칼라 서브쿼리
*/

---------------------------- 서브쿼리의 위치 -------------------------------------

-- 사원번호, 사원명, 매니저 사원번호, 매니저 이름
SELECT EMP_ID, EMP_NAME, MANAGER_ID,
        NVL((SELECT EMP_NAME FROM EMPLOYEE M WHERE E.MANAGER_ID = M.EMP_ID), '관리자없음') AS MANAGER_NAME
  FROM EMPLOYEE E;
  
  
-- 사원들의 정보를 조회. 단, 부서명칭 오름차순 정렬
SELECT *
  FROM EMPLOYEE
 ORDER BY (SELECT DEPT_TITLE 
             FROM DEPARTMENT
             WHERE DEPT_CODE = DEPT_ID);
 
 -- 연봉이 3천만원 이상인 사원
 SELECT *
   FROM EMPLOYEE
   WHERE SALARY * 12 >= 30000000;
 
 -- FROM절에 사용한 서브쿼리 == 인라인 뷰(임시테이블)
 -- 외부 SQL 실행 시 대응시
 SELECT *
   FROM ( SELECT *
          FROM EMPLOYEE
          WHERE SALARY * 12 >= 30000000);
 
 SELECT EMP_NAME,
        CASE WHEN 연봉 >= 30000000 THEN '고급'
             WHEN 연봉 >= 20000000 THEN '중급'
             WHEN 연봉 >= 10000000 THEN '초급'
        END 등급
        -- , EMAIL --  내부 쿼리의 결과에 EMAIL이라는 컬럼이 존재하지 않음.
  FROM (SELECT EMP_NAME,
               SALARY * 12 연봉
          FROM EMPLOYEE);
          
 -- 부서코드가 D9인 사원들 조회
 
 SELECT *
   FROM (
        SELECT * FROM EMPLOYEE WHERE DEPT_CODE = 'D9'
        );
        

        
-- 인라인 뷰(FROM절의 서브쿼리)가 사용되는 부분 : TOP-N 분석
-- TOP-N : 컬럼의 값중에서 가장 큰 값 기준으로 몇개의 데이터만 추출할 때


-- 전 직원 중에 급여가 가장 높은 상위 5명의 사원 정보 조회
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY
  FROM EMPLOYEE
ORDER BY SALARY DESC; -- 각행에 ROWNUM이 붙고나서 급여순으로 재정렬하니 ROWNUM이 꼬인다.

SELECT ROWNUM, E.* 
  FROM
       (
       SELECT EMP_ID, EMP_NAME, SALARY
       FROM EMPLOYEE
       WHERE ROWNUM <= 5
       ORDER BY SALARY DESC
       ) E;
       
SELECT ROWNUM, E.* -- 사용자가 원하는 대로 정렬 작업 이후, ROWNUM을 붙인다
  FROM
       (
       SELECT EMP_ID, EMP_NAME, SALARY
       FROM EMPLOYEE
       ORDER BY SALARY DESC
       ) E
  WHERE ROWNUM <= 5;
  
-- 급여 6위 10위까지 조회
SELECT ROWNUM, E.*
  FROM
       (
       SELECT EMP_ID, EMP_NAME, SALARY
       FROM EMPLOYEE
       ORDER BY SALARY DESC
       ) E
  WHERE ROWNUM >= 6 AND ROWNUM <= 10;
-- 내부(인라인 뷰) SQL 결과를, SELECT 할 때 ROWNUM을 이전 숫자의 하나씩 증가하여 채번한다.
-- 첫번 째 (선동일) 행의 ROWNUM은 1임. 그리고 WHERE 조건식과 비교 ==> 출력 X
-- 두번 째 (송종기) 행의 ROWNUM은 ?? 첫번 째 (선동일)가 조회되지 않았으므로, 두번 째 (송중기) 행의 ROWNUM은 1임
-- 세번 째, 네번 째.... 모두 이전의 행이 조회되지 않았으므로 ROWNUM이 항상 1임. 즉, 항상 WHERE 조건식에 일치하지 않음.
        
 SELECT ROWNUM, E.*
  FROM
       (
       SELECT EMP_ID, EMP_NAME, SALARY
       FROM EMPLOYEE
       ORDER BY SALARY DESC
       ) E
  WHERE ROWNUM >= 6 AND ROWNUM <= 10;       

-- ROWNUM으로 채번한 행 번호를 각 행마다 고정시킨 이후, WHERE를 통해 고정된 값을 비교 
SELECT E.*
  FROM
       (
       SELECT ROWNUM RNUM, E.*
       FROM
            (
             SELECT EMP_ID, EMP_NAME, SALARY
                FROM EMPLOYEE
             ORDER BY SALARY DESC
       ) E
    )E
WHERE RNUM >= 6 AND RNUM <= 10;

-- 각 부서별 평균급여가 높은 3개 부서 조회
SELECT ROWNUM, E.*
  FROM 
        (
        SELECT DEPT_CODE, AVG(SALARY)
        FROM EMPLOYEE
        GROUP BY DEPT_CODE
        ORDER BY 2 DESC
        )E
WHERE ROWNUM <= 3;


-------------------------------------------------------------------
/*
    WINDOW 함수 (순위 매기는 함수)
    
    - RANK() OVER(정렬기준) : 동일한 순위 존재 시, 동일한 순위의 행 갯수만큼 건너뛰고 순위를 계산.
                      EX) 공동 1위가 2명이면 ==> 1 1 3
    - DENSE_RANK() OVER(정렬기준) : 동일한 순위가 있다고 하더라도, 그 다음 순위를 무조건 1씩 증가하여 계산.
                      EX) 공동 1위가 2명이면 ==> 1 1 2
    - SELECT절에서만 사용이 가능한 함수.
*/

-- 급여가 높은 순서대로 순위 조회
SELECT EMP_NAME, SALARY,
       RANK() OVER(ORDER BY SALARY DESC) AS 순위 -- 19위가 2명! 그 다음 순위는 21위
  FROM EMPLOYEE;
  
SELECT EMP_NAME, SALARY,
       DENSE_RANK() OVER(ORDER BY SALARY DESC) AS 순위  -- 19위 가 2명! 그 다음 순위는 20위
  FROM EMPLOYEE;
  
-- 급여 1 ~ 5 순위까지 조회
SELECT *
  FROM
    (
    SELECT EMP_NAME, SALARY,
           RANK() OVER(ORDER BY SALARY DESC) AS 순위
      FROM EMPLOYEE
      -- WHERE RANK() OVER(ORDER BY SALARY DESC) <= 5; -- WHERE절에 WINDOW 함수 불가
      -- WHERE 순위 < = 5; -- WHERE절이 SELECT보다 늦게 수행되므로, 별칭 사용 불가
    )
 WHERE 순위 < = 5; -- 인라인 뷰 사용 시, 내부 데이터를 테이블처럼 사용하므로, 별칭을 WHERE절에 사용 가능.
