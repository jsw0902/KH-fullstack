/*
    DDL : 데이터 정의 언어
    Create : 데이터 객체를 정의하는 언어
    Alter : 데이터 객체의 구조를 변경하는 언어
    Drop : 데이터 객체를 삭제하는 언어
*/
/*
    <Alter>
    [표현식]
    Alter Table 테이블명 변경내용;
        1-1) 컬럼 추가       
*/

-- 1-1) 컬럼 추가
-- Admin 계정으로 Select 권한 추가
-- DDL_Test 계정에게 KH 계정의 Department 테이블을 Select 할 수 있는 권한을 부여
Grant Select On KH.Department To DDL_Test;

Create Table TBL_DEPT_Copy As
    Select * From KH.Department;
--Select * From KH.Employee;    ->  Department에만 권한을 주고 Employee에는 안줬음

Select * From TBL_DEPT_Copy;
/*
    1-1) 컬럼 추가
    
    Alter Table 테이블명 Add 컬럼명 자료형 [Default 기본값]제약조건
*/
-- TBL_DEPT_Copy에 CName 이라는 컬럼 추가 자료형은 VarChar2(20)
Alter Table TBL_DEPT_Copy Add Cname VarChar2(20);
-- 여러개의 컬럼 추가 시 소괄호로 묶어주어야 함
Alter Table TBL_DEPT_Copy Add (Cname1 VarChar2(20), CName2 VarChar2(20));
-- Not Null 제약조건을 가진 컬럼을 추가
-- 기존에 존재하는 행에 Null을 추가하려고 하니 오류 발생
Alter Table TBL_DEPT_Copy Add Cname3 VarChar2(20) Not Null;
Select * From TBL_DEPT_Copy;

Create Table TBL_DEPT_Copy_NN As
    Select * From KH.Department WHere 1=0;
    
Select * From TBL_DEPT_Copy_NN;

-- 내부 데이터가 존재하지 않으니 Not Null 제약조건을 가진 컬럼 추가가 가능하다
Alter Table TBL_DEPT_Copy_NN Add Cname VarChar2(20) Not Null;
-- Default 값 지정
Alter Table TBL_DEPT_Copy_NN Add Cname1 VarChar2(20) Default '테스트';
/*
    1-1) 컬럼 수정
    
    Alter Table 테이블명 Modify 컬럼명 변경할자료형
    Alter Table 테이블명 Modify 컬럼명 Default 변경할기본값
*/
Alter Table TBL_DEPT_Copy Modify DEPT_ID Char(3);
Alter Table TBL_DEPT_Copy Modify DEPT_ID Number; -- 기존 데이터가 Number로 형변환 할 수 없으므로 오류
Alter Table TBL_DEPT_Copy Modify DEPT_ID Char(2); -- 현재 내부 데이터 두 글자(2Byte) + 공백(1Byte) = 3Byte를 
                                                  -- 2Byte로 변경하려해서 오류발생

Insert Into TBL_DEPT_Copy_NN (DePT_ID, DEPT_TITLE, Location_ID, Cname)
            Values('D1', '경영기획부', 'L1', '이름1');
Insert Into TBL_DEPT_Copy_NN (DePT_ID, DEPT_TITLE, Location_ID, Cname)
            Values('D2', '대외사업부', 'L2', '이름2');
Insert Into TBL_DEPT_Copy_NN (DePT_ID, DEPT_TITLE, Location_ID, Cname)
            Values('D3', '마케팅부', 'L3', '이름3');

Alter Table TBL_DEPT_Copy_NN Modify Cname1 Default '기본값변경';
Insert Into TBL_DEPT_Copy_NN (DePT_ID, DEPT_TITLE, Location_ID, Cname)
            Values('D4', '총무부', 'L2', '이름4');

-- Alter 이전의 기본값은 유지됨. 변경 후 삽입한 데이터에 대해서만 기본값이 다르게 삽입됨            
Select * From TBL_DEPT_Copy_NN;

