-- <-한줄 주석
/*
    DML(SELECT) => DQL (데이터 변화 없이, 단순 조회하는 SQL)
    데이터 조회 시, 사용하는 SQL
    
    [표현법]
    
    SELECT 컬럼명1, 컬럼명2, 컬럼명3.... FROM 테이블명;

    파싱 (탐색) 순서 : FROM -> SELECT
    파싱 (탐색) 순서 : FROM -> WHERE -> SELECT
    
    ResultSet : SELECT를 통해 조회된 결과
*/

--EMPLOYEE 테이블에서, 모든 컬럼 조회
SELECT * FROM EMPLOYEE;

-- EMPLOYEE 테이블에서, EMP_NO와 EMP_NAME 조회
SELECT EMP_NO, EMP_NAME FROM EMPLOYEE;

-- EMPLOYEE 테이블에서, 사원이름, 주민번호, 급여 컬럼 조회
SELECT EMP_NAME, EMP_NO, SALARY FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 사원이름, 이메일, 전화번호, 입사일자 조회
SELECT EMP_NAME, EMAIL,PHONE, HIRE_DATE FROM EMPLOYEE;

-- EMPLOYEE 테이블에 존재하지 않는 컬럼 조회 시, 오류 발생
--SELECT EMP_PW FROM EMPLOYEE;

-----------------------실습------------------------

-- 1. JOB 테이블에서 직급명만 조회
SELECT JOB_NAME FROM JOB;

-- 2. DEPARTMENT 테이블에서 모든 컬럼 조회
SELECT * FROM DEPARTMENT; 

-- 3. DEPARTMENT 테이블에서 부서코드, 부서명만 조회
SELECT DEPT_ID, DEPT_TITLE FROM DEPARTMENT;

-- 4. EMPLOYEE 테이블의 사원명, 이메일, 전화번호, 급여, 직급코드 조회
SELECT EMP_NAME, EMAIL, PHONE, SALARY, JOB_CODE FROM EMPLOYEE;

-- 5. EMPLOYEE 테이블의 사번, 사원명, 보너스 조회
SELECT EMP_ID, EMP_NAME, BONUS FROM EMPLOYEE;


/*
    컬럼 값을 통한 산술 연산
    
    SELECT절에 컬럼명 작성 부분에, 산술연산 작성 가능(산술연산식이 컬럼명칭으로 출력됨)
    
    
*/

-- 각 사원의 사원명과 월급 조회
SELECT EMP_NAME, SALARY FROM EMPLOYEE;

-- 각 사원의 사원명과 연봉 조회
SELECT EMP_NAME, SALARY * 12 FROM EMPLOYEE;

-- 각 사원의 사원명과 월급, 보너스 조회
SELECT EMP_NAME, SALARY, BONUS FROM EMPLOYEE;

-- 각 사원의 사원명, 급여, 보너스, 연봉, 보너스가 포함된 연봉
SELECT EMP_NAME, SALARY, BONUS, SALARY*12, (SALARY * BONUS + SALARY)* 12 FROM EMPLOYEE;

-- 각 사원의 사원명, 입사일자 조회
SELECT EMP_NAME, HIRE_DATE FROM EMPLOYEE;

-- 각 사원의 사원명, 오늘까지의 근무일자 조회 == 오늘 날짜 - 입사 일자
SELECT EMP_NAME, SYSDATE - HIRE_DATE FROM EMPLOYEE;


----------------------실습문제-----------------------
-- 1. 4대 보험료를 공제한 월 급여액을 출력하시오. 월 공제액은 급여의 23%
SELECT EMP_NAME, SALARY-SALARY*0.23 FROM EMPLOYEE;
-- 2. 1개월이 30일이라고 가정하고 월 급여, 일급여, 일 보너스 금액을 출력하시오. (단, 급여액은 보너스 포함 금액)
SELECT EMP_NAME, SALARY + SALARY * BONUS, (SALARY + SALARY * BONUS)/30, BONUS FROM EMPLOYEE;
-- 3. 1개월이 30일이라고 가정하고 현재까지 근무한 개월수를 출력하시오. (소수점 형태로 출력)
SELECT EMP_NAME, (SYSDATE - HIRE_DATE) / 30 FROM EMPLOYEE;

