/*
        < JOIN >
        
        두 개 이상의 테이블에서 데이터를 조회하고자 할 때 사용.
        조회 결과는 하나의 RESULT SET으로 출력
        
        관계형 데이터베이스에서는, 최소한의 데이터로 각각의 테이블에 데이터를 관리(중복 최소화)
        
        오라클 전용 구문                                           ANSU 표준 구문
        ---------------------------------------------------------------------
        등가조인(EQUAL JOIN)                |        내부 조인(INNER JOIN)
        ---------------------------------------------------------------------
        포괄조인(LEFT, RIGHT)               |    왼쪽 외부 조인(LEFT OUTER JOIN)
                                           | 오른쪽 외부 조인(RIGHT OUTER JOIN)
                                           | 전체 외부 조인 (FULL OUTER JOIN)
        ---------------------------------------------------------------------
        자체 조인(SELF JOIN)                |
        ---------------------------------------------------------------------
*/

-- EMPLOYEE 테이블에서, 사원명, 주민번호, 부서명 조회
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

-- EMPLOYEE 테이블에서, 사원명, 주민번호, 직급명 조회
SELECT * FROM EMPLOYEE;

SELECT * FROM JOB;

/*
    등가 조인(EQUAL JOIN) / 내부 조인(INNER JOIN)
    
    - 두 개의 테이블에서 연결되는 컬럼의 값이 일치하는 행들만 조회.
    - 일치하지 않는 행은 조회에서 제외됨. 
*/

-- 사원들의 사원명, 부서코드 , 부서명 조회

-- 오라클 전용 구문
SELECT EMP_NAME, DEPT_CODE,
       DEPT_ID, DEPT_TITLE
    FROM EMPLOYEE, -- 조회하고자 하는 테이블을 ,로 구분하여 나열한다. 
         department
    WHERE DEPT_CODE = DEPT_ID; -- WHERE절에 테이블간의 매칭(연결)시킬 컬럼에 대한 조건을 제시함
-- 총 21개 결과. 부서코드가 존재하지 않는 사원 정보는 출력되지 않음.
-- EMPLOYEE.DEPT_CODE는 DEPARTMENT.DEPT_ID로 존재해야 함.
-- DEPARTMENT.DEPT_ID는 EMPLOYEE.DEPT_CODE로 존재해야 함.

-- 2) 사원들의 사원명, 직급코드, 직급명 조회
-- 사원명 : EMPLOYEE.EMP_NAME
-- 직급코드 : EMPLOYEE.JOB_CODE, JOB.JOB_CODE
-- 직급명 : JOB.JOB_NAME

-- 오라클 전용 구문
SELECT  EMP_NAME, JOB_CODE, JOB_NAME
  FROM EMPLOYEE,
       JOB
WHERE JOB_CODE = JOB_CODE;
       
-- 오라클 전용 구문 - 조인 컬럼명칭이 같을 때 해결방법1)
SELECT  EMP_NAME, EMPLOYEE.JOB_CODE, JOB_NAME
  FROM EMPLOYEE,
       JOB
WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE; -- 테이블명.컬럼명

-- 오라클 전용 구문 - 조인 컬럼명칭이 같을 때 해결방법1)
SELECT  EMP_NAME, E.JOB_CODE, JOB_NAME
  FROM EMPLOYEE E, --테이블명에 별칭 지정.
       JOB J
WHERE E.JOB_CODE = J.JOB_CODE; -- 별칭 지정


-- ANSI 표준 구문

--1) 사원명, 부서코드, 부서명
-- 조인되는 컬럼 명칭이 다른 경우
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
  
--2) 사원명, 직급코드, 직급명
-- 조인되는 컬럼 명칭이 같은 경우
SELECT EMP_NAME, J.JOB_CODE, JOB_NAME
  FROM EMPLOYEE E
  JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);
  
-- 조인되는 컬럼 명칭이 같은 경우에만 USING 사용 가능
SELECT EMP_NAME, JOB_CODE, JOB_NAME
  FROM EMPLOYEE
  JOIN JOB USING(JOB_CODE); -- 표준 구문에서는 컬럼명 동일한 경우, 문법이 별도로 존재
  
-- 해외영업부서에서 근무하는 사원만 조회하고 싶음.
SELECT EMP_NAME, DEPT_TITLE
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE LIKE '해외영업%';

SELECT EMP_NAME, DEPT_TITLE
  FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
  AND DEPT_TITLE LIKE '해외영업%';
  
  
------------------------ 실습 ------------------------
-- 오라클 전용 구문과 표준 구문 같이 작성
-- 1. 부서가 인사관리부인 사원들의 사번, 이름, 보너스 조회
SELECT EMP_ID, EMP_NAME, BONUS
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE LIKE '인사관리%';

SELECT EMP_ID, EMP_NAME, DEPT_TITLE, BONUS
  FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
  AND DEPT_TITLE = '인사관리부';
-- 2. DEPARTMENT와 LOCATION을 참고해서 전체 부서의 부서코드, 부서명, 지역코드, 지역명 조회
SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID, LOCAL_CODE, LOCAL_NAME
  FROM DEPARTMENT
  JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);
  
SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID, LOCAL_CODE, LOCAL_NAME
  FROM DEPARTMENT, LOCATION
