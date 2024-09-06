/*
    TCL : Transaction Control Language
            Ʈ������ ���� ���
    Ʈ������
        - �ѹ��� ����Ǿ�� �ϴ� �Ϸ��� �۾����� �ǹ�
        - Insert, Update, Delete���� �ϳ��� �۾����� ��� ó��
        
    TCL�� ����
        - Commit    : Ʈ������ ���� ó�� �� ���� �ݿ�
        - Rollback  : Ʈ������ ��� (������ Ŀ�� �������� �ǵ��ư�)
        - SavePoint : �ӽ� ������ ���� (������ ������ �����ϴ� ����. �Ϻθ� Rollback ����)
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

Insert Into User_TBL Values('User1', '123', '����1');
Insert Into User_TBL Values('User2', '123', '����2');
Insert Into User_TBL Values('User3', '123', '����3');
Insert Into User_TBL Values('User4', '123', '����4');
Insert Into User_TBL Values('User5', '123', '����5');

Commit; -- �� 5���� Insert���� ���� �ݿ�

Delete From User_TBL Where User_ID = 'User3';
Delete From User_TBL Where User_ID = 'User4';

Insert Into DEL_User Values('User1',Sysdate);

Select * From User_TBL;
Rollback; -- User03�� User04�� �ٽ� ������ ���� �ƴ� ������ Commit �������� �ǵ��ư��� ��

Delete From User_TBL Where User_ID = 'User4';
Commit;
Rollback;
Select * From User_TBL; -- ���� ������ Commit���� �����ݿ��� �Ǿ Rollback�� �����ص� User4�� �������� ����
-----------------------------------------------------------------------------------------------------------
Delete From User_TBL Where User_ID = 'User5';

Commit;

-- ������ ���� ������ DEL_User�� ����
Insert Into DEL_User Values ('user5', SysDatA);-- ���Ե��� ���� �߻�

Rollback; -- ���� �߻��Ͽ� RollBack�� �������� User05�� �̹� ������ ����. ������ Ŀ�� ������ ������ ������
-----------------------------------------------------------------------------------------------------------
/*
    SavePoint
        - �ӽ� ������ ���� Rollback
        
    [ǥ����]
    SavePoint �̸�;  -> ��ɾ �����ϴ� ������ ���ؼ� '�̸�'�� �����ϴ� ��
*/
Select * From User_TBL;

Delete From User_TBL Where User_ID = 'User3';

SavePoint sp1; -- User3�� ������ ���� ������ sp1 �̶�� �̸����� ����

Delete From User_TBL Where User_ID = 'User2';

-- Rollback ���� �� SavePoint �̸��� �������� ������ ������ Commit �������� �ǵ��ư�
Rollback;
Select * From User_TBL;

-------------------------------------------------------------------------------------------------------------

Delete From User_TBL Where User_ID = 'User3';

SavePoint sp1; -- User3�� ������ ���� ������ sp1 �̶�� �̸����� ����

Delete From User_TBL Where User_ID = 'User2';

Rollback To sp1;-- ������ ����(SavePoint �̸�)�� �����Ͽ� Rollback
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

Commit;-- ���� �ݿ��� ���ÿ� ����Ǿ� �ִ� SavaPoint ���� ����

Rollback To sp1; -- �����߻� -> Commit�� ���ÿ� �����ߴ� SavePoint�� ��� �����
Rollback To sp2;
Rollback To sp3;

Select * From User_TBL;
-------------------------------------------------------------------------------------------------------------
Insert Into User_TBL Values('User1', '123', '����1');
Insert Into User_TBL Values('User2', '123', '����2');
Insert Into User_TBL Values('User3', '123', '����3');
Insert Into User_TBL Values('User4', '123', '����4');
Insert Into User_TBL Values('User5', '123', '����5');

Commit;
Select * From User_TBL;

Delete From User_TBL Where User_ID = 'User4';
Delete From User_TBL Where User_ID = 'User5';
-- Commit ���� ����

Drop Table DEL_User; -- ������ ���� ������ �����ϴ� ���̺� ����
Rollback;

Select * From User_TBL; -- �ѹ��� ���������� ����� User4�� User5�� ��ȸ���� ����
-- DDL(Drop Table)�� �����ϸ� ���� ���� �ڵ����� Commit�� �̷����
-- �� Rollback�� DDL ���� �������� �ǵ��ư�(User4�� User5�� ������ ����)