/*
    조회된 컬럼명에 별칭을 지정할 수 있음.
    EX) 산술연산을 통해 조회된 컬럼명이 지저분함. 컬럼명만 보고 데이터의 의미를 바로 해석할 수 없음.
    
    [표현법]
    AS : Alias
    
    컬럼명 별칭  / 컬럼명 AS 별칭 / 컬럼 명 "별칭" / 컬럼명 AS "별칭"
    
    단, 별칭에 특수문자나 띄어쓰기 포함 시, ""(쌍따옴표)로 지정해야 함.
    
*/

SELECT EMP_ID 사원번호, EMP_ID AS 사원번호, EMP_ID "사원번호", EMP_ID AS "사원번호" FROM EMPLOYEE; 

/*
-- 별칭에 특수 문자나 띄어쓰기 포함 시 ""(쌍따옴표)로 지정해야함
SELECT EMP_ID AS 사원 번호 FROM EMPLOTEE; 
*/
-- 1. 4대 보험료를 공제한 월 급여액을 출력하시오. 월 공제액은 급여의 23%
SELECT EMP_NAME 이름, SALARY-SALARY*0.23 "공제한 월급" FROM EMPLOYEE;
-- 2. 1개월이 30일이라고 가정하고 월 급여, 일급여, 일 보너스 금액을 출력하시오. (단, 급여액은 보너스 포함 금액)
SELECT EMP_NAME 이름 , SALARY + SALARY * BONUS "보너스 포함 월 급여액", (SALARY + SALARY * BONUS)/30 AS "보너스 포함 일 급여액", BONUS 보너스 FROM EMPLOYEE;
-- 3. 1개월이 30일이라고 가정하고 현재까지 근무한 개월수를 출력하시오. (소수점 형태로 출력)
SELECT EMP_NAME "사원 이름", (SYSDATE - HIRE_DATE) / 30 "근무 개월수"FROM EMPLOYEE;


--------------------------------실습문제--------------------------------------------

-- 1. EMPLOYEE 테이블의 모든 컬럼 조회, 단 모든 컬럼에 대해서 적절한 별칭을 지정하시오
SELECT EMP_ID "사원 번호", EMP_NAME"이름", EMP_NO"주민번호", EMAIL 이메일, PHONE "전화번호", DEPT_CODE" 부서코드"
, JOB_CODE 직급코드, SAL_LEVEL "급여 레벨", SALARY "월 급여", BONUS 보너스율, MANAGER_ID"매니저ID", HIRE_DATE 입사날짜, ENT_DATE "등록일자", ENT_YN 등록여부 FROM EMPLOYEE;
-- 2. SAL_GRADE 테이블의 모든 정보를 아래와 같이 별칭을 작성하여 출력하시오.
-- 급여 레벨, 최소 급여, 최대 급여
SELECT SAL_LEVEL "급여 레벨", MIN_SAL "최소 급여", MAX_SAL "최대 급여" FROM SAL_GRADE;

/*
    리터럴 : 임의로 지정한 문자열('')
    
    SELECT절에 리터럴을 제시하면, 마치 테이블상에 존재하는 데이터처럼 조회가 가능.
    조회된 RESULT SET의 모든 행에 반복적으로 출력된다.
*/
SELECT EMP_NAME, SALARY, '안녕' AS 인사 FROM EMPLOYEE;

SELECT EMP_NAME, SALARY, '원' AS 단위 FROM EMPLOYEE;

-- 리터럴 값은 외따옴표로 지정할 것.
-- SELECT EMP_NAME, SALARY, "원" AS 단위 FROM EMPLOYEE;

SELECT EMP_NAME, SALARY, BONUS, '%' AS 보너스율 FROM EMPLOYEE;

/*
    연결 연산자 : ||
    
    여러 값들을 하나의 컬럼처럼 연결(결합)하거나, 컬럼값과 리터럴을 연결할 수 있음.
    PS. Java에서 String 결합 연산과 유사
*/
SELECT EMP_NAME, SALARY || '원' AS "급여정보" FROM EMPLOYEE;

SELECT EMP_NAME, SALARY || '원' AS "급여정보", BONUS || '%' AS 보너스율 FROM EMPLOYEE;

SELECT EMP_NAME, 'TEL : ' || PHONE AS "전화번호" FROM EMPLOYEE;


