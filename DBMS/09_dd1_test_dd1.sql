/*
    DDL : 데이터 정의 언어
        - 오라클에서 정의하는 객체(Object)를 새롭게 만들고(Create) 구조(AlTER)를 변경하고
          구조 자체를 삭제(DROP)하는 구문
          
    오라클 객체의 종류
    - Table     - User       - View       - Sequence
    - Index     - Procedure  - Trigger    - Function...
*/
/*
    <Create>
    객체를 생성하는 구문
    
    < 테이블 >
    행과 열로 이루어진 객체
    [표현식]
    Create Table 테이블명(
        컬럼명 자료형(크기),
        컬럼명 자료형(크기),
        컬럼명 자료형(크기),
        컬럼명 자료형(크기)
        );
*/
-- 회원 정보를 관리하는 테이블을 생성
Create Table TBL_Member(
        Member_NO Number,
        Member_ID VarChar2(30),
        Member_PW VarChar2(30),
        Member_Name VarChar2(30),
        Member_Gender Char(3),
        Member_Phone VarChar2(13),
        EMAIL VarChar2(200),
        ENT_Date Date
    );
    
DELETE FROM TBL_MEMBER_CONS_UNIQUE2;
-- 데이터 딕셔너리 : 다양한 객체들의 정보를 저장하고 있는 시스템 테이블's
Select * From User_Tables; -- 현재 계정이 가지고 있는 테이블들에 대한 정보
Select * From User_Tab_Columns;-- 현재 계정이 가지고 있는 테이블들에 대한 정보를 컬럼 단위로 조회

-------------------------------------------------------------------------------------------------------
/*
    컬럼에 주석(코멘트 달기)
    [표현식]
    
    Comment On Column 테이블명.컬럼명 Is '내용';
*/
Comment On Column TBL_Member.Member_NO Is '회원번호';
Comment On Column TBL_Member.Member_ID Is '회원ID';
Comment On Column TBL_Member.Member_Pw Is '회원비밀번호';
Comment On Column TBL_Member.Member_Name Is '회원이름';
Comment On Column TBL_Member.Member_Gender Is '회원성별';
Comment On Column TBL_Member.Member_Phone Is '전화번호';
Comment On Column TBL_Member.EMAIL Is '이메일';
Comment On Column TBL_Member.ENT_Date Is '가입일';
-- 오타 발생시 재작성 가능

Insert Into TBL_Member
    Values (1, 'qwer1234', '1234', '장승원', '남', '010-1234-5678', 'qwer1234@naver.com', Sysdate);

Insert Into TBL_Member
    Values (1, null, '1234', '장승원', '남', null, 'qwer1234@naver.com', null);
-- 유효하지 않은 데이터가 삽임되고 있음. 가입해야 Row가 추가되는데 ID나 가입일 데이터가 null인 경우

Select * From TBL_Member;

/*
    제약조건 Constraint
        - 컬럼에 유효한 데이터 값을 유지하기 위해서 특정 컬럼에 대해 설정하는 제약 조건
        - 데이터 무결성 보장을 목적으로 함(결함이 없는)
        
    제약조건의 종류
        - Not Null, Unique, Check, Primary Key, Foreign Key 
        
    제약조건 부여 방식
        1) 컬럼 레벨 방식
        2) 테이블 레벨 방식
*/
/*
    Not Null 
        - 해당 컬럼에 반드시 값이 존재해야하는 경우를 제시할 수 있다(Null을 허용하지 않음
        - 삽입(Insert), 수정(Update)시에도  Null 값을 허용하지 않음
        - 컬럼 레벨 방식으로만 제약 조건 지정 가능
*/
Create Table TBL_Member_Cons_NotNull(
        Member_NO Number Not Null,
        Member_ID VarChar2(30) Not Null,
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) Not Null,
        Member_Phone Char(13),
        EMAIL VarChar2(200) Not Null,
        ENT_Date Date Not Null
    );
    