/*
    컬럼 삭제
    Alter Table Drop Column 컬럼명
*/
Select * From TBL_DEPT_Copy_NN;

Alter Table TBL_DEPT_Copy_NN Drop Column Cname; -- TBL_DEPT_Copy_NN 테이블에서 Cname 컬럼 삭제

Select * From TBL_Grade;
Select * From TBL_Member_Cons_Foreign;

-- 부모 테이블의 참조되는 컬럼을 삭제하려고 함.
-- 참조되는 컬럼 삭제와 동시에 자식 테이블간의 외래키 참조 관계도 제거
-- 좌측 테이블 리스트 클릭 -> 제약조건 Tab에서 참조 관계가 끊어진 것을 확인할 수 있음
Alter Table TBL_Grade Drop Column Grade_Code Cascade Constraints;

Select * From TBL_DEPT_Copy_NN;

Alter Table TBL_DEPT_Copy_NN Drop Column Cname1;
Alter Table TBL_DEPT_Copy_NN Drop Column Location_ID;
Alter Table TBL_DEPT_Copy_NN Drop Column DEPT_Title;
Alter Table TBL_DEPT_Copy_NN Drop Column DEPT_ID; -- 테이블에 최소 1개의 컬럼은 존재해야 한다
----------------------------------------------------------------------------------------------------------
/*
    2-1 ) 제약조건 추가
    [표현식]
    Alter Table Add Constraint [제약조건명] 제약조건(컬럼)
*/
Select * From TBL_DEPT_Copy;

-- DEPT_Title 컬럼에 Unique 제약조건 추가 제약조건 이름은 Title_UNQ
Alter Table TBL_DEPT_Copy Add Constraint Title_UNQ Unique(DEPT_Title);
-- DEPT_Title 컬럼에 Primary Key 제약조건 추가 제약조건 이름은 ID_PRI
Alter Table TBL_DEPT_Copy Add Constraint ID_PRI Primary Key(DEPT_ID);
-- TBL_DEPT_Copy_NN.DEPT_ID 컬럼이 TBL_DEPT_Copy_NN.DEPT_ID 컬럼을 참조할 수 있도록 외래키 제약조건 추가
Alter Table TBL_DEPT_Copy_NN Add Foreign Key(DEPT_ID) references TBL_DEPT_Copy(DEPT_ID);
-- TBL_DEPT_Copy 테이블의 Location_ID 컬럼의 Not Null 제약 조건을 -> Null 허용으로 변경
Alter Table TBL_DEPT_Copy Modify Location_ID Null;-- Add가 아닌 Modify
Alter Table TBL_DEPT_Copy Modify Location_ID Not Null;

Select * From TBL_DEPT_Copy;
Select * From TBL_DEPT_Copy_NN;

/*
    제약조건 삭제
    [표현식]
    Alter Table Drop Constaint 제약조건명;
*/
Select * From TBL_Member_ConsName;

-- TML_Member_ConsName 테이블에 MemID_UNQ(제약조건명)으로 설정된 제약 조건 삭제
Alter Table TML_Member_ConsName Drop Constraint MemID_UNQ;

-- 현재 계정에 속한 테이블 리스트와 제약조건 리스트(이름, 타입)를 확인할 수 있는 시스템
Select UC.Table_Name, UC.Constraint_Name, UC.Constrainy_Type, UCC.Column_Name, UC.Search_Condition
                From User_Constraints UC 
                Join User_Cons_Columns UCC
                        On (UC.Constraint_Name = UCC.Constraint_Name)
                        Where UC.Table_Name = 'TBL_Member_ConsName'
                        Order By 1;
                        