-----------------------------실습문제-----------------------------------

-- 1. XXX의 월급은 XXX원 입니다. => 컬럼명 : 급여 정보 
SELECT EMP_NAME || '의 월급은'|| SALARY || '원 입니다.' AS "급여 정보" FROM EMPLOYEE; 
-- 2. 고용일에 '일' 단위를 붙여 출력 => 컬럼명 : 입사일
SELECT HIRE_DATE || '일' AS "입사일" FROM EMPLOYEE;
-- 3. 모든 사원에 대해, 사원이름, 월 급여(보너스 포함)과, 근무일자를 구하시오
SELECT EMP_NAME AS "사원이름", SALARY + SALARY * SALARY || '원' AS "월 급여(보너스 포함)", SYSDATE - HIRE_DATE AS "근무일자" FROM EMPLOYEE; 
-- 4. 모든 사원에 대해, XXX님의 월급은 XXXX원 이며, 매니저 사원번호는 XXX입니다. 와 같이 출력 컬럼명 => 사원 정보
SELECT EMP_NAME || '님의 월급은 ' || SALARY || '원 이며, 매니저 사원번호는 ' || MANAGER_ID || '입니다.' AS "사원 정보" FROM EMPLOYEE;

/*
    DISTINCT : 컬럼에 중복된 값들은 한번씩만 출력하고자 할 때 사용.
*/

SELECT JOB_CODE FROM EMPLOYEE;

SELECT DISTINCT JOB_CODE FROM EMPLOYEE;

SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;

-- SELECT절에 한번만 작성 가능하므로, 오류 발생
-- SELECT DISTINCT DEPT_CODE, DISTINCT JOB_CODE FROM EMPLOYEE;

-- DEPT_CODE와 JOB_CODE를 한 쌍으로 묶어서 중복을 판별하고, 중복값은 1번만 출력한다.
SELECT DISTINCT DEPT_CODE || JOB_CODE FROM EMPLOYEE;

/*
    WHERE
        - 조회하고자 하는 테이블로부터, 특정 조건에 만족하는 행(ROW)만을 조회하고자 할 때 사용.
        - WHERE절에 원하는 행(ROW)에 대한 조건식을 작성한다.
  
        
*/

-- EMPLOYEE 테이블에서 DEPT_CODE가 D9인 사원의 모든 컬럼 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE = 'D9';

-- EMPLOYEE 테이블에서 JOB_CODE가 J5인 사원의 사원명, 주민번호, 전화번호 조회
SELECT EMP_NAME, EMP_NO, PHONE FROM EMPLOYEE WHERE JOB_CODE = 'J5';

-- EMPLOYEE 테이블에서 DEPT_CODE가 D1이 아닌 사원의 사번, 사원명, 부서코드 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE != 'D1';
SELECT EMP_ID, EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE <> 'D1';
SELECT EMP_ID, EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE ^= 'D1';

-- EMPLOYEE 테이블에서 재직중인 사원의 정보 출력
SELECT * FROM EMPLOYEE WHERE ENT_YN = 'Y';

-- EMPLOYEE 테이블에서 급여가 400만원 이상인 사원들의 사원명, 급여정보 출력
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY >= 4000000;

-- EMPLOYEE 테이블에서 급여가 300만원 이상이고, 부서코드가 D6인 사원 조회
SELECT * FROM EMPLOYEE WHERE SALARY >= 3000000 AND DEPT_CODE = 'D6';

-- EMPLOYEE 테이블에서 직급 코드가 J2이거나, J6인 사원 조회
SELECT * FROM EMPLOYEE WHERE JOB_CODE = 'J2' OR JOB_CODE = 'J6';

-- EMPLOYEE 테이블에서 급여가 300만원 이상인 사원 조회(보너스 포함)
SELECT EMP_NAME, SALARY + SALARY * BONUS FROM EMPLOYEE WHERE SALARY + SALARY * BONUS >= 3000000;

-- EMPLOYEE 테이블에서 근무일자가 10,000일 이상인 사원 조회
SELECT EMP_NAME, SYSDATE - HIRE_DATE AS "근무일자" FROM EMPLOYEE WHERE SYSDATE-HIRE_DATE >= 10000;

----------------------------- 실습 문제 ---------------------------------