WHERE LOCATION_ID = LOCAL_CODE;
-- 3. 보너스를 받는 사원들의 사번, 사원명, 보너스, 부서명 조회
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE BONUS IS NOT NULL;

SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
  FROM EMPLOYEE, DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID
   AND BONUS IS NOT NULL;
   
-- 4. 부서가 총무부가 아닌 사원들의 사원명, 급여, 부서명 조화
SELECT EMP_NAME, SALARY, DEPT_TITLE
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
 WHERE DEPT_TITLE != '총무부';
 
SELECT EMP_NAME, SALARY, DEPT_TITLE
  FROM EMPLOYEE, DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID
   AND DEPT_TITLE != '총무부';
   
/*
    포괄 조인 / 외부 조인(OUTER JOIN)
    두 테이블간에 JOIN 시, 일치하지 않는 ROW도 포함시켜 조회
    단, 기준이 되는 테이블을 명시해야 함. (LEFT/RIGHT)
*/
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
  FROM DEMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID); -- 등가(EQUAL)조인 시, 일치하는 ROW만 출력 == 21개 ROW
  -- EMPLOYEE에서 부서 배치를 받지 않는(DEPT_CDE가 NULL) 사원 정보는 출력되지 않음
  
  
-- LFFT JOIN
-- 키워드 왼편에 작성한 테이블이 기준이 된다.
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
  FROM EMPLOYEE
  LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
  
-- 오라클 전용 구문
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
  FROM EMPLOYEE, DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID(+);
 
 
 -- RIGHT JOIN
-- 키워드 오른편에 작성한 테이블이 기준이 된다.
SELECT EMP_NAME, DEPT_ID, DEPT_TITLE
  FROM EMPLOYEE
  RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
-- 일치하는 정보 + 부서 정보

SELECT EMP_NAME, DEPT_ID, DEPT_TITLE
  FROM EMPLOYEE, department
 WHERE DEPT_CODE(+) = DEPT_ID;
 
 -- FULL JOIN
 -- 두 테이블에 존재하는 모든 행을 조회하고 싶을 때
 SELECT EMP_NAME, DEPT_TITLE, SALARY
   FROM EMPLOYEE
   FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
ORDER BY 2 NULLS LAST;

-- CROSS JOIN
-- EMPLOYEE ROW COUNT 23 * DEPARTMENT ROW COUNT 9 = 207 ROWS
SELECT EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE, SALARY
  FROM EMPLOYEE
  CROSS JOIN DEPARTMENT
ORDER BY 1,2,3;


/*
    자가 조인 (SELF 조인)
    - 같은 테이블을 조인하는 경우
*/
-- EMPLOYEE에서 사원번호, 사원이름, 매니저ID, 매니저 조회
SELECT E.EMP_ID, E.EMP_NAME, E.MANAGER_ID, M.EMP_NAME
  FROM EMPLOYEE E -- 사원 정보
  JOIN EMPLOYEE M -- 매니저 정보
  ON (M.EMP_ID = E.MANAGER_ID);
  
-- 사원번호, 사원이름, 부서명, 직급명
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
  FROM EMPLOYEE 
  LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
  JOIN JOB USING(JOB_CODE);
  
-- EMPLOYEE와 DEPARTMENT EQUAL 조인 시 결과 ROW COUNT => 21
-- EMPLOYEE와 JOB EQUAL 조인 시 결과 ROW COUNT => 23
-- 다중조인 결과가 21개 ROW COUNT인 이유는, EMPLOYEE와 DEPARTMENT 조인 이후에 JOB 테이블과 조인하기 때문이다.

-- 사원명, 부서명, 부서 지역명 조회
SELECT EMP_NAME, DEPT_TITLE, LOCATION_ID
  FROM EMPLOYEE
  LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID) -- 여기까지 JOIN 시, 23개 ROW
  LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE); -- 2명 사원에 대한 LOCATION_ID NULL이므로, EQUAL 조인하면 다시 21개 ROW
  
/* EMPLOYEE에는 LOCATION 테이블과 조인할 컬럼이 존재하지 않음
    (EMPLOYEE JOIN DEPARTMENT) JOIN LOCATION 순서대로 진행해야 함.
    
LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
*/

----------------------------- 실습 -------------------------------
-- 1. 사원번호, 사원명, 부서명, 지역명, 국가명
-- EMPLOYEE, DEPARTMENT, LOCATION, NATIONAL
SELECT EMP_ID 사원번호, EMP_NAME 사원명, DEPT_TITLE 부서명, LOCAL_NAME 지역명 ,NATIONAL_NAME 국가명
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
  JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
  JOIN NATIONAL USING (NATIONAL_CODE);

-- 2. 사원번호, 사원명, 부서명, 직급명, 지역명, 국가명, 해당 급여등급에서 받을 수 있는 최대 급액
--EMPLOYEE, DEPARTMENT, JOB, LOCATION, NATIONAL, SAL_GRADE
SELECT E.EMP_ID, E.EMP_NAME,
       D.DEPT_TITLE, 
       J.JOB_NAME, 
       L.LOCAL_NAME, 
       N.NATIONAL_NAME,
       S.MAX_SAL
  FROM EMPLOYEE E
  JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
  JOIN JOB J USING(JOB_CODE)
  JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
  JOIN NATIONAL N USING (NATIONAL_CODE)
  JOIN SAL_GRADE S USING (SAL_LEVEL);