Insert Into TBL_Member_Cons_NotNull
        Values(1, 'qwer1234', '1234', '장승원1', '남', '010-1234-4567', 'qwer1234@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_NotNull -- Phone은 null데이터 허용
        Values(2, 'qwer4567', '4567', '장승원2', '남', null, 'qwer4567@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_NotNull -- Pw는 Not Null 제약조건이 설정되어있음 -> 오류발생
        Values(3, 'qwer4632', null, '장승원3', '남', '010-3456-7698', 'qwer7543@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_NotNull
        Values(4, 'qwer7542', '1234', '장승원4', '남', '010-4732-7542', 'qwer4372@naver.com', Sysdate); 

Select * From TBL_Member_Cons_NotNull;

/*
    Unique
        - 해당 컬럼의 값에 중복된 값이 들어가면 안되는 경우 제시
        - 삽입 / 수정 시 기존에 존재하는 데이터의 값 중 중복된 값이 있을 경우 오류 발생
*/
Create Table TBL_Member_Cons_Unique1(
        Member_NO Number Not Null,
        Member_ID VarChar2(30) Not Null Unique, -- 컬럼 레벨 방식
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) Not Null,
        Member_Phone Char(13) Unique,
        EMAIL VarChar2(200) Not Null Unique,
        ENT_Date Date Not Null
    );
    
Create Table TBL_Member_Cons_Unique2(
        Member_NO Number Not Null,
        Member_ID VarChar2(30) Not Null,
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) Not Null,
        Member_Phone Char(13) Unique,
        EMAIL VarChar2(200) Not Null Unique,
        ENT_Date Date Not Null,
        Unique(Member_ID) -- 테이블 레벨 방식
    );    
    
Insert Into TBL_Member_Cons_Unique1 Values
    (1, 'qwer1234', '1234', '조용운', '남', '010-4859-1564', 'qwre1234@naver.com', Sysdate);
Insert Into TBL_Member_Cons_Unique1 Values
    (2, 'qwer1234', '1234', '조용운', '남', '010-4859-1564', 'qwre1234@naver.com', Sysdate);
    
    
/*
    <Create>
    객체를 생성하는 구문
    
    < 테이블 >
    행과 열로 이루어진 객체
    [표현식]
    Create Table 테이블명(
        컬럼명 자료형(크기),
        컬럼명 자료형(크기),
        컬럼명 자료형(크기),
        컬럼명 자료형(크기),
        [CONSTRAINT 제약조건명] 제약조건(컬럼명)
        );
*/


Create Table TBL_Member_CONSNAME(
        Member_NO Number            CONSTRAINT MEMNO_NN NOT NULL,
        Member_ID VarChar2(30)      CONSTRAINT MEMID_NN NOT NULL,
        Member_Pw VarChar2(30)      CONSTRAINT MEMPW_NN NOT NULL,
        Member_Name VarChar2(30)    CONSTRAINT MEMNAME_NN NOT NULL,
        Member_Gender Char(3)       CONSTRAINT MEMGEN_NN NOT NULL,
        Member_Phone Char(13),
        EMAIL VarChar2(200)         CONSTRAINT MEMEMAIL_NN NOT NULL,
        ENT_Date Date               CONSTRAINT MEMDATE_NN NOT NULL,
        CONSTRAINT MEMID_UNQ UNIQUE(Member_ID) -- 테이블 레벨 방식
    );    
    
INSERT INTO TBL_MEMBER_CONSNAME VALUES
(1, 'jsw0902', '1234', '장승원', '남', '010-1111-1111', 'jsw0902@iei.or.kr', SYSDATE);

INSERT INTO TBL_MEMBER_CONSNAME VALUES
(1, 'jsw0902', NULL, '장승원', '남', '010-1111-1111', 'jsw0902@iei.or.kr', SYSDATE);

-- 오류 발생 스크립트에, 설정한 제약조건 명칭이 출력되므로 어느 컬럼에서 제약조건이 위배됐는지 확인 가능
INSERT INTO TBL_MEMBER_CONSNAME VALUES
(2, 'jsw0902', '1234', '장승원', '남', '010-1111-1111', 'jsw0902@iei.or.kr', SYSDATE);


INSERT INTO TBL_MEMBER_CONSNAME VALUES
(3, 'jsw0901', '1234', '장승원', '중', '010-1111-1111', 'jsw0902@iei.or.kr', SYSDATE);

/*
    CHECK 
    - 컬럼에 삽입될 수 있는 값에 대한 조건을 제시.
    - CHECK로 설정한 값만 삽입 / 수정될 수 있음.
*/
Create Table TBL_Member_Cons_CHECK(
        Member_NO Number Not Null,
        Member_ID VarChar2(30) Not Null Unique, -- 컬럼 레벨 방식
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) CHECK(MEMBER_GENDER IN ('남','여')) Not Null, -- 컬럼 레벨 방식
        Member_Phone Char(13),
        EMAIL VarChar2(200) Not Null,
        ENT_Date Date Not Null
        -- CHECK(MEMBER_GENDER IN ('남','여')) -- 테이블 레벨 방식
    );
    
    
INSERT INTO TBL_MEMBER_CONS_CHECK
VALUES (1, 'jsw0902', '1234', '장승원', '남', '010-1111-1111', 'jsw0902@iei.or.kr', sysdate);

INSERT INTO TBL_MEMBER_CONS_CHECK
VALUES (2, 'siuu0922', '1234', '호날두', '여', '010-1312-1112', 'siuuu@iei.or.kr', sysdate);

INSERT INTO TBL_MEMBER_CONS_CHECK -- CHECK로 지정한 '남' 또는 '여' 값만 삽입될 수 있음.
VALUES (3, 'goat', '1234', '메시', '꿀', '010-1111-1114', 'goat@iei.or.kr', sysdate);
    