-- 1. 급여가 300만원 이상인 사원들의 사원명, 급여, 입사일, 연봉(보너스미포함) 조회
SELECT EMP_NAME 사원명, SALARY 급여, HIRE_DATE 입사일, SALARY*12 AS "연봉(보너스미포함)" FROM EMPLOYEE WHERE SALARY >= 3000000;
-- 2. 연봉이 5000만원 이상인 사원들의 사원명, 급여, 연봉, 부서코드 조회(보너스 미포함)
SELECT EMP_NAME 사원명, SALARY 급여, SALARY*12 AS 연봉, DEPT_CODE 부서코드 FROM EMPLOYEE WHERE SALARY*12 >= 50000000;
-- 3. 직급코드가 'J3'이 아닌 사원들의 사원번호, 사원명, 직급코드, 퇴사여부(ENT_YN) 조회
SELECT EMP_ID 사원번호, EMP_NAME 사원명, JOB_CODE 직급코드, ENT_YN 퇴사여부 FROM EMPLOYEE WHERE JOB_CODE != 'J3';
-- 4. 부서코드가 D9이면서 급여가 500만원 이상인 사원들의 사원번호, 사원명, 급여, 부서코드 조회
SELECT EMP_ID 사원번호, EMP_NAME 사원명, SALARY 급여, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = 'D9' AND SALARY >= 5000000;
-- 5. 부서코드가 D6이거나 급여가 300만원 이상인 사원들의 사원명, 부서코드, 급여 조회
SELECT EMP_NAME 사원명, DEPT_CODE 부서코드, SALARY "급여조회" FROM EMPLOYEE WHERE DEPT_CODE = 'D6' OR SALARY >= 3000000;
-- 6. 급여가 350만원 이상, 600만원 이하를 받는 사원들의 사원번호, 사원명, 급여 조회
SELECT EMP_ID 사원번호, EMP_NAME 사원명, SALARY "급여 조회" FROM EMPLOYEE WHERE SALARY >= 3500000 AND SALARY <= 6000000;
-- 7. 직급코드가 J6이거나 J5고, 급여가 300만원 이상인 사원들의 사원명, 직급코드, 급여 조회
SELECT EMP_NAME 사원명, JOB_CODE 직급코드, SALARY "급여 조회" FROM EMPLOYEE WHERE (JOB_CODE = 'J6' OR JOB_CODE = 'J5') AND SALARY >= 3000000;
-- 8. 직급코드가 J6이거나 J5고, 급여가 300만원 이상이며 근무일자가 1000일 이상인 사원들의 사원명, 직급코드, 급여, 근무일자
SELECT EMP_NAME 사원명, JOB_CODE 직급코드, SALARY "급여 조회", SYSDATE-HIRE_DATE 근무일자 FROM EMPLOYEE WHERE (JOB_CODE = 'J6' OR JOB_CODE = 'J5')AND SALARY >= 3000000 AND SYSDATE-HIRE_DATE >= 1000;


/*
    BETWEEN : 조건식에서 사용되는 구문
        - 특정 범위의 데이터를 조회하고 싶을 때 사용.
    [표현법]
    BETWEEN 값1 AND 값 2 -> 값 1 이상 - 값2 이하
*/

-- 급여가 300이상이고, 500만원 이하인 사원의 정보 출력
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 3000000 AND 5000000;

-- 급여가 300만원 ~ 500만원에 포함되지 않는 사원의 정보 출력
SELECT * FROM EMPLOYEE WHERE SALARY NOT BETWEEN 3000000 AND 5000000;
SELECT * FROM EMPLOYEE WHERE SALARY NOT BETWEEN 3000000 AND 5000000;
-- NOT : 논리부정연산자

-- 입사일이 90년 1월 1일 ~ 01년 1월 1일인 사원 조회
SELECT * FROM EMPLOYEE WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';

-------------------실습문제---------------------
--보너스 포함 월 급여가 350만원 이상, 600만원 이하인 사원의 사원번호, 사원명, 부서코드, 보너스 포함 월 급여 조회
SELECT EMP_ID 사원번호, EMP_NAME 사원명, DEPT_CODE 부서코드, SALARY + SALARY * BONUS "보너스 포함 월 급여" FROM EMPLOYEE WHERE SALARY + SALARY * BONUS BETWEEN 3500000 AND 6000000;


