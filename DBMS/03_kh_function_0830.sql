/*
  함수(FUNCTION)
  - 자바에서 처럼 하나의 기능을 담당하는 것
  - 전달된 컬럼값들에 의한 결과값을 반환
  
  * 함수의 종류
  - 단일행 함수 : N개의 값을 전달받고, N개의 결과값을 반환(모든 행에 반복적으로 실행)
  - 그룹 함수 : N개의 값을 전달받고, 1개의 결과값을 반환(그룹을 지어 그룹별로 실행 결과를 반환)
*/
/*

    < 문자 처리 함수 >
    
    -LENCTH /LENGTHB
    
    LENGTH(컬럼 | '문자열') : 해당 문자열의 글자 수 반환
    LENGTHB(컬럼 | '문자열') : 해당 문자열의 바이트 수 반환
    
*/

SELECT SYSDATE FROM DUAL;
SELECT 'A' FROM DUAL;
SELECT 84398493 FROM DUAL;

SELECT 'ABCDE', LENGTH('ABCDE') FROM DUAL;
SELECT 'ABCDE', LENGTHB('ABCDE') FROM DUAL;
SELECT '&*^%!%&@', LENGTH('&*^%!%&@') FROM DUAL;
SELECT '&*^%!%&@', LENGTHB('&*^%!%&@') FROM DUAL;

SELECT '오라클', LENGTH('오라클') FROM DUAL;
SELECT '오라클', LENGTHB('오라클') FROM DUAL;

SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME), EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL),
BONUS, LENGTH(BONUS), LENGTHB(BONUS)
FROM EMPLOYEE WHERE SALARY>2000000;

/*
    - INSTR : 문자열로부터 특정 문자의 위치를 찾아서 반환.
    
    []는 선택 사항.
    
    INSTR(컬럼 | '문자열', '찾고자 하는 문자', ['찾을위치의 시작값'], [순번])
    
    찾을 위치의 시작 값
    1 : 앞에서부터 탐색
    -1 : 뒤에서부터 탐색
*/

SELECT ('AABAACAABBAA') FROM DUAL;

-- 첫번 째, 전달값에서 두번째 전달값의 위치를 탐색, 반환 결과는 1부터
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL;

-- B 문자를 탐색하는데, 시작 인덱스의 값이 4.
-- 탐색 결과는 제일 첫번째 인덱스부터 카운팅
SELECT INSTR('AABAACAABBAA', 'B', 4) FROM DUAL;

-- B 문자 탐색하는데 뒤의 첫번째부터 탐색
-- 탐색 결과는 제일 첫번째 인덱스부터 카운팅
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL;

-- 탐색 결과는 제일 첫번째 인덱스부터 카운팅
-- 두번째 'B'를 탐색.
-- 탐색 결과는 제일 첫번째 인덱스부터 카운팅
SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL;

-- 탐색 결과는 제일 첫번째 인덱스부터 카운팅
-- 두번째 'B'를 탐색.
-- 탐색 결과는 제일 첫번째 인덱스부터 카운팅
SELECT INSTR('AABAACAABBAA', 'B', -1, 3) FROM DUAL;

-- EMPLOYEE 테이블에서, EMAIL의 _ 위치와, @ 위치 조회
SELECT EMAIL, INSTR(EMAIL , '_', 1, 1), INSTR(EMAIL, '@') FROM EMPLOYEE;

/*
    SUBSTR : 문자열에서 특정 문자열을 추출해서 반환(JAVA의 substring과 유사)
    
    SUBSTR(STRING, POSITION, [LENGTH])
    - STRING : 문자타입컬럼 또는 문자열
    - POSITION : 문자열을 추출할 시작 위치 값.
    - LENGTH : 추출할 문자의 갯수 (생략 가능, 생략 시, 끝까지)
    
*/

SELECT 'SHOWMETHEMONEY' FROM DUAL;

-- 'SHOWMETHEMONEY'의 7번째부터 끝까지(마지막 전달 값 생략 시)
SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;

-- 'SHOWMETHEMONEY'의 5번째부터 2글자까지 
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;

-- 'SHOWMETHEMONEY'의 1번째부터 6글자까지
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;

