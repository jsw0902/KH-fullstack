/*
    DDL : ������ ���� ���
    Create : ������ ��ü�� �����ϴ� ���
    Alter : ������ ��ü�� ������ �����ϴ� ���
    Drop : ������ ��ü�� �����ϴ� ���
*/
/*
    <Alter>
    [ǥ����]
    Alter Table ���̺�� ���泻��;
        1-1) �÷� �߰�       
*/

-- 1-1) �÷� �߰�
-- Admin �������� Select ���� �߰�
-- DDL_Test �������� KH ������ Department ���̺��� Select �� �� �ִ� ������ �ο�
Grant Select On KH.Department To DDL_Test;

Create Table TBL_DEPT_Copy As
    Select * From KH.Department;
--Select * From KH.Employee;    ->  Department���� ������ �ְ� Employee���� ������

Select * From TBL_DEPT_Copy;
/*
    1-1) �÷� �߰�
    
    Alter Table ���̺�� Add �÷��� �ڷ��� [Default �⺻��]��������
*/
-- TBL_DEPT_Copy�� CName �̶�� �÷� �߰� �ڷ����� VarChar2(20)
Alter Table TBL_DEPT_Copy Add Cname VarChar2(20);
-- �������� �÷� �߰� �� �Ұ�ȣ�� �����־�� ��
Alter Table TBL_DEPT_Copy Add (Cname1 VarChar2(20), CName2 VarChar2(20));
-- Not Null ���������� ���� �÷��� �߰�
-- ������ �����ϴ� �࿡ Null�� �߰��Ϸ��� �ϴ� ���� �߻�
Alter Table TBL_DEPT_Copy Add Cname3 VarChar2(20) Not Null;
Select * From TBL_DEPT_Copy;

Create Table TBL_DEPT_Copy_NN As
    Select * From KH.Department WHere 1=0;
    
Select * From TBL_DEPT_Copy_NN;

-- ���� �����Ͱ� �������� ������ Not Null ���������� ���� �÷� �߰��� �����ϴ�
Alter Table TBL_DEPT_Copy_NN Add Cname VarChar2(20) Not Null;
-- Default �� ����
Alter Table TBL_DEPT_Copy_NN Add Cname1 VarChar2(20) Default '�׽�Ʈ';
/*
    1-1) �÷� ����
    
    Alter Table ���̺�� Modify �÷��� �������ڷ���
    Alter Table ���̺�� Modify �÷��� Default �����ұ⺻��
*/
Alter Table TBL_DEPT_Copy Modify DEPT_ID Char(3);
Alter Table TBL_DEPT_Copy Modify DEPT_ID Number; -- ���� �����Ͱ� Number�� ����ȯ �� �� �����Ƿ� ����
Alter Table TBL_DEPT_Copy Modify DEPT_ID Char(2); -- ���� ���� ������ �� ����(2Byte) + ����(1Byte) = 3Byte�� 
                                                  -- 2Byte�� �����Ϸ��ؼ� �����߻�

Insert Into TBL_DEPT_Copy_NN (DePT_ID, DEPT_TITLE, Location_ID, Cname)
            Values('D1', '�濵��ȹ��', 'L1', '�̸�1');
Insert Into TBL_DEPT_Copy_NN (DePT_ID, DEPT_TITLE, Location_ID, Cname)
            Values('D2', '��ܻ����', 'L2', '�̸�2');
Insert Into TBL_DEPT_Copy_NN (DePT_ID, DEPT_TITLE, Location_ID, Cname)
            Values('D3', '�����ú�', 'L3', '�̸�3');

Alter Table TBL_DEPT_Copy_NN Modify Cname1 Default '�⺻������';
Insert Into TBL_DEPT_Copy_NN (DePT_ID, DEPT_TITLE, Location_ID, Cname)
            Values('D4', '�ѹ���', 'L2', '�̸�4');

-- Alter ������ �⺻���� ������. ���� �� ������ �����Ϳ� ���ؼ��� �⺻���� �ٸ��� ���Ե�            
Select * From TBL_DEPT_Copy_NN;

/*
    �÷� ����
    Alter Table Drop Column �÷���
*/
Select * From TBL_DEPT_Copy_NN;

Alter Table TBL_DEPT_Copy_NN Drop Column Cname; -- TBL_DEPT_Copy_NN ���̺��� Cname �÷� ����

Select * From TBL_Grade;
Select * From TBL_Member_Cons_Foreign;

-- �θ� ���̺��� �����Ǵ� �÷��� �����Ϸ��� ��.
-- �����Ǵ� �÷� ������ ���ÿ� �ڽ� ���̺��� �ܷ�Ű ���� ���赵 ����
-- ���� ���̺� ����Ʈ Ŭ�� -> �������� Tab���� ���� ���谡 ������ ���� Ȯ���� �� ����
Alter Table TBL_Grade Drop Column Grade_Code Cascade Constraints;

Select * From TBL_DEPT_Copy_NN;

Alter Table TBL_DEPT_Copy_NN Drop Column Cname1;
Alter Table TBL_DEPT_Copy_NN Drop Column Location_ID;
Alter Table TBL_DEPT_Copy_NN Drop Column DEPT_Title;
Alter Table TBL_DEPT_Copy_NN Drop Column DEPT_ID; -- ���̺� �ּ� 1���� �÷��� �����ؾ� �Ѵ�
----------------------------------------------------------------------------------------------------------
/*
    2-1 ) �������� �߰�
    [ǥ����]
    Alter Table Add Constraint [�������Ǹ�] ��������(�÷�)
*/
Select * From TBL_DEPT_Copy;