/*
    LIKE : 비교하고자 하는 컬럼의 값이 내가 제시한 특징 패턴에 만족하는 경우 사용
    
    [표현법]
    비교대상컬럼 LIKE '특징패턴'
    
    - '특징패턴'
        '_'나 '%'(와일드 카드)를 작성하여 패턴을 제시.
        
    - '_' => 글자수까지 제한
    EX) 비교대상컬럼 LIKE '_문자'       => 비교대상의 컬럼값의 문자 앞에 무조건 한글자가 올 경우 조회
        비교대상컬럼 LIKE '__문자'      => 비교대상의 컬럼값의 문자 앞에 무조건 두글자가 올 경우 조회
        비교대상컬럼 LIKE '_문자_'      => 비교대상의 컬럼값의 문자 앞과 뒤에 무조건 한글자가 올 경우 조회
    - '%' =>
    EX) 비교대상컬럼 LIKE '%문자'       => 비교대상의 컬럼값이 "문자"로 끝날 경우 조회
        비교대상컬럼 LIKE '문자%'       => 비교대상의 컬럼값이 "문자"로 시작할 경우 조회
        비교대상컬럼 LIKE '%문자%'      => 비교대상의 컬럼값에 "문자"가 포함된 경우 조회

*/
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '전__'; -- EMP_NAME이 '전'으로 시작하고, 3글자인 사원 조회
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '전___'; -- EMP_NAME이 '전'으로 시작하고, 4글자인 사원 조화
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '전형_'; -- EMP_NAME이 '전형'으로 시작하고, 3글자인 사원 조회
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '__연'; -- EMP_NAME이 '연'으로 끝나고, 3글자인 사원 조회
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '_동_'; -- EMP_NAME이 중간 글자가 '동'고, 3글자인 사원 조회


SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '전%'; -- EMP_NAME이 '전'으로 시작하는 사원 글자 수 상관없으.
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '%철'; -- EMP_NAME이 '철'로 끝나는 사원, 글자 수 상관 없음
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '%하%'; -- EMP_NAME에 '하' 글자가 포함된 사원 조회

--PHONE 컬럼의 값의 3번째 글자가 1인 상원의 정보 출력
SELECT * FROM EMPLOYEE WHERE PHONE LIKE '__1%';

-- 이메일의 _기준으로 앞 글자가 3글자인 사원조회
SELECT * FROM EMPLOYEE WHERE EMAIL LIKE '____%'; -- 모든 이메일 형식이 조회됨.
SELECT * FROM EMPLOYEE WHERE EMAIL LIKE '___$_%' ESCAPE '$'; -- ESCAPE로 설정한 특수문자 뒤에 오는 문자를 문자를 와일드카드가 아닌 문자로 인식시킴
SELECT * FROM EMPLOYEE WHERE EMAIL NOT LIKE '___$_%' ESCAPE '$';




-----------------------------실습문제-------------------------------

--1. EMPLOYEE에서 이름이 '연'으로 끝나는 사원들의 사원명, 입사일 조회
SELECT EMP_NAME 사원명, HIRE_DATE FROM EMPLOYEE WHERE EMP_NAME LIKE '%연';
--2. EMPLOYEE에서 전화번호 처음 3자리가 '010'이 아닌 사원들의 사원명, 전화번호 조회
SELECT EMP_NAME 사원명, PHONE 전화번호 FROM EMPLOYEE WHERE PHONE NOT LIKE '010%' ;
--3. EMPLOYEE에서 이름에 '하'가 포함되어 있고, 급여가 240만원~500만원인 사람들의 사원명, 급여 조회
SELECT EMP_NAME 사원명, SALARY "급여" FROM EMPLOYEE WHERE EMP_NAME LIKE '%하%' AND SALARY BETWEEN 2400000 AND 5000000;
--4. DEPARTMENT에서 해외영업부인 부서들의 부서코드, 부서명 조회
SELECT DEPT_ID 부서코드, DEPT_TITLE 부서명 FROM DEPARTMENT WHERE DEPT_TITLE LIKE '해외영업%';  
--5. EMPLOYEE에서 메일 주소에 'S'가 포함되고, DEPT_CODE가 D9또는 D6이고,
    --고용일이 90/01/01 ~ 00/12/01이면서, 월급이 270만원 이상인 사원의 정보 조회
SELECT * FROM EMPLOYEE WHERE EMAIL LIKE '%s%' AND (DEPT_CODE = 'D9' OR DEPT_CODE = 'D6') AND
              HIRE_DATE BETWEEN '90/01/01' AND '00/12/01' AND SALARY >= 2700000;
/*
    연산자의 우선 순위
    1. ()
    2. 산술 연산
    3. 연결 연산
    4. 비교 연산
    5. IS NULL/LIKE '패턴' / IN
    6. BETWEEN AND
    7. NOT(논리부정연산자)
    8. AND
    9. OR
*/

--------------------------------------------------------------------------------------------------------------------------
-- 모든 사원에 대해, 급여 정보와 보너스율, 보너스 포함 급여 조회
SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * BONUS "보너스 포함 급여" FROM EMPLOYEE;

-- BONUS 컬럼은 NUMBER(숫자) 타입인데 문자열과 비교하여 오류 발생
SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * BONUS "보너스 포함 급여" FROM EMPLOYEE
WHERE BONUS != 'NULL';

SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * BONUS "보너스 포함 급여" FROM EMPLOYEE
WHERE BONUS != 0;

SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * BONUS "보너스 포함 급여" FROM EMPLOYEE
WHERE NONUS = 0; -- NULL인 행을 출력하고자 작성하였지만, 출력되지 않음.

/*
    IS NULL / IS NOT NULL
    
    - 컬럼의 값에 (NULL)이 있을 경우, NULL 값 비교에 사용되는 연산자
    - NULL : 값이 없음을 의미. 산술연산이나 비교연산 불가
        * NULL은 문자열이나, 0을 의미하지 않음!
*/

-- 보너스를 받지 않는 상원의 사원번호, 사원명, 급여, 보너스 조회
SELECT EMP_ID, EMP_NAME, SALARY, BONUS FROM EMPLOYEE WHERE BONUS IS NULL;

-- 보너스를 받는 사원의 사원번호, 사원명, 급여, 보너스 조회
SELECT EMP_ID, EMP_NAME, SALARY, BONUS FROM EMPLOYEE WHERE BONUS IS NOT NULL;

-- 매니저가 없는 사원의 사원 정보 조회
SELECT * FROM EMPLOYEE WHERE MANAGER_ID IS NULL;

-- 부서배치는 아직 받지 않았지만 보너스를 받는 사원 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL; 


/*
    IN : 비교대상 컬럼값이 제시한 목록중에 일치하는 값이 존재하는지
    
    [표현법]
    비교대상컬럼 IN (값1, 값2, 값3....)

*/
-- 부서코드가 D6이거나, D8이거나, D5인 사원의 사원번호, 사원명, 부서코드 조회
SELECT EMP_ID 사원번호, EMP_NAME 사원명, DEPT_CODE 부서코드 FROM EMPLOYEE WHERE DEPT_CODE IN ('D6','D8','D5');

-- 월급이 200만원이거나, 340만원인 사원
SELECT * FROM EMPLOYEE WHERE SALARY = 2000000 OR SALARY = 3400000;
SELECT * FROM EMPLOYEE WHERE SALARY IN  (2000000,3400000);

-----------------------실습문제---------------------------------

-- 1. 사수가 있지만, 부서배치는 받지 않은 사원들의 사원명, 사수 사원번호, 부서코드 조회
SELECT EMP_NAME 사원명, MANAGER_ID "사수 사원번호", DEPT_CODE 부서코드 FROM EMPLOYEE WHERE MANAGER_ID IS NOT NULL AND DEPT_CODE IS NULL;
-- 2. 연봉(보너스 미포함)이 3000만원 이상이고, 보너스를 받지 않는 사원들의 사원번호, 사원명, 급여, 보너스 조회
SELECT EMP_ID 사원번호 ,EMP_NAME 사원명, SALARY 급여, BONUS 보너스 FROM EMPLOYEE WHERE SALARY*12 >= 30000000 AND BONUS IS NULL; 
-- 3. 입사일이 '95/01/01' 이후이고, 부서배치를 받은 사원의 사원번호, 사원명, 입사일, 부서코드 조회
SELECT EMP_ID 사원번호 ,EMP_NAME 사원명, DEPT_CODE 부서코드 FROM EMPLOYEE WHERE HIRE_DATE > '95/01/01' AND DEPT_CODE IS NOT NULL;
-- 4. 급여가 200만원 이상, 500만원 이하이고, 입사일이 '01/01/01' 이후이면서 보너스를 받지 않는 사원들의 정보 조회
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 2000000 AND 5000000 AND HIRE_DATE > '01/01/01' AND BONUS IS NULL;
-- 5. 보너스 포함 연봉이 NULL이 아니고, 이름에 '하'가 포함되어 있는 사원들의 사원번호, 사원명, 급여, 보너스 포함 연봉 조회
SELECT EMP_ID 사원번호 ,EMP_NAME 사원명, SALARY 급여, (SALARY + SALARY * BONUS)*12 "보너스포함 연봉" FROM EMPLOYEE WHERE BONUS IS NOT NULL AND
EMP_NAME LIKE '%하%';

