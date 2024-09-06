/*
    집합 연산자 (SET OPERATOR)
    
    - 두개 이상의 테이블에서 JOIN을 사용하지 않고 연관 데이터를 조회하는 방법
    - 여러개의 SQL 결과를 하나로 결합하는 방식
    - JOIN과 다르게 ROW를 추가하여 데이터를 표현.
    
    조건)
    1. 각 SELECT의 결과 컬럼수가 동일해야 함.
    2. SELECT절의 동일한 위치에 존재하는 컬럼 데이터가 상호 호환 가능한 형태이어야 함.
    
    - (합집합) UNION         : 각 SQL의 결과 중, 중복된 영역은 제외하고 하나로 합침.
    - (합집합) UNION ALL     : 각 SQL의 결과 중, 중복된 영역은 중복된 만큼 출력(중복 제거 X)
    - (교집합) INTERSECT     : 각 SQL의 결과 중, 동일한 영역만 출력
    - (차집합) MINUS         : 선행 SQL의 결과에서, 후행 SQL의 결과를 제외한 나머지 영역을 출력
    
    
*/


---------------------------UNION---------------------------
-- 부서코드가 D5인 사원 또는 급여가 300만원 이상인 사원들 조회(사번, 이름, 부서코드, 급여)

-- 첫번 째 행 기준으로 오름차순 정렬
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY 
  FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- 결과 행의 갯수 : 6
UNION -- 중복된 행 제거 후, 12개의 결과 출력
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE SALARY >= 3000000; -- 결과 행의 갯수 : 8

---------------------------UNION ALL------------------------------
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY 
  FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- 결과 행의 갯수 : 6
UNION ALL -- 중복제거 하지 않으므로, 첫번 째 SQL 결과 행 + 두번 째 SQL 결과 행
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE SALARY >= 3000000; -- 결과 행의 갯수 : 8

-----------------------------INTERSECT-----------------------------

--부서코드가 D5이면서 급여도 300만원 이상인 사원의 사원번호, 사원명, 부서코드, 급여 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' AND SALARY >= 3000000;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
-- ORDER BY EMP_ID DESC -- 집합 연산자 사용 시, ORDER BY절은 마지막 SQL문에 작성
INTERSECT -- 위 SQL 결과외, 아래 SQL 결과 행중에 겹치는 행만 출력
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE SALARY >= 3000000
ORDER BY EMP_ID DESC;


-------------------------------MINUS-------------------------------
-- 부서코드가 D5인 사원들 중에서 급여가 300만원 이상인 사원들은 제외 후 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- 결과 행 : 6개 => 6개 중, 아래 SQL 결과에 포함되는 행은 제거 후 출력
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE SALARY >= 3000000; -- 결과 행 : 8개


-- 서로 다른 테이블도 컬럼의 갯수와, 위치하고 있는 컬럼간의 데이터 유형이 상호 호환 가능하면
-- 집합연산자 사용 가능
SELECT EMP_ID, EMP_NO, PHONE
  FROM EMPLOYEE
UNION ALL
SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID
  FROM DEPARTMENT;
  