-- 'SHOWMETHEMONEY'의 1번째부터 6글자까지
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) AS "성별" FROM EMPLOYEE;

-- 여성 사원만 출력
SELECT EMP_NAME, EMP_NO FROM EMPLOYEE WHERE SUBSTR(EMP_NO, 9,1) IN ('2', '4');

--남성 사원
SELECT EMP_NAME, EMP_NO FROM EMPLOYEE WHERE SUBSTR(EMP_NO, 9,1) IN ('1', '3');

-- 이메일의 ID 값 조회. @ 이전의 값 == ID
SELECT EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) AS "ID값" FROM EMPLOYEE;

/*
    LPAD / RPAD
    - 문자열 조회 시, 길이의 통일감을 갖게 하기 위해 사용.
    
    LPAD/RPAD (대상 문자열, 최종 반환 문자열의 길이, [길이 부족 ㅣㅅ 출력할 문자])    
*/
-- 각 행마다 길이가 다른 이메일 조회 시, 20글자로 맞춤, 길이 부족 시 왼쪽에 부족한 길이만큼 # 출력 
SELECT EMAIL, LPAD(EMAIL, 20, '#') LPAD_EMAIL FROM EMPLOYEE;

-- 각 행마다 길이가 다른 이메일 조회 시, 20글자로 맞춤, 길이 부족 시 왼쪽에 부족한 길이만큼 # 출력 
SELECT EMAIL, RPAD(EMAIL, 20, '#') RPAD_EMAIL FROM EMPLOYEE;

-- 3번째 전달값 미 작성 시, 공백으로 처리 됨.
SELECT EMAIL, LPAD(EMAIL, 20) LPAD_EMAIL FROM EMPLOYEE;

-- 전달한 문자열의 길이보다, 지정된 길이가 더 작을 경우, 나머지 부분을 자름
SELECT EMAIL, LPAD(EMAIL, 5, '#') LPAD_MEAIL FROM EMPLOYEE;


SELECT RPAD('631156-1', 14, '*') FROM DUAL;

SELECT EMP_NO, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*') EMP_NO_2 FROM EMPLOYEE;

/*
    LTRIM / RTRIM
    - 문자열에 특정 문자를 제거한 나머지 문자열을 반환
    
    LTRIM / RTRIM (STRING, ['제거할문자들']) => 생략 시 공백을 제거
*/

SELECT '    K   H   ' FROM DUAL;

-- 왼쪽에서 순차적으로 공백을 제거. 공백이 아닌 문자 탐색 시 멈춤.
SELECT LTRIM('    K   H   ') FROM DUAL;
-- 오른쪽에서 순차적으로 공백을 제거. 공백이 아닌 문자 탐색 시 멈춤.
SELECT RTRIM('    K   H   ') FROM DUAL;

SELECT LTRIM('0001230000543252', '0') FROM DUAL;
SELECT RTRIM('0001230000543252', '0') FROM DUAL;

-- 순차적으로 탐색하는 문자가, 두번째 전달값에 포함되면 제거.
SELECT LTRIM('123321456', '123') FROM DUAL;
SELECT LTRIM('123123KH123123', '123') FROM DUAL;

/*
    TRIM
    - 문자열의 앞/뒤/양쪽에 있는 지정한 문자들을 제거한 나머지 문자열을 변환
    
    TRIM(([ LEADING | TRALLING | BOTH ] 제거하고자하는 문자들 FROM) STRING)
    
    LEADING : 왼쪽부터 (LTRIM과 유사)
    TRALLING : 오른쪽부터 (RTRIM과 유사)
    BOTH : 양쪽에서부터 (생략 시, 기본값)
*/

-- 기본값이 BOTH이므로, 양쪽에서 공백 제거
SELECT TRIM('   K   H   ') FROM DUAL;

-- 'ZZZZKHZZZZ'에서 'Z'를 제거. 기본값이 BOTH이므로, 양쪽에서부터.
SELECT TRIM('Z' FROM 'ZZZZKHZZZZ') FROM DUAL;

-- '11132KH12322' 에서 '1'을 제거. 기본값이 BOTH이므로, 양쪽에서부터
SELECT TRIM('1' FROM '11132KH12322') FROM DUAL;