-- DEPT_Title �÷��� Unique �������� �߰� �������� �̸��� Title_UNQ
Alter Table TBL_DEPT_Copy Add Constraint Title_UNQ Unique(DEPT_Title);
-- DEPT_Title �÷��� Primary Key �������� �߰� �������� �̸��� ID_PRI
Alter Table TBL_DEPT_Copy Add Constraint ID_PRI Primary Key(DEPT_ID);
-- TBL_DEPT_Copy_NN.DEPT_ID �÷��� TBL_DEPT_Copy_NN.DEPT_ID �÷��� ������ �� �ֵ��� �ܷ�Ű �������� �߰�
Alter Table TBL_DEPT_Copy_NN Add Foreign Key(DEPT_ID) references TBL_DEPT_Copy(DEPT_ID);
-- TBL_DEPT_Copy ���̺��� Location_ID �÷��� Not Null ���� ������ -> Null ������� ����
Alter Table TBL_DEPT_Copy Modify Location_ID Null;-- Add�� �ƴ� Modify
Alter Table TBL_DEPT_Copy Modify Location_ID Not Null;

Select * From TBL_DEPT_Copy;
Select * From TBL_DEPT_Copy_NN;

/*
    �������� ����
    [ǥ����]
    Alter Table Drop Constaint �������Ǹ�;
*/
Select * From TBL_Member_ConsName;

-- TML_Member_ConsName ���̺� MemID_UNQ(�������Ǹ�)���� ������ ���� ���� ����
Alter Table TML_Member_ConsName Drop Constraint MemID_UNQ;

-- ���� ������ ���� ���̺� ����Ʈ�� �������� ����Ʈ(�̸�, Ÿ��)�� Ȯ���� �� �ִ� �ý���
Select UC.Table_Name, UC.Constraint_Name, UC.Constrainy_Type, UCC.Column_Name, UC.Search_Condition
                From User_Constraints UC 
                Join User_Cons_Columns UCC
                        On (UC.Constraint_Name = UCC.Constraint_Name)
                        Where UC.Table_Name = 'TBL_Member_ConsName'
                        Order By 1;
                        
--------------------------------------------------------------------------------------------------------
/*
    3) �÷���  /   �������Ǹ�   /   ���̺�� ����
    �÷��� : Alter Table ���̺�� Rename Column �����÷��� To �ٲ��÷���;
    ���̺�� : Alter Table �������̺�� Rename To �ٲ����̺��;
    �������Ǹ� : Alter Table ���̺�� Rename Constraint �����������Ǹ� To �ٲ��������Ǹ�;
*/

Select * From TBL_Member_ConsName;

-- Member_Name �÷����� Member_ReName���� ����
Alter Table TBL_Member_ConsName Rename Column Member_Name to Member_ReName;

-- TBL_Member_Name ���̺� ��Ī�� TBL_Member_Re_ConsName���� ����
Alter Table TBL_Member_ConsName Rename to Member_Re_ConsName;

Select * From TBL_Member_ConsName; -- ���̺� ���� �ٲ㼭 ���� �߻�
Select * From TBL_Member_Re_ConsName;

Select UC.Table_Name, UC.Constraint_Name, UC.Constrainy_Type, UCC.Column_Name, UC.Search_Condition
                From User_Constraints UC 
                Join User_Cons_Columns UCC
                        On (UC.Constraint_Name = UCC.Constraint_Name)
                        Where UC.Table_Name = 'TBL_Member_Re_ConsName'
                        Order By 1;
                        
-- �������� �̸� MemName_NN -> MemReName_NN
Alter Table TBL_Member_Re_ConsName Rename Constraint Member_NN To MemReName_NN;

-----------------------------------------------------------------------------------------------------------
/*
    <Drop>
    
    ��ü�� �����ϴ� ����
*/
-- �θ����̺�
Create Table TBL_Test01 (
            User_ID VarChar2(20) Primary Key,
            User_PW VarChar2(20) Not Null,
            User_Name VarChar2(20) Not Null
        );
      
-- �ڽ����̺�  
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

Drop Table TBL_Test_REF; -- �ڽ� ���̺� ����(���� ����)
Drop Table TBL_Test01;  -- �θ� ���̺� ����(�ڽ� ���̺� ���� �� ����)

-- ���̺� �����

Drop Table TBL_Test01;-- �θ� ���̺� ����(�����ϰ� �ִ� ���̺��� �����ϹǷ� ���� �Ұ�)
Drop Table TBL_Test01 Cascade Constraint;-- �θ� ���̺��� �����ϸ鼭 �����ϰ� �ִ� �ڽ� ���̺�� ���� �ܷ�Ű ���� ������ �����Ѵ�

Select * From TBL_Test01;
Select * From TBL_Test_REF;-- ���� ���谡 �����Ǿ��� �� �ڽ� ���̺��� ������ ����

/*
    �θ����̺� ���� ���
        1) �����ϰ� �ִ� �ڽ����̺� ���� �� �θ� ���̺� ����
        2) �θ� ���̺� ������ ���� ��������(�ܷ�Ű)�� ����
*/
-- Test_01 User ����
Create User Test_01 Identified By 1234;
-- Test_01 User���� ���� �ο�
Grant Connect, Resource To Test_01;
-- Test_01 User ����
Drop User Test_01;

Create User Test_02 Identified By 1234;
Grant Connect, Resource To Test_02;
-- ������� �����ϰ� Test_02�� ����
Drop User Test_02; -- ���� �� ���� �õ� �� ���� �߻�. ���� ���� �� �����ؾ���

