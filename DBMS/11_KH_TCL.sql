/*
    TCL : Transaction Control Language
            트랜젝션 제어 언어
    트랜젝션
        - 한번에 수행되어야 하는 일련의 작업들을 의미
        - Insert, Update, Delete들을 하나의 작업으로 묶어서 처리
        
    TCL의 종류
        - Commit    : 트랜젝션 종료 처리 후 최종 반영
        - Rollback  : 트랜젝션 취소 (마지막 커밋 시점으로 되돌아감)
        - SavePoint : 임시 저장의 개념 (복구할 시점을 지정하는 개념. 일부만 Rollback 가능)
*/
Create Table User_TBL(
        User_ID VarChar2(20) Primary Key,
        User_PW VarChar2(20) Not Null,
        User_Name VarChar2(20) Not NULL
    );
    
Create Table DEL_User(
        User_ID VarChar2(20) Primary Key,
        DEL_Date date
    );

Insert Into User_TBL Values('User1', '123', '유저1');
Insert Into User_TBL Values('User2', '123', '유저2');
Insert Into User_TBL Values('User3', '123', '유저3');
Insert Into User_TBL Values('User4', '123', '유저4');
Insert Into User_TBL Values('User5', '123', '유저5');

Commit; -- 위 5개의 Insert문을 최종 반영

Delete From User_TBL Where User_ID = 'User3';
Delete From User_TBL Where User_ID = 'User4';

Insert Into DEL_User Values('User1',Sysdate);

Select * From User_TBL;
Rollback; -- User03과 User04가 다시 생성된 것이 아닌 마지막 Commit 시점으로 되돌아가는 것

Delete From User_TBL Where User_ID = 'User4';
Commit;
Rollback;
Select * From User_TBL; -- 이전 라인의 Commit으로 최종반영이 되어서 Rollback을 수행해도 User4는 복구되지 않음
-----------------------------------------------------------------------------------------------------------
Delete From User_TBL Where User_ID = 'User5';

Commit;

-- 삭제된 유저 정보를 DEL_User에 삽입
Insert Into DEL_User Values ('user5', SysDatA);-- 삽입도중 오류 발생

Rollback; -- 오류 발생하여 RollBack을 진행히도 User05는 이미 삭제된 상태. 마지막 커밋 시점이 삭제된 이후임
-----------------------------------------------------------------------------------------------------------
/*
    SavePoint
        - 임시 저장의 개념 Rollback
        
    [표현법]
    SavePoint 이름;  -> 명령어를 수행하는 시점에 대해서 '이름'을 지정하는 것
*/
Select * From User_TBL;

Delete From User_TBL Where User_ID = 'User3';

SavePoint sp1; -- User3이 삭제된 이후 시점을 sp1 이라는 이름으로 지정

Delete From User_TBL Where User_ID = 'User2';

-- Rollback 수행 시 SavePoint 이름을 지정하지 않으면 마지막 Commit 시점으로 되돌아감
Rollback;
Select * From User_TBL;

-------------------------------------------------------------------------------------------------------------

Delete From User_TBL Where User_ID = 'User3';

SavePoint sp1; -- User3이 삭제된 이후 시점을 sp1 이라는 이름으로 지정

Delete From User_TBL Where User_ID = 'User2';

Rollback To sp1;-- 복구할 시점(SavePoint 이름)을 지정하여 Rollback
Select * From User_TBL;
-------------------------------------------------------------------------------------------------------------
Insert Into User_TBL Values('User3','1234','User3');
Commit;

Select * From User_TBL;

Delete From User_TBL Where User_ID = 'User1';
SavePoint sp1;
    
Delete From User_TBL Where User_ID = 'User2';
SavePoint sp2;

Delete From User_TBL Where User_ID = 'User3';
SavePoint sp3;

Commit;-- 최종 반영과 동시에 저장되어 있는 SavaPoint 전부 삭제

Rollback To sp1; -- 오류발생 -> Commit과 동시에 지정했던 SavePoint가 모두 사라짐
Rollback To sp2;
Rollback To sp3;

Select * From User_TBL;
-------------------------------------------------------------------------------------------------------------
Insert Into User_TBL Values('User1', '123', '유저1');
Insert Into User_TBL Values('User2', '123', '유저2');
Insert Into User_TBL Values('User3', '123', '유저3');
Insert Into User_TBL Values('User4', '123', '유저4');
Insert Into User_TBL Values('User5', '123', '유저5');

Commit;
Select * From User_TBL;

Delete From User_TBL Where User_ID = 'User4';
Delete From User_TBL Where User_ID = 'User5';
-- Commit 진행 안함

Drop Table DEL_User; -- 삭제한 유저 정보를 관리하는 테이블 삭제
Rollback;

Select * From User_TBL; -- 롤백을 진행했으나 진행시 User4와 User5가 조회되지 않음
-- DDL(Drop Table)을 수행하면 수행 이후 자동으로 Commit이 이루어짐
-- 즉 Rollback시 DDL 이후 시점으로 되돌아감(User4와 User5가 삭제된 이후)