-- 제거 문자는 1글자
--SELECT TRIM('123' FROM '11132KG12322') FROM DUAL;

-- 제거의 방향 주입
SELECT TRIM(LEADING 'Z' FROM 'ZZZZKHZZZZ') FROM DUAL; -- LTRIM과 유사. 왼쪽에서부터 제거
SELECT TRIM(LEADING 'Z' FROM 'ZZZZKHZZZZ') FROM DUAL; -- RTRIM과 유사, 오른쪽에서부터 제거.
SELECT TRIM(BOTH 'Z' FROM 'ZZZZKHZZZZ') FROM DUAL; -- 양쪽에서부터 Z 제거.

/*
    LOWER / UPPER / INITCAP
    
    LOWER : 모든 문자 소문자로 반환 (JAVA의 toLowerCase()와 유사)
    UPPER : 모든 문자 소문자로 반환 (JAVA의 toUpperCase()와 유사)
    INITCAP : 모든 단어의 첫 글자를 대문자로 변환
*/

SELECT LOWER('Welcome To Korea') FROM DUAL;
SELECT LOWER('dsdskdsdksjDSADKDADS') FROM DUAL;

SELECT UPPER('Welcome To Korea') FROM DUAL;
SELECT UPPER('dsdskdsdksjDSADKDADS') FROM DUAL;

-- 띄어쓰기 기준으로 제일 앞에 글자 대문자로 변환
SELECT INITCAP('welcome to korea') FROM DUAL;


/*
    CONCAT
    2개의 문자열 전달 받아, 하나로 결합한 후 결과를 반환
    
    CONCAT(STRING1, STRING2)
*/

SELECT CONCAT('HELLO', 'WORLD') FROM DUAL;
--SELECT CONCAT('HELO', 'WORLD', '!!!') FROM DUAL; -- 전달값은 2개!!!

SELECT CONCAT(CONCAT('HELLO', 'WORLD'), '!!!') FROM DUAL;


/*
    REPLACE
    - 문자열을 대체해주는 기능
    
    REPLACE(STRING, STR1, STR2)
*/

SELECT REPLACE('ABCDDESACVDAA', 'A', 'Z') FROM DUAL;
SELECT REPLACE('ABCDDESACVDAA', 'AB', 'Z') FROM DUAL;

SELECT EMAIL, REPLACE(EMAIL, 'kh.or.kr', 'naver.com') FROM EMPLOYEE;

SELECT EMAIL, REPLACE(EMAIL, SUBSTR(EMAIL,INSTR(EMAIL, '@')+1), 'naver.com') FROM EMPLOYEE;

/*
    숫자 처리 함수
    
*/
/*
    ABS
    - 전달된 숫자의 절대값을 구해주는 함수 
        - 자바의 Math.abs()와 유사
    절대값 : 0에서부터의 거리
    
    ABS(NUMBER)
*/

SELECT ABS(5) FROM DUAL;
SELECT ABS(-5) FROM DUAL;
SELECT ABS(5.12) FROM DUAL;
SELECT ABS(-5.12) FROM DUAL;
SELECT ABS('432') FROM DUAL;

/*
    MOD
    - 두 수를 나눈 나머지 값을 반환해주는 함수
    
    MOD(NUMBER1, NUMBER2)
    
*/

SELECT MOD(10, 3) FROM DUAL;

SELECT MOD(10.26, 3) FROM DUAL;

/*
    ROUND
    반올림한 결과를 반환해주는 함수
*/

SELECT ROUND(123.456) FROM DUAL; -- 두번 째 값 미 작성 시, 0
SELECT ROUND(123.456, 1) FROM DUAL;
SELECT ROUND(123.456, 2) FROM DUAL;
SELECT ROUND(123.456, 3) FROM DUAL;

SELECT ROUND(123.456, 0) FROM DUAL;
SELECT ROUND(123.456, -1) FROM DUAL;
SELECT ROUND(123.456, -2) FROM DUAL;
SELECT ROUND(123.456, -3) FROM DUAL;

/*
    CEIL
    소수점을 올림처리 해주는 함수
    
    
*/

SELECT CEIL(123.152) FROM DUAL;
SELECT CEIL(100.000001) FROM DUAL;

