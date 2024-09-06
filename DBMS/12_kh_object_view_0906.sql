/*
    < view >
    
    - DDL로 정의할 수 있는 객체의 한 종류.
    - 테이블을 조회할 수 있는 SQL을 저장할 수 있는 객체.
    - 자주 사용되거나 복잡한 SELECT SQL을 VIEW에 저장함으로써, 결과를 간단하게 조회할 수 있다.
    - 임시 테이블 같은 존재라고 생각. (실제 데이터가 저장되어 있는 것은 아님)
    - 조회 시, 원본 테이블을 참조하여 데이터를 출력한다.
    
    * 단, VIEW를 수정하면 원본 테이블에도 반영이 된다. (원본 테이블을 참조하고 있으므로)
    * 원본 테이블을 수정해도, VIEW에 있는 데이터가 변경된다.
    
    물리적인 테이블 : 실제 데이터가 존재하는 테이블 (EMPLOYEE, DEPARTMENT, LOCATION.....)
    논리적인 테이블 : 실제 데이터가 존재하는 테이블이 아닌, 물리적 테이블을 기반으로 한 가상의 테이블
            ->> VIEW는 논리적인 테이블이라고 말할 수 있다. 
*/

/*
    VIEW 생성 방법
    
    [표현식]
    
    CREATE VIEW 뷰명칭
    AS
    서브쿼리;
*/

-- 오류 발생 : VIEW를 생성할 수 있는 권한이 KH 계정에 부여되지 않았음.
CREATE VIEW EMP_VIEW
AS
SELECT EMP_ID, EMP_NAME, EMAIL, PHONE
  FROM EMPLOYEE;

-- 관리자 계정으로 접속하여, KH 계정에 VIEW를 생성할 수 있는 권한을 부여
GRANT CREATE VIEW TO KH;

-- 출력 결과는 테이블과 다를게 없지만, 실제 데이터가 저장되어 있는 것은 아님!!! 논리적인 테이블
SELECT *
  FROM EMP_VIEW;
  
-- 원본 테이블 복사
CREATE TABLE EMP_COPY
AS
SELECT EMP_ID, EMP_NAME, EMAIL, PHONE
  FROM EMPLOYEE;

SELECT * FROM EMP_COPY; -- 물리적인 테이블(JAVA에서의 깊은 복사와 유사(내부 데이터만 복사하는))
SELECT * FROM EMP_VIEW; -- 논리적인 테이블(JAVA에서의 얕은 복사와 유사(주소값을 공유하는!))

SELECT *
  FROM EMPLOYEE
 WHERE EMP_NAME = '이중석';
 
UPDATE EMPLOYEE
   SET PHONE = '01040647125'
 WHERE EMP_NAME = '이중석';
 
-- 복사한 테이블(물리적 테이블)은 별도의 데이터를 저장하기 때문에, 원본 테이블 변경 시 영향을 받지 않는다.
SELECT *
  FROM EMP_COPY
 WHERE EMP_NAME = '이중석';
 
-- 원본 테이블로 생성된 VIEW(논리적 테이블)은 원본 테이블을 참조하기 때문에, 원본 테이블 변경 시 영향을 받는다.
SELECT *
  FROM EMP_VIEW
 WHERE EMP_NAME = '이중석';
 
---------------------------------------------------------------------------------------
-- 복사한 테이블 (물리적 테이블) 업데이트
UPDATE EMP_COPY
   SET PHONE = '01012345678'
 WHERE EMP_NAME = '임시환';
 
SELECT * 
  FROM EMP_COPY 
 WHERE EMP_NAME = '임시환';
 
SELECT * -- 변경되지 않았음!
  FROM EMPLOYEE -- 원본 테이블 
 WHERE EMP_NAME = '임시환'; 
 
-- 원본 테이블로 생성한 VIEW (논리적 테이블) 업데이트
UPDATE EMP_VIEW
   SET PHONE = '01099998888'
 WHERE EMP_NAME = '임시환';
 
SELECT *
  FROM EMP_VIEW
 WHERE EMP_NAME = '임시환';
 
SELECT * -- 원본 테이블 변경되었음!
  FROM EMPLOYEE
 WHERE EMP_NAME = '임시환';
 
/*
    VIEW에 DML 조작이 불가능한 경우
    
    1) 뷰에 포함되지 않은 컬럼을 조작하는 경우
    2) VIEW에 포함되지 않은 컬럼 중, 원본 테이블의 NOT NULL 제약조건이 설정된 경우
    3) 산술 연산식으로 생성된 컬럼이 존재하는 VIE
    4) JOIN, GROUP 함수로 생성된 VIEW
    5) DISTINCT로 중복을 제거하여 생성한 VIEW
*/

--1) 뷰에 포함되지 않은 컬럼을 조작하는 경우
SELECT *
  FROM EMP_VIEW;
  
UPDATE EMP_VIEW
   SET SALARY = 2000000 -- VIEW에서 참조하지 않는 컬럼이므로 오류 발생!
 WHERE EMP_ID = '202';
 
 --2) VIEW에 포함되지 않은 컬럼 중, 원본 테이블의 NOT NULL 제약조건이 설정된 컬럼이 존재하는 경우
SELECT *
  FROM EMP_VIEW;
-- 현재 VIEW가 참조하고 있는 컬럼은 EMP_ID, EMP_NAME, EMAIL, PHONE
-- VIEW에 INSERT는 원본(EMPLOYEE)에도 ISERT 됨! 근데 위 4개 컬럼 이외의 컬럼들 (EMP_NO, JOB_CODE...)에
-- NOT NULL 제약조건이 설정되어 있어 오류 발생!
INSERT INTO EMP_VIEW VALUES ('900', '장승원', 'jsw0209@iei.or.kr', '01012345678');