/*
    ORDER BY : 데이터를 정렬하기 위해 작성하는 키워드
    
    [표현법]
    ORDER BY 정렬하고 싶은 컬럼명 | 조회결과 순서 | 산술연산식 | 별칭 [ ASC (기본값)| DESC ]
    
    ASC : 오름차순 정렬(작은수 -> 큰수 / 사전순서 / 빠른날 -> 늦은날 / NULL은 제일 아래로) [생략 시 기본 값]
    DESC : 내림차순 정렬(큰수 -> 작은수 / 사전역순 / 늦은날 -> 빠른날 / NULL은 제일 위로)
    
    NULLS FIRST : 정렬하고자 하는 컬럼의 값에 NULL이 포함된 경우 NULL을 가장 먼저 출력
    NULLS LAST : 정렬하고자 하는 컬럼의 값에 NULL이 포함된 경우 NULL을 가장 마지막에 출력
    
    
*/
SELECT * FROM EMPLOYEE ORDER BY SALARY; -- 작은수 -> 큰수
SELECT * FROM EMPLOYEE ORDER BY SALARY DESC; --큰수 -> 작은수
SELECT * FROM EMPLOYEE WHERE SALARY >= 2000000 ORDER BY SALARY;

SELECT * FROM EMPLOYEE WHERE SALARY >= 2000000 ORDER BY EMP_NAME; -- 사전순서
SELECT * FROM EMPLOYEE WHERE SALARY >= 2000000 ORDER BY EMP_NAME DESC; -- 사전 역순

SELECT * FROM EMPLOYEE ORDER BY HIRE_DATE;          --빠른날 -> 늦은날
SELECT * FROM EMPLOYEE ORDER BY HIRE_DATE DESC;     --늦은날 -> 빠른날

SELECT * FROM EMPLOYEE ORDER BY BONUS;  --오름차순일 때, NULL은 가장 마지막(LAST)에 출력된다.
SELECT * FROM EMPLOYEE ORDER BY BONUS NULLS FIRST;  -- BONUS 기준 오름차순 정렬. 단, NULL을 가장 위로

SELECT * FROM EMPLOYEE ORDER BY BONUS DESC; -- 내림차순일 때, NULL은 가장 처음(FIRST)에 출력된다.
SELECT * FROM EMPLOYEE ORDER BY BONUS DESC NULLS LAST; -- BONUS 기준 내림차순 정렬. 단, NULL은 가장 밑으로

SELECT * FROM EMPLOYEE ORDER BY SALARY, EMP_NAME;
SELECT * FROM EMPLOYEE ORDER BY SALARY, EMP_NAME DESC; --급여 오름차순 정렬 후, 동일 급여를 가진 사원에 대해 이름 역순으로 정렬

SELECT * FROM EMPLOYEE ORDER BY 1 DESC;

-- 조회된 결과의 3번째 컬럼 역순으로 정렬
SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE ORDER BY 3 DESC;

--조회된 결과에 대해 정렬하므로, ORDER BY 이후 별칭 작성 가능.
SELECT EMP_ID "사원번호", EMP_NAME "사원명", SALARY "급여" FROM EMPLOYEE ORDER BY 급여;

--ORDER BY 절에, 컬럼명 또는 컬럼순서뿐만 아니라 산술연산식도 가능.
SELECT EMP_ID, EMP_NAME, SALARY*12 FROM EMPLOYEE ORDER BY SALARY*12;