/*
    FLOOR
    소수점 아래 숫자를 버림 처리하는 함수
*/

SELECT FLOOR(123.000001) FROM DUAL;
SELECT FLOOR(123.99999999999) FROM DUAL;

/*
    TRUNC
    - 절삭하다의 의미를 가짐
*/

SELECT TRUNC(123.456) FROM DUAL; --두번 째 매개변수 미 지정 시, FLOOR랑 동일한 기능
SELECT TRUNC(123.456, 1) FROM DUAL; -- 소수점 첫번 째 자릿 수 이후의 소수점 삭제
SELECT TRUNC(123.456, 2) FROM DUAL; -- 소수점 두번 째 자릿 수 이후의 소수점 삭제
SELECT TRUNC(123.456, -1) FROM DUAL; -- 1의 자리 숫자 제거 후, 0으로 표기


/*
    <날짜 처리 함수>
*/

SELECT SYSDATE FROM DUAL;
/*
    MONTHS_BETWEEN (DATE1, DATE2)
    - 두 날짜 사이의 개월 수 
*/

-- EMPLOYEE 테이블에서, 사원명, 입사일, 근무일수, 근무개월 수 
SELECT EMP_NAME 사원명, HIRE_DATE 입사일자, FLOOR(SYSDATE-HIRE_DATE) 근무일수, CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) 근무개월수 FROM EMPLOYEE;

/*
    ADD_MONTHS
    특정 DATE 값에, 지정한 숫자만큼 개월수를 더하여 반환
    
*/

SELECT ADD_MONTHS(SYSDATE, 3) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, 6) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, -3) FROM DUAL;

-- 수습기간이 6개월이라고 가정했을 때, 각 사원의 수습이 끝난일자를 조회.
SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 6) AS "수습 종료" FROM EMPLOYEE;

/*
    NEXT_DAY
    - 특정 날짜 이후에 가까운 해당 요일의 날짜를 반환해주는 함수
    
    NEXT_DAY(DATE, 문자|숫자)
*/

SELECT NEXT_DAY(SYSDATE, '일요일') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '일') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '금요일') FROM DUAL; -- 오늘이 금요일이면, 다음 금요일
SELECT NEXT_DAY(SYSDATE, '금') FROM DUAL;
-- SELECT NEXT_DAY(SYSDATE, 'FRIDAY') FROM DUAL; -- 언어가 한국어로 설정되어 있어서 오류 발생

SELECT NEXT_DAY(SYSDATE, 1) FROM DUAL; -- 일요일
SELECT NEXT_DAY(SYSDATE, 2) FROM DUAL; -- 월요일
SELECT NEXT_DAY(SYSDATE, 3) FROM DUAL; -- 화요일
SELECT NEXT_DAY(SYSDATE, 4) FROM DUAL; -- 수요일
SELECT NEXT_DAY(SYSDATE, 5) FROM DUAL; -- 목요일
SELECT NEXT_DAY(SYSDATE, 6) FROM DUAL; -- 금요일
SELECT NEXT_DAY(SYSDATE, 7) FROM DUAL; -- 토요일
-- SELECT NEXT_DAY(SYSDATE, 1) FROM DUAL; -- 1주일은 일요일부터 ~ 토요일까지만 존재합니다.

/*
    LAST_DAY
    - 해당월의 마지막 날짜를 반환
    
*/

SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT LAST_DAY(ADD_MONTHS(SYSDATE, 4)) FROM DUAL;

-- EMPLOYEE에서 사원명, 입사일, 입사한 월의 마지막 일자, 입사한달에 근무한 일수
SELECT EMP_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE), LAST_DAY(HIRE_DATE)-HIRE_DATE FROM EMPLOYEE;

/*
    EXTRACT : 특정 날짜로부터 년도|월|일 값을 추출해서 반환하는 함수
    
    EXTRACT(YEAR FROM DATE) : 년도 추출
    EXTRACT(MONTH FROM DATE) : 월 추출
    EXTRACT(DAY FROM DATE) : 일 추출
*/

SELECT EMP_NAME, HIRE_DATE, EXTRACT(YEAR FROM HIRE_DATE) AS 연도, EXTRACT(MONTH FROM HIRE_DATE) AS 월, EXTRACT(DAY FROM HIRE_DATE) AS 일
FROM EMPLOYEE;