--------------------------------------------------------------------------------------------------------
/*
    3) 컬럼명  /   제약조건명   /   테이블명 변경
    컬럼명 : Alter Table 테이블명 Rename Column 기존컬럼명 To 바꿀컬럼명;
    테이블명 : Alter Table 기존테이블명 Rename To 바꿀테이블명;
    제약조건명 : Alter Table 테이블명 Rename Constraint 기존제약조건명 To 바꿀제약조건명;
*/

Select * From TBL_Member_ConsName;

-- Member_Name 컬럼명을 Member_ReName으로 변경
Alter Table TBL_Member_ConsName Rename Column Member_Name to Member_ReName;

-- TBL_Member_Name 테이블 명칭을 TBL_Member_Re_ConsName으로 변경
Alter Table TBL_Member_ConsName Rename to Member_Re_ConsName;

Select * From TBL_Member_ConsName; -- 테이블 명을 바꿔서 오류 발생
Select * From TBL_Member_Re_ConsName;

Select UC.Table_Name, UC.Constraint_Name, UC.Constrainy_Type, UCC.Column_Name, UC.Search_Condition
                From User_Constraints UC 
                Join User_Cons_Columns UCC
                        On (UC.Constraint_Name = UCC.Constraint_Name)
                        Where UC.Table_Name = 'TBL_Member_Re_ConsName'
                        Order By 1;
                        
-- 제약조건 이름 MemName_NN -> MemReName_NN
Alter Table TBL_Member_Re_ConsName Rename Constraint Member_NN To MemReName_NN;

-----------------------------------------------------------------------------------------------------------
/*
    <Drop>
    
    객체를 삭제하는 구문
*/
-- 부모테이블
Create Table TBL_Test01 (
            User_ID VarChar2(20) Primary Key,
            User_PW VarChar2(20) Not Null,
            User_Name VarChar2(20) Not Null
        );
      
-- 자식테이블  
Create Table TBL_Test_REF (
        Card_NO Number Primary Key,
        Product_Name VarChar2(20) Not Null,
        Buyer VarChar(20) References TBL_Test01(User_ID)
         );
         
Insert Into TBL_Test01 Values ('Test01', '1234', 'Name1');
Insert Into TBL_Test01 Values ('Test02', '1234', 'Name2');
Insert Into TBL_Test01 Values ('Test03', '1234', 'Name3');

Insert Into TBL_Test_REF Values (1, 'PrName1', 'Test01');
Insert Into TBL_Test_REF Values (2, 'PrName2', 'Test02');
Insert Into TBL_Test_REF Values (3, 'PrName3', 'Test03');

Select * From TBL_Test01;
Select * From TBL_Test_REF;

Drop Table TBL_Test_REF; -- 자식 테이블 삭제(먼저 삭제)
Drop Table TBL_Test01;  -- 부모 테이블 삭제(자식 테이블 삭제 후 삭제)

-- 테이블 재생성

Drop Table TBL_Test01;-- 부모 테이블 삭제(참조하고 있는 테이블이 존재하므로 삭제 불가)
Drop Table TBL_Test01 Cascade Constraint;-- 부모 테이블을 삭제하면서 참조하고 있는 자식 테이블들 간의 외래키 제약 조건을 해제한다

Select * From TBL_Test01;
Select * From TBL_Test_REF;-- 참조 관계가 해제되었을 뿐 자식 테이블은 여전히 존재

/*
    부모테이블 삭제 방법
        1) 참조하고 있는 자식테이블 삭제 후 부모 테이블 삭제
        2) 부모 테이블 삭제시 참조 제약조건(외래키)을 해제
*/
-- Test_01 User 생성
Create User Test_01 Identified By 1234;
-- Test_01 User에게 권한 부여
Grant Connect, Resource To Test_01;
-- Test_01 User 삭제
Drop User Test_01;

Create User Test_02 Identified By 1234;
Grant Connect, Resource To Test_02;
-- 여기까지 진행하고 Test_02로 접속
Drop User Test_02; -- 접속 후 삭제 시도 시 오류 발생. 접속 해제 후 삭제해야함

