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
    Values (1, 'jsw0902', '1234', '장승원', '남', '010-1234-5678', 'jsw0902@naver.com', Sysdate);

Insert Into TBL_Member
    Values (1, null, '1234', '장승원', '남', null, 'jsw09021@naver.com', null);
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
        Values(1, 'jsw0902', '1234', '장승원1', '남', '010-1234-4567', 'jsw09021@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_NotNull -- Phone은 null데이터 허용
        Values(2, 'jsw020902', '4567', '장승원2', '남', null, 'jsw09022@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_NotNull -- Pw는 Not Null 제약조건이 설정되어있음 -> 오류발생
        Values(3, 'jsw090202', null, '장승원3', '남', '010-3456-7698', 'jsw09023@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_NotNull
        Values(4, 'jsw09023', '1234', '장승원4', '남', '010-4732-7542', 'jsw09024@naver.com', Sysdate); 

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
    (1, 'jsw0902', '1234', '장승원', '남', '010-4859-1564', 'jsw0902@naver.com', Sysdate);
Insert Into TBL_Member_Cons_Unique1 Values
    (2, 'jsw0902', '1234', '장승원', '남', '010-4859-1564', 'jsw0902@naver.com', Sysdate);
/*
    제약조건의 이름 설정하기
    [표현식]
    1) 컬럼 레벨 방식
       Create Table 테이블명(
        컬럼명 자료형 [Constraint 제약조건명] 제약조건, 
        컬럼명 자료형 [Constraint 제약조건명] 제약조건, 
        컬럼명 자료형 [Constraint 제약조건명] 제약조건
       );
       
    2) 테이블 레벨 방식
        Create Table 테이블명(
            컬럼명 자료형,
            컬럼명 자료형,
            컬럼명 자료형,
            [Constraint 제약조건명] 제약조건(컬럼명)
        );
*/
Create Table TBL_Member_ConsName(
        Member_NO Number         Constraint MEMNO_NN Not Null,
        Member_ID VarChar2(30)   Constraint MEMID_NN Not Null,
        Member_Pw VarChar2(30)   Constraint MEMPW_NN Not Null,
        Member_Name VarChar2(30) Constraint MEMNAME_NN Not Null,
        Member_Gender Char(3)    Constraint MEMGen_NN Not Null,
        Member_Phone Char(13) Unique,
        EMAIL VarChar2(200)      Constraint MEMEMAIL_NN Not Null Unique,
        ENT_Date Date            Constraint MEMDATE_NN Not Null,
        Constraint MEMID_UNQ Unique(Member_ID) -- 테이블 레벨 방식
    );  
    
Insert Into TBL_Member_ConsName Values
    (1,'qwer1234', '1234', '조용운', '남', '010-4859-1564', 'qwre1234@naver.com', Sysdate);
Insert Into TBL_Member_ConsName Values
    (2,'qwer1234', null, '조용운', '남', '010-4859-1564', 'qwre1234@naver.com', Sysdate);

-- 오류발생 스크립트에 설정한 제약조건명칭이 출력되므로 어느 컬럼에서 제약조건이 위배됐는지 확인 가능
Insert Into TBL_Member_ConsName Values
    (1,'qwer1234', '1234', '조용운', '남', '010-4859-1564', 'qwre1234@naver.com', Sysdate);
    
Insert Into TBL_Member_ConsName Values
    (3,'qwer1532', '1234', '조용운', '남', '010-5271-3462', 'qwre1522@naver.com', Sysdate);

/*
    Check
        - 컬럼에 삽입될 수 있는 값에 대한 조건을 제시
        - Check로 설정한 값만 삽입 / 수정될 수 있음
*/

Create Table TBL_Member_Cons_Check(
        Member_NO Number Not Null,
        Member_ID VarChar2(30) Not Null Unique,
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) Check(Member_Gender In ('남', '여')) Not Null , -- 컬럼 레벨 방식
        Member_Phone Char(13),
        EMAIL VarChar2(200) Not Null,
        ENT_Date Date Not Null
        -- Check(Member_Gender In ('남', '여')) <- 테이블 레벨 방식
    );

Insert Into TBL_Member_Cons_Check Values
    (1,'qwer1234', '1234', '조용운', '남', '010-4859-1564', 'qwer1234@naver.com', Sysdate);    
Insert Into TBL_Member_Cons_Check Values
    (2,'qwer6342', '1234', '카리나', '여', '010-1234-5678', 'qwer6435@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_Check Values -- Check로 지정한 '남' 또는 '여' 값만 삽입될 수 있음
    (2,'qwer6642', '1234', '김정은', '꿀', '010-1111-1111', 'qwer6431@naver.com', Sysdate); 

Insert Into TBL_Member_Cons_Check Values
    (3,'qwer57235', '1234', '조용운', '남', '010-7632-5462', 'qwer1253@naver.com', Sysdate);   

Select * From TBL_Member_Cons_Check;

/*
    Primary Key(기본키)
        - 테이블에서 각 행(Row)를 식별하기 위해 사용될 컬럼에 부여하는 제약조건
        - Primary Key 제약조건 설정 시 Unique와 Not Null 제약조건을 가진다
        - 한 테이블당 하나의 Primary Key만 설정 가능
*/

Create Table TBL_Member_Cons_Primary(
        Member_NO Number Primary Key, -- 컬럼 레벨 방식. 자동적으로 Not Null + Unique
        Member_ID VarChar2(30) Not Null Unique, 
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) Check(Member_Gender In ('남', '여')) Not Null ,
        Member_Phone Char(13),
        EMAIL VarChar2(200) Not Null,
        ENT_Date Date Not Null
    );

-- Primary Key로 설정된 컬럼의 값에 중복된 값이나 Null은 허용되지 않는다
Insert Into TBL_Member_Cons_Primary Values
    (1,'qwer1234', '1234', '조용운', '남', '010-4859-1564', 'qwer1234@naver.com', Sysdate);  
Insert Into TBL_Member_Cons_Primary Values
    (2,'qwer6342', '1234', '카리나', '여', '010-1234-5678', 'qwer6435@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_Primary Values -- Member_NO에서 2가 중복되어서 오류
    (2,'qwer6642', '1234', '김정은', '남', '010-1111-1111', 'qwer6431@naver.com', Sysdate);
Insert Into TBL_Member_Cons_Primary Values
    (3,'qwer6642', '1234', '김정은', '남', '010-1111-1111', 'qwer6431@naver.com', Sysdate);

Select * From TBL_Member_Cons_Primary;

Create Table TBL_Member_Cons_Primary2(
        Member_NO Number Primary Key, -- 컬럼 레벨 방식. 자동적으로 Not Null + Unique
        Member_ID VarChar2(30) Primary Key, --  Primary Key는 한 테이블당 하나만 가능 -> 오류발생
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) Check(Member_Gender In ('남', '여')) Not Null ,
        Member_Phone Char(13),
        EMAIL VarChar2(200) Not Null,
        ENT_Date Date Not Null
    );

/*
    쇼핑몰
    
    회원관리 - 회원번호, 회원아이디, 회원비밀번호......
    상품관리 - 상품코드, 상품명, 가격, 재고.......
    
    로그인 -> 상품검색 -> 상품 상세보기 -> 좋아요, 찜하기
    
    테이블 : TBL_Mem_Product_Like
        
        - 상품코드  (Product_CD)
        - 회원번호  (Member_NO)
        - 좋아요 누른 일자   (Like_Date)
    ----------------------------------------------------------------------------
    Product_CD          |           Member_NO               |          Like_Date
    ----------------------------------------------------------------------------
    1) Product_CD를 Primary_Key로 지정했을 때 (단 하나의 상품만 관리할 수 있음)
        - Insert Into TBL_Product_Like Values('P1', 'MEM1', Sysdate);
        - Insert Into TBL_Product_Like Values('P2', 'MEM1', Sysdate);
        - Insert Into TBL_Product_Like Values('P1', 'MEM1', Sysdate); -> 상품코드 제약조건 위배
        
    2) Member_NO를 Primary_Key로 지정했을 때 (단 한명의 회원은 하나의 상품에 대해서만 좋아요를 누를 수 있음)
        - Insert Into TBL_Product_Like Values('P1', 'MEM1', Sysdate);
        - Insert Into TBL_Product_Like Values('P1', 'MEM2', Sysdate);
        - Insert Into TBL_Product_Like Values('P2', 'MEM1', Sysdate); -> 중복값 허용 불가로 회원번호 제약조건 위배
        
    3) Product_CD와 Member_NO를 복합 Primary_Key로 지정했을 때 
        - Insert Into TBL_Product_Like Values('P1', 'MEM1', Sysdate);
        - Insert Into TBL_Product_Like Values('P1', 'MEM2', Sysdate);
        - Insert Into TBL_Product_Like Values('P2', 'MEM1', Sysdate);
        - Insert Into TBL_Product_Like Values('P2', 'MEM2', Sysdate);
        - Insert Into TBL_Product_Like Values('P1', 'MEM1', Sysdate); -> 제약조건 위배
*/      
Create Table TBL_Mem_Product_Like(
    Product_CD VarChar2(20),
    Member_NO VarChar2(20),
    Like_Date Date,
    Primary Key (Product_CD, Member_NO) -- 복합 Primary key
    );

Insert Into TBL_Mem_Product_Like Values('P1', 'MEM1', Sysdate);
Insert Into TBL_Mem_Product_Like Values('P1', 'MEM2', Sysdate);
Insert Into TBL_Mem_Product_Like Values('P2', 'MEM1', Sysdate);
Insert Into TBL_Mem_Product_Like Values('P2', 'MEM2', Sysdate);
-- Insert Into TBL_Mem_Product_Like Values('P1', 'MEM1', Sysdate); -> 한명의 회원은 같은 상품에 대해 좋아요를 한번만 누를 수 있음

Select * From TBL_Mem_Product_Like;
-----------------------------------------------------------------------------------
-- 학생 정보를 관리할 테이블
Create Table TBL_Student_NF(
        Student_ID VarChar2(30) Primary Key,
        Student_PW VarChar2(30) Not Null,
        Student_Name VarChar2(30) Not Null
    );
    
-- 학생 취미 정보를 관리할 테이블    
Create Table TBL_Student_Hobby_NF(
        Hobby_Code VarChar2(30) Primary Key,
        Hobby_Name VarChar2(30) Not Null,
        Hobby_ID VarChar2(30) 
    );

Insert Into TBL_Student_NF Values('qwer1234', '1234', '조용운');
Insert Into TBL_Student_NF Values('hsrd3532', '1234', '카리나');
Insert Into TBL_Student_NF Values('jtrs2346', '1234', '윈터');

Insert Into TBL_Student_Hobby_NF Values('1', '밥먹기', '조용운');
Insert Into TBL_Student_Hobby_NF Values('2', '유튜브 보기', '카리나');
Insert Into TBL_Student_Hobby_NF Values('3', '게임하기', '윈터');

Select * From TBL_Student_NF;
Select * From TBL_Student_Hobby_NF;

Insert Into TBL_Student_Hobby_NF Values('4', '잠자기', '성시경');
------------------------------------------------------------------------------------
-- 학생 정보 테이블        :   참조 당하는(되는) 테이블
-- 학생 취미 정보 테이블   :  참조 하는 테이블
/*
    외래키 (Foreign Key) 제약 조건
        - 참조 하는 테이블의 컬럼값은 참조되는 테이블의 컬럼값으로 존재해야 함
*/
Create Table TBL_Grade (
        Grade_Code VarChar2(20) Primary Key,
        Grade_Name VarChar2(20) Not Null
    );

Insert Into TBL_Grade Values ('1', 'VIP');
Insert Into TBL_Grade Values ('2', 'Gold');
Insert Into TBL_Grade Values ('3', 'Silver');

-- 회원 정보 테이블
Create Table TBL_Member_Cons_Foreign(
    Member_NO VarChar2(20) Primary Key,
    Member_ID VarChar2(20) Unique,
    Member_PW VarChar2(20) Not Null,
    Member_Grade VarChar2(20) References TBL_Grade(Grade_Code) -- 컬럼 레벨 방식 (참조할 컬럼 명을 미지정 시 TBL_Grade의 기본키를 참조)
    /*
    테이블 레벨 방식으로 외래키 지정
    Foreign Key(Member_Grade) References TBL_Grade(Grade_Code)
    */
    );
    
Select * From TBL_Grade;
Select * From TBL_Member_Cons_Foreign;
    
Insert Into TBL_Member_Cons_Foreign Values('1', 'qwer1234', '1234', '1'); -- 등급 : 1
Insert Into TBL_Member_Cons_Foreign Values('2', 'ahge4312', '1234', '2'); -- 등급 : 2
Insert Into TBL_Member_Cons_Foreign Values('3', 'uyrm1246', '1234', '3'); -- 등급 : 3
Insert Into TBL_Member_Cons_Foreign Values('4', 'sjtr2461', '1234', '4'); -- 등급 : 4 -> TBL_Grade에 4번 없음
Insert Into TBL_Member_Cons_Foreign Values('5', 'sjrt5212', '1234', null);

Select A.*,
        (Select Grade_Name From TBL_Grade Z Where Z.Grade_Code = A.Member_Grade) Grade_Name
    From TBL_Member_Cons_Foreign A;
    
Update TBL_Member_Cons_Foreign 
        Set Member_Grade = '6' -- 등급
    Where Member_NO = '5';

/*
    TBL_Grade (등급 관리 테이블)   -> 부모. 참조되는 테이블
    TBL_Member_Cons_Foreign (회원 관리 테이블) -> 자식. 참조하는 테이블
*/
Select * From TBL_Grade;    -- 부모테이블

Delete From TBL_Grade
        Where Grade_Code = '2'; -- 부모 테이블의 참조되는 데이터를 삭제할시 오류 발생
        
Delete From TBL_Grade
        Where Grade_Code = '4'; -- 부모 테이블의 외래키 값을 참조하고 있는 행이 존재하지 않을 때는 삭제가 가능

Select * From TBL_Member_Cons_Foreign; -- 자식테이블

/*
    자식 테이블의 외래키 지정 시 삭제 옵션 지정
    
    삭제 옵션 : 부모 테이블에 참조하고 있는 데이터가 삭제될 때 자식 테이블의 데이터를 어떻게 처리할건지
        - On Delete Restricted (기본값) : 삭제 제한 옵션으로 자식 데이터로 사용되는 부모 데이터는 삭제가 되지 않음
        - On Delete Set Null : 부모 데이터 삭제 시 해당 데이터를 사용하고 있는 자식 데이터의 값을 Null로 변경
        - On Delete Cascade : 부모 데이터 삭제 시 해당 데이터를 사용하고 있는 자식 데이터의 값도 같이 삭제
*/

-- 회원 정보 테이블 (On Delete Set Null)
Create Table TBL_Member_Cons_Foreign_Null(
    Member_NO VarChar2(20) Primary Key,
    Member_ID VarChar2(20) Unique,
    Member_PW VarChar2(20) Not Null,
    Member_Grade VarChar2(20),
    Foreign Key(Member_Grade) References TBL_Grade(Grade_Code) On Delete Set Null
    );
    
Select * From TBL_Member_Cons_Foreign_Null;

Insert Into TBL_Member_Cons_Foreign_Null Values('1', 'qwer1234', '1234', '1');
Insert Into TBL_Member_Cons_Foreign_Null Values('2', 'tshre43624', '1234', '2');
Insert Into TBL_Member_Cons_Foreign_Null Values('3', 'nyet5243', '1234', '3');

Delete From TBL_Grade Where Grade_Code = '2';
commit;
Delete From TBL_Member_Cons_Foreign_Null; -- 기존 회원등급 2번 -> Null로 변경

-- 회원 정보 테이블 (On Delete Cascade)
Create Table TBL_Member_Cons_Foreign_Cade(
    Member_NO VarChar2(20) Primary Key,
    Member_ID VarChar2(20) Unique,
    Member_PW VarChar2(20) Not Null,
    Member_Grade VarChar2(20),
    Foreign Key(Member_Grade) References TBL_Grade(Grade_Code) On Delete Cascade
    );

Insert Into TBL_Member_Cons_Foreign_Cade Values('1', 'qwer1234', '1234', '1');
Insert Into TBL_Member_Cons_Foreign_Cade Values('2', 'tshre43624', '1234', '2');
Insert Into TBL_Member_Cons_Foreign_Cade Values('3', 'nyet5243', '1234', '3'); 

Delete From TBL_Grade
    Where Grade_Code = '3';
--부모 테이블의 Grade_Code = '3' 삭제하여 아래 Member_Grade 가 '3'인 자식 데이터도 함께 삭제되었음
-- 즉 아래 SQL은 조회 결과가 존재하지 않음
Select Member_ID 회원아이디, Member_Grade 회원등급 From TBL_Member_Cons_Foreign_Cade;

/*
    Default : 컬럼에 대한 값을 지정하지 않을 경우 삽입될 기본값을 설정
    
        - Default는 제약조건이 아닌 단순히 테이블 생성시 하나의 옵션
*/
-- 회원 정보를 관리하는 테이블을 생성
Create Table TBL_Member_Default2(
        Member_NO Number,
        Member_ID VarChar2(30),
        Member_PW VarChar2(30),
        Member_Name VarChar2(30),
        Member_Hobby VarChar2(30) Default '숨쉬기'
    );

Insert Into TBL_Member_Default2 Values('1', 'qwer1234', '14', '조용운', '게임');
Insert Into TBL_Member_Default2 Values('2', 'tsh4324', '14', '카리나', '유튜브');
Insert Into TBL_Member_Default2 Values('3', 'nyet5243', '14', '안유진', '밥먹기');
Insert Into TBL_Member_Default2 Values('4', 'nyet55498', '14', '강호동', Default);

Insert Into TBL_Member_Default2(Member_NO, Member_ID, Member_PW,Member_Name)
            Values('5', 'qwer4363', '14', '하정우');
Insert Into TBL_Member_Default2(Member_NO, Member_ID, Member_PW)
            Values('5', 'qwer4363', '14');

Select * From TBL_Member_Default2;
---------------------------------------------------------------------------------------------

Select * From TBL_Member_Cons_Foreign;

Insert Into TBL_Member_Cons_Foreign Values ('1', 'yqre3154', '1234', '1');
Insert Into TBL_Member_Cons_Foreign Values ('2', 'hrea5433', '1234', '1');
Insert Into TBL_Member_Cons_Foreign Values ('3', 'ketd512', '1234', '1');

-- 데이터는 복사하지 않고 테이블의 구조만 복사할 때 사용
/*    Create Table TBL_Member_Cons_Foreign_Copy AS
            Select * From TBL_Member_Cons_Foreign
            Where 1=0;  
테이블 구조는 복사되었지만 제약조건은 Not Null을 제외하고 복사되지 않음
Select * From TBL_Member_Cons_Foreign_Copy; */