/*
    형변환 함수
    
    TO_CHAR : 숫자 또는 날짜 타입의 데이터를 문자 타입으로 변환해주는 함수
    
    TO_CHAR(숫자|날짜, [포맷])
*/

SELECT TO_CHAR(1234) FROM DUAL;
SELECT TO_CHAR(1234, '99999') FROM DUAL; -- 5칸 자리 확보 후, 오른쪽 정렬. 나머지 공백으로 채움
SELECT TO_CHAR(1234, '99,999') FROM DUAL; -- 5칸 자리 확보 후, 오른쪽 정렬. 나머지 공백으로 채움 (패턴 99,999)
SELECT TO_CHAR(1234, '999') FROM DUAL; -- 지정한 자릿 수는 백의 자리숫자인데, 실제 값은 천의 자리
SELECT LTRIM(TO_CHAR(1234, '999,999,999')) FROM DUAL; -- 나머지 공백으로 채운 자릿수를, LTRIM으로 제거.
SELECT TO_CHAR(1234, 'L9999') FROM DUAL; -- 현재 지역의 화폐 단위.
SELECT TO_CHAR(1234, '$9999') FROM DUAL;

SELECT EMP_NAME, SALARY, TO_CHAR(SALARY, 'L999,999,999') FROM EMPLOYEE;

-- 스크립트에 출력되는 표기는 동일하지만, 자료형이 다르다.
SELECT TO_CHAR(SYSDATE), SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD/DAY') FROM DUAL;

-- AM : 오전, PM : 오후
SELECT TO_CHAR(SYSDATE, 'PM HH:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY DY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY"년"MM"월"DD"일"') FROM DUAL; -- 년,월,일 문자는 함수 내부에 지정되지 않은 포맷이므로, ""로 표기

/*
    TO_DATE
    - 숫자 또는 문자 타입의 데이터를 날짜 데이터 타입으로 변환해주는 함수
    
    TO_DATE(숫자|문자, [포맷])
*/

SELECT TO_DATE(20100808) FROM DUAL;
SELECT TO_DATE(100808) FROM DUAL;
SELECT TO_DATE('070801') FROM DUAL; -- 0으로 시작하는 경우, ''로 묶어주어야함
SELECT TO_DATE('041030 143012') FROM DUAL; --  전달된 문자열의 형식을 알 수 없음 => 에러
SELECT TO_DATE('041030 143012', 'YYMMDD HH24MISS') FROM DUAL;

-- 현재 세기의 연도로 변환됨.
SELECT TO_DATE('140630', 'YYMMDD') FROM DUAL;
SELECT TO_DATE('980630', 'YYMMDD') FROM DUAL;

-- RR : 50미만인 경우, 현재세기로 변환. 아닌 경우 이전 세기로 변환
SELECT TO_DATE('140630', 'RRMMDD') FROM DUAL;
SELECT TO_DATE('980630', 'RRMMDD') FROM DUAL;

/*
    TO_NUMBER : 문자 타입의 데이터를 숫자 타입 데이터로 변환
    
    TO_NUMBER(문자, [포맷])
*/

SELECT '01234' FROM DUAL;
SELECT TO_NUMBER('01234') FROM DUAL;

SELECT TO_NUMBER('94823948239') FROM DUAL;
SELECT TO_NUMBER('123,456,789', '999,999,999') FROM DUAL; -- 첫번 째 전달값의 패턴을 두번 째 전달값으로 전달해야함.


SELECT '50000' + '2000' FROM DUAL;
SELECT '50,000' + '2,000' FROM DUAL; -- 오류 발생
SELECT TO_NUMBER('50,000', '99,999') + TO_NUMBER('2,000', '9,999') FROM DUAL;

-- 각 사원의 사원명, 급여, 보너스, 보너스 포함 월 급여
SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * BONUS FROM EMPLOYEE;

SELECT EMP_NAME, NVL(BONUS, 0) FROM EMPLOYEE;

SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * NVL(BONUS,0) FROM EMPLOYEE;

