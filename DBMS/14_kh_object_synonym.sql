/*
    동의어(SYNONYM) : A 계정이, B 계정의 테이블을 조회할 때 동의어를 사용하여 간단한 명칭으로 조회 가능하게 하는 것.
    
    * 명칭의 길이가 긴 테이블에 대해 SQL 수행 시, 동의어로 설정된 간단한 명칭으로 사용 가능.
    
    - 공개 동의
        - 관리자가 생성한 동의어
        - 모든 USER가 동의어를 사용할 수 있음.
    - 비공개 동의어
        - 특정 USER가 생성한 동의어
        - USER에 접근 권한이 부여된 타 USER만 사용이 가능.    
*/

--------------------------------------------------------------------------------
/*
    공개 동의어
*/

-- ADMIN 계정으로 동의어 생성 권한 부여
GRANT CREATE SYNONYM TO KH;

-- ADMIN 계정으로 공개 동의어 생성! (공개 동의어 생성시 PUBLIC을 붙여준다)
CREATE PUBLIC SYNONYM DEPT FOR KH.DEPARTMENT;

-- ADMIN 계정으로 공개 동의어를 사용할 테스트 계정 생성
CREATE USER SYNONYM_TEST IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO SYNONYM_TEST;
-- 테스트 계정에, KH의 DEPARTMENT 테이블을 조회할 수 있는 권한 부여
GRANT SELECT ON KH.DEPARTMENT TO SYNONYM_TEST;

-- SYNONYM_TEST 계정으로 접속하여 아래 SQL 실행
SELECT * FROM KH.DEPARTMENT;
SELECT * FROM DEPT;


--------------------------------------------------------------------------------

/*
    비공개 동의어
    
    특정 USER가 생성한 동의어
*/
-- ADMIN 계정으로 동의어 생성 권한 부여
GRANT CREATE SYNONYM TO KH;

-- KH 계정으로 동의어 생성!
CREATE SYNONYM EMPSYNO FOR EMPLOYEE;

-- 타 계정으로 KH EMPLOYEE에 대한 동의어 생성 시, SELECT 권한을 부여해야 함
-- 위, 공개 동의어 작성 시 이미 권한을 부여 했음! DEPARTMENT에만...
GRANT SELECT ON KH.EMPLOYEE TO SYNONYM_TEST;

SELECT * FROM KH.EMPLOYEE;
SELECT * FROM KH.EMPSYNO; -- 비공개 동의어는 앞에 USER 명칭을 작성해주어야 함.