INSERT INTO TBL_MEMBER_CONS_CHECK
VALUES (1, 'Hsw0901', '1234', '장승원', '남', '010-1111-1111', 'jsw0902@iei.or.kr', sysdate);


SELECT * FROM TBL_MEMBER_CONS_CHECK;
/*
    PRIMARY KEY(기본키)
    
    - 테이블에서 각 행(ROW)를 식별하기 위해 사용될 컬럼에 부여하는 제약조건
    
    PRIMAERY KEY 제약조건 설정 시, UNIQUE와 NOT NULL 제약조건을 가진다
    
    * 한 테이블당 하나의 PRIMARY KEY만 설정 가능!
*/
Create Table TBL_Member_Cons_PRIMARY(
        Member_NO Number Not Null PRIMARY KEY,
        Member_ID VarChar2(30) Not Null Unique, -- 컬럼 레벨 방식
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) CHECK(MEMBER_GENDER IN ('남','여')) Not Null, -- 컬럼 레벨 방식
        Member_Phone Char(13),
        EMAIL VarChar2(200) Not Null,
        ENT_Date Date Not Null
        -- CHECK(MEMBER_GENDER IN ('남','여')) -- 테이블 레벨 방식
    );

Create Table TBL_Member_Cons_PRIMARY2(
        Member_NO Number Not Null PRIMARY KEY,
        Member_ID VarChar2(30) Not Null PRIMARY KEY, -- 한 테이블당 하나의 PRIMARY KEY만을 가질 수 있다.
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) CHECK(MEMBER_GENDER IN ('남','여')) Not Null, -- 컬럼 레벨 방식
        Member_Phone Char(13),
        EMAIL VarChar2(200) Not Null,
        ENT_Date Date Not Null
        -- CHECK(MEMBER_GENDER IN ('남','여')) -- 테이블 레벨 방식
    );
    
INSERT INTO TBL_MEMBER_CONS_PRIMARY
VALUES (1, 'jsw0902', '1234', '장승원', '남', '010-1111-1111', 'jsw0902@iei.or.kr', sysdate);

INSERT INTO TBL_MEMBER_CONS_PRIMARY
VALUES (2, 'siuu0922', '1234', '호날두', '여', '010-1312-1112', 'siuuu@iei.or.kr', sysdate);

-- PRIMARY KEY로 설정된 컬럼의 값에 중복된 값이나 NULL은 허용되지 않음
INSERT INTO TBL_MEMBER_CONS_PRIMARY -- CHECK로 지정한 '남' 또는 '여' 값만 삽입될 수 있음.
VALUES (2, 'goat', '1234', '메시', '남', '010-1111-1114', 'goat@iei.or.kr', sysdate);

SELECT * FROM tbl_member_cons_primary;

/*
    쇼핑물
    
    회원관리 - 회원번호, 회원아이디, 회원비밀번호.............
    상품관리 - 상품코드, 상품명, 가격, 재고..................
    
    로그인 -> 상품 검색 -> 상품 상세보기 -> 좋아요, 찜하기
    
    테이블 : TBL_MEM_PRODUCT_LIKE
    
    - 상품 코드 (PRODUCT_CD)
    - 회원 번호 (MEMBER_NO)
    - 좋아요 누른 일자 (LIKE_DATE)
    
    ----------------------------------------------------------------
    PRODUCT_CD      |       MEMBER_NO       |       LIKE_DATE
    ----------------------------------------------------------------
    
    1) PRODUCT_CD를 PRIMARY_KEY로 지정했을 때
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P1', 'MEM1', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P2', 'MEM1', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P1', 'MEM2', SYSDATE); -- 상품코드 제약조건 위배.
    
    2) MEMBER_NO를 PRIMARY KEY로 지정했을 때 (단, 한명의 회원은 하나의 상품에 대해서만 좋아요를 누를 수 있음)
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P1', 'MEM1', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P2', 'MEM2', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P2', 'MEM1', SYSDATE); -- 회원번호 제약조건 위배
    
    3) PRODUCT_CD와 MEMBER_NO를 복합 PRIMARY KEY로 지정했을 때
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P1', 'MEM1', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P1', 'MEM2', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P2', 'MEM1', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P2', 'MEM2', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P1', 'MEM1', SYSDATE); -- 제약조건 위배.
*/

CREATE TABLE TBL_MEM_PRODUCT_LIKE (
       PRODUCT_CD VARCHAR2(20),
       MEMBER_NO VARCHAR2(20),
       LIKE_DATE DATE,
       PRIMARY KEY(PRODUCT_CD, MEMBER_NO) -- 복합 PRIMARY KEY
);

INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES('P1', 'MEM1', SYSDATE);
INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES('P1', 'MEM2', SYSDATE);
INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES('P2', 'MEM1', SYSDATE);
INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES('P2', 'MEM2', SYSDATE);
INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES('P1', 'MEM1', SYSDATE); -- 한명의 회원은 같은 상품에 대해 좋아요를 한번만 누를 수 있음!!

--------------------------------------------------------------------
-- 학생 정보를 관리할 테이블
CREATE TABLE TBL_STUDENT_NF(
    STUDENT_ID VARCHAR2(30) PRIMARY KEY,
    STUDENT_PW VARCHAR2(30) NOT NULL,
    STUDENT_NAME VARCHAR2(30) NOT NULL
);
-- 학생 취미 정보를 관리할 테이블
CREATE TABLE TBL_STUDENT_HOBBY_NF (
    HOBBY_CODE VARCHAR2(30) PRIMARY KEY,
    HOBBY_NAME VARCHAR2(30) NOT NULL,
    STUDENT_ID VARCHAR2(30) 
);

INSERT INTO TBL_STUDENT_NF VALUES ('jsw0902', '1234', '장승원');
INSERT INTO TBL_STUDENT_NF VALUES ('siuuuuu', '1234', '호날두');
INSERT INTO TBL_STUDENT_NF VALUES ('messi', '1234', '메시');

INSERT INTO TBL_STUDENT_HOBBY_NF VALUES ('1', '호우세레머니', 'siuuuu');
INSERT INTO TBL_STUDENT_HOBBY_NF VALUES ('2', '피파하기', 'messi');
INSERT INTO TBL_STUDENT_HOBBY_NF VALUES ('3', '호날두한테백태클하기', 'jsw0902');

SELECT * FROM TBL_STUDENT_HOBBY_NF;
SELECT * FROM TBL_STUDENT_NF;

INSERT INTO TBL_STUDENT_HOBBY_NF VALUES ('4', '호날두 백태클', 'NEUER');

-------------------------------------------------------------------------------
-- 학생 정보 테이블            : 참조 되는 테이블
-- 학생 취미 정보 테이블        : 참조 하는 테이블
/*
    외래키(FOREIGN KEY) 제약 조건
    
    - 참조 하는 테이블의 컬럼값은, 참조 되는 테이블의 컬럼값으로 존재해야 함.
*/

-- 회원 등급 관리 테이블
CREATE TABLE TBL_GRADE(
    GRADE_CODE VARCHAR2(20) PRIMARY KEY,
    GRADE_NAME VARCHAR2(20) NOT NULL
);

INSERT INTO TBL_GRADE VALUES ('1', 'VIP');
INSERT INTO TBL_GRADE VALUES ('2', 'GOLD');
INSERT INTO TBL_GRADE VALUES ('3', 'SILVER');

-- 회원 정보 테이블
CREATE TABLE TBL_MEMBER_CONS_FOREIGN(
    MEMBER_NO VARCHAR2(20) PRIMARY KEY,
    MEMBER_ID VARCHAR2(20) UNIQUE,
    MEMBER_PW VARCHAR2(20) NOT NULL,
    MEMBER_GRADE VARCHAR2(20) REFERENCES TBL_GRADE(GRADE_CODE)-- 컬럼 레벨 방식 (참조할 컬럼명 미지정 시, TBL_GRADE의 기본키를 참조함)
    /*
    테이블 레벨 방식으로 외래키 지정
    FOREIGN KEY(MEMBER_GRADE) REFERENCES TBL_GRADE(GRADE_CODE)
    */
);
SELECT * FROM TBL_GRADE;

INSERT INTO TBL_MEMBER_CONS_FOREIGN VALUES ('1', 'jsw09020', '1234', '1'); -- 등급 : 1
INSERT INTO TBL_MEMBER_CONS_FOREIGN VALUES ('2', 'ronaldo', '1234', '2'); -- 등급 : 2
INSERT INTO TBL_MEMBER_CONS_FOREIGN VALUES ('3', 'messi', '1234', '3'); -- 등급 : 3
INSERT INTO TBL_MEMBER_CONS_FOREIGN VALUES ('4', 'muller', '1234', '4'); -- 등급 : 4 -- 외래키 제약조건 위배
INSERT INTO TBL_MEMBER_CONS_FOREIGN VALUES ('5', 'test1', '1234', NULL); -- NULL 데이터는 허용 가능

UPDATE TBL_MEMBER_CONS_FOREIGN
   SET MEMBER_GRADE = '6' -- 등급
 WHERE MEMBER_NO = '5';

SELECT A.*,
        (SELECT GRADE_NAME FROM TBL_GRADE Z WHERE Z.GRADE_CODE = A.MEMBER_GRADE) GRADE_NAME
  FROM TBL_MEMBER_CONS_FOREIGN A;