--3) 산술연산식으로 생성된 VIEW인 경우
CREATE VIEW EMP_VIEW2
AS
SELECT EMP_ID, EMP_NAME, SALARY * 12 AS 연봉 -- 별칭을 지정해야 정상적으로 생성이 가능하다.
  FROM EMPLOYEE;
  
SELECT * FROM EMP_VIEW2;

UPDATE EMP_VIEW2
   SET 연봉 = 9000000 -- 오류 발생
 WHERE EMP_ID = '200';
 
UPDATE EMPLOYEE
   SET SALARY = 3000000 -- 원본 테이블은 당연히 업데이트 가능.
 WHERE EMP_ID = '200';
 
SELECT SALARY
  FROM EMPLOYEE
 WHERE EMP_ID = '200';

SELECT *    -- VIEW에서 보여지는 데이터도 정상적으로 산술연산식을 통한 결과를 보여주고 있음.
  FROM EMP_VIEW2;
  
-- 4) GROUP BY 또는 JOIN을 통해 생성한 VIEW
CREATE VIEW EMP_VIEW3
AS
SELECT DEPT_CODE, SUM(SALARY) 합계, FLOOR(AVG(SALARY)) 평균
  FROM EMPLOYEE
 GROUP BY DEPT_CODE;
 
SELECT *
  FROM EMP_VIEW3;

-- 원본(EMPLOYEE) 테이블의 부서코드가 D6인 사원들에게 합계 금액과, 평균 금액을 어떻게 분배하여 SALARY를 업데이트 하는가??
UPDATE EMP_VIEW3
   SET 합계 = 5000000,
       평균 = 3500000
 WHERE DEPT_CODE = 'D6';
 
 
-- 5) DISTINCT로 중복을 제거하여 생성한 VIEW
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;

----------------------------------------------------------------------
/*
    VIEW 옵션
    
    [표현식]
    CREATE [OR REPLACE] [FORCE | "NOFORCE"] VIEW 뷰명칭
    AS
    서브쿼리
    [WITH CHECK OPTION]
    [WITH READ ONLY];
    
    OR REPLACE          : 기존에 생성된 뷰가 존재하지 않으면, 생성하고 존재하면 변경.
    FORCE | NOFORCE
            - FORCE : 뷰 생성 시, 서브쿼리에 기술된 테이블이 존재하지 않아도 뷰가 생성됨.
            - NOFORCE[기본값] : 서브쿼리에 기술한 테이블이 존재해야만 뷰 생성 가능.
    WITH CHECK OPTION : DML시, 서브쿼리에 기술된 조건에 부합한 값으로만 DML 조작 가능
    WITH READ ONLY    : 뷰에 대해 DML 조작 불가(오직 조회만 가능)
*/

-- 1) CREATE OR REPLACE
CREATE OR REPLACE VIEW EMP_VIEW -- 기존에 존재하는 VIEW에 대해서 REPLACE 동작!!
AS
SELECT EMP_ID, EMP_NAME, EMAIL, PHONE, DEPT_CODE, JOB_CODE
  FROM EMPLOYEE;
  
SELECT *
  FROM EMP_VIEW;
  
-- 2) FORCE
CREATE OR REPLACE FORCE VIEW VW_FORCE
AS
SELECT TEST1, TEST2, TEST3
  FROM TEST_TBL; -- 컴파일 오류와 함께 뷰가 생성되었습니다.(존재하지 않는 테이블로 생성된 뷰!)
  
SELECT * -- 생성은 되었지만, 조회 불가! 좌측 VVIEW 리스트에서 X박스 모양이 표시된걸 확인할 수 있음.
  FROM VW_FORCE;
  
CREATE TABLE TEST_TBL(
    TEST1 VARCHAR2(30),
    TEST2 VARCHAR2(30),
    TEST3 VARCHAR2(30)
);

-- 위 TEST_TBL을 생성하여서, 조회 가능!
SELECT *
  FROM VW_FORCE;
  
--3) WITH CHECK OPTION
-- VIEW에 대해 DML 조작 시, 서브쿼리에 부합하는 값으로만 DML 가능!

CREATE OR REPLACE VIEW EMP_VIEW4
AS
SELECT EMP_ID, EMP_NAME, SALARY
  FROM EMPLOYEE
 WHERE SALARY >= 3000000
WITH CHECK OPTION;

SELECT *
  FROM EMP_VIEW4;

UPDATE EMP_VIEW4
  SET SALARY = 3500000 -- 뷰 생성 시, WHERE조건에 부합하므로 정상 업데이트
 WHERE EMP_NAME = '대북혼';

UPDATE EMP_VIEW4
  SET SALARY = 2900000 -- 뷰 생성 시, WHERE조건에 부합하지 않으므로 오류 발생!
 WHERE EMP_NAME = '대북혼';
 
-- 4) WITH READ ONLY
-- VIEW 생성 시, 읽기 전용(조회)으로 생성. DML 조작은 불가능!
--원본 테이블에 영향을 주지 않도록 하기 위해!

CREATE OR REPLACE VIEW EMP_VIEW5
AS
SELECT EMP_ID, EMP_NAME, EMP_NO, SALARY
  FROM EMPLOYEE
WITH READ ONLY;

SELECT *
  FROM EMP_VIEW5;
  
UPDATE EMP_VIEW5
   SET SALARY = 3000000 -- READ ONLY로 생성되 VIEW이므로, DML 불가!!!
 WHERE EMP_ID = '222';