-- NVL2 : 첫번 째 전달값이 NULL이 아닌 경우, 두번 째 전달값 출력하고, NULL인 경우 세번 째 전달한 값 출력
SELECT EMP_NAME, BONUS,NVL2(BONUS, 1, 0) FROM EMPLOYEE;

/*
    선택 함수
    
    DECODE
        DECODE(대상컬럼값, 비교값1,비교값1,비교값2,비교값2,......)
        
    CASE WHEN
*/

-- 각 사원의 성별에 따라 '남', '여'로 출력
SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여','3','남','4','여')
FROM EMPLOYEE;

-- EMPLOYEE 테이블의 각 직급별로 월급을 안삼
/*
    J7은 급여 10% 인상
    J6은 급여 15% 인상
    J5은 급여 20% 인상
    그 외는 5% 인상
*/

SELECT EMP_NAME, JOB_CODE, DECODE(JOB_CODE, 'J7', SALARY*1.1, 
                                            'J6', SALARY*1.15,
                                            'J5', SALARY*1.2,
                                            SALARY*1.05) -- 그 외 직급에 대한 처리
    AS "인상된 급여" FROM EMPLOYEE;
/*
    선택 함수
    CASE WHEN THEN
    
    CASE WHEN 조건식1 THEN 조건식 1을 만족할 경우 
         WHEN 조건식2 THEN 조건식 2을 만족할 경우
         WHEN 조건식3 THEN 조건식 3을 만족할 경우
         ELSE 그 외
    END
*/

SELECT CASE WHEN SUBSTR(EMP_NO, 8, 1) = '1' OR SUBSTR(EMP_NO, 8, 1) = '3' THEN '남'
            WHEN SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8, 1) = '4' THEN '여'
            ELSE '사람이아닙니다'
        END AS "성별"
FROM EMPLOYEE;

SELECT CASE WHEN SUBSTR(EMP_NO, 8, 1) IN('1','3') THEN '남'
            WHEN SUBSTR(EMP_NO, 8, 1) IN('2','4') THEN '여'
            ELSE '사람이아닙니다' -- 필수 아님.
        END AS "성별"
FROM EMPLOYEE;

-----------------------------그룹 함수-----------------------------
-- 그룹 함수 : 전달값 N개 결과값은 1개
/*
    SUM()
        - 합계를 구하는 함수
        
    AVG()
        - 평균값을 구하는 함수
        
    COUNT()
        - 조회된 행의 갯수를 구하는 함수
        
    MIN()
        - 최소값을 구하는 함수
        
    MAX()
        - 최대값을 구하는 함수
        
    MEDIAN()
        - 중간값을 구하는 함수
*/

-- 전 직원의 급여 합계
SELECT SUM(SALARY) FROM EMPLOYEE;

-- 전 직원의 급여 평균
SELECT AVG(SALARY) FROM EMPLOYEE;

-- 전 직원 수
SELECT COUNT(*) FROM EMPLOYEE;

-- 중복된 직급코드를 각각 1행으로 표기하고, 모든 행의 개수수 반환
SELECT COUNT(DISTINCT JOB_CODE) FROM employee;

-- 중복을 제거하고, 유효한 행의 갯수를 반환(NULL 제외)
SELECT COUNT(DISTINCT DEPT_CODE) FROM employee;

-- 남자 사원들의 연봉 총 합계
SELECT SUM(SALARY)*12 FROM EMPLOYEE WHERE SUBSTR(EMP_NO, 8, 1 ) IN ('1', '3');

-- 가장 급여를 적게 받는 사원의 급여
SELECT MIN(SALARY) FROM EMPLOYEE;
SELECT MIN(HIRE_DATE) FROM EMPLOYEE; -- 입사일이 가장 빠른 사원의 입사일

-- 가장 급여를 많이 받는  사원 급여
SELECT MAX(SALARY) FROM EMPLOYEE;
SELECT MAX(HIRE_DATE) FROM EMPLOYEE; -- 입사일이 가장 늦은 사원의 입사일 

SELECT MEDIAN(SALARY) FROM EMPLOYEE;
SELECT MEDIAN(HIRE_DATE) FROM EMPLOYEE;

SELECT SUM(SALARY) FROM EMPLOYEE;

-- 직급별 급여 합계
SELECT JOB_CODE, SUM(SALARY) FROM EMPLOYEE;