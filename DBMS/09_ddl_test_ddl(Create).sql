/*
    DDL : ������ ���� ���
        - ����Ŭ���� �����ϴ� ��ü(Object)�� ���Ӱ� �����(Create) ����(AlTER)�� �����ϰ�
          ���� ��ü�� ����(DROP)�ϴ� ����
          
    ����Ŭ ��ü�� ����
    - Table     - User       - View       - Sequence
    - Index     - Procedure  - Trigger    - Function...
*/
/*
    <Create>
    ��ü�� �����ϴ� ����
    
    < ���̺� >
    ��� ���� �̷���� ��ü
    [ǥ����]
    Create Table ���̺��(
        �÷��� �ڷ���(ũ��),
        �÷��� �ڷ���(ũ��),
        �÷��� �ڷ���(ũ��),
        �÷��� �ڷ���(ũ��)
        );
*/
-- ȸ�� ������ �����ϴ� ���̺��� ����
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
    
-- ������ ��ųʸ� : �پ��� ��ü���� ������ �����ϰ� �ִ� �ý��� ���̺�'s
Select * From User_Tables; -- ���� ������ ������ �ִ� ���̺�鿡 ���� ����
Select * From User_Tab_Columns;-- ���� ������ ������ �ִ� ���̺�鿡 ���� ������ �÷� ������ ��ȸ

-------------------------------------------------------------------------------------------------------
/*
    �÷��� �ּ�(�ڸ�Ʈ �ޱ�)
    [ǥ����]
    
    Comment On Column ���̺��.�÷��� Is '����';
*/
Comment On Column TBL_Member.Member_NO Is 'ȸ����ȣ';
Comment On Column TBL_Member.Member_ID Is 'ȸ��ID';
Comment On Column TBL_Member.Member_Pw Is 'ȸ����й�ȣ';
Comment On Column TBL_Member.Member_Name Is 'ȸ���̸�';
Comment On Column TBL_Member.Member_Gender Is 'ȸ������';
Comment On Column TBL_Member.Member_Phone Is '��ȭ��ȣ';
Comment On Column TBL_Member.EMAIL Is '�̸���';
Comment On Column TBL_Member.ENT_Date Is '������';
-- ��Ÿ �߻��� ���ۼ� ����

Insert Into TBL_Member
    Values (1, 'jsw0902', '1234', '��¿�', '��', '010-1234-5678', 'jsw0902@naver.com', Sysdate);

Insert Into TBL_Member
    Values (1, null, '1234', '��¿�', '��', null, 'jsw09021@naver.com', null);
-- ��ȿ���� ���� �����Ͱ� ���ӵǰ� ����. �����ؾ� Row�� �߰��Ǵµ� ID�� ������ �����Ͱ� null�� ���

Select * From TBL_Member;

/*
    �������� Constraint
        - �÷��� ��ȿ�� ������ ���� �����ϱ� ���ؼ� Ư�� �÷��� ���� �����ϴ� ���� ����
        - ������ ���Ἲ ������ �������� ��(������ ����)
        
    ���������� ����
        - Not Null, Unique, Check, Primary Key, Foreign Key 
        
    �������� �ο� ���
        1) �÷� ���� ���
        2) ���̺� ���� ���
*/
/*
    Not Null 
        - �ش� �÷��� �ݵ�� ���� �����ؾ��ϴ� ��츦 ������ �� �ִ�(Null�� ������� ����
        - ����(Insert), ����(Update)�ÿ���  Null ���� ������� ����
        - �÷� ���� ������θ� ���� ���� ���� ����
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
        Values(1, 'jsw0902', '1234', '��¿�1', '��', '010-1234-4567', 'jsw09021@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_NotNull -- Phone�� null������ ���
        Values(2, 'jsw020902', '4567', '��¿�2', '��', null, 'jsw09022@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_NotNull -- Pw�� Not Null ���������� �����Ǿ����� -> �����߻�
        Values(3, 'jsw090202', null, '��¿�3', '��', '010-3456-7698', 'jsw09023@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_NotNull
        Values(4, 'jsw09023', '1234', '��¿�4', '��', '010-4732-7542', 'jsw09024@naver.com', Sysdate); 

Select * From TBL_Member_Cons_NotNull;

/*
    Unique
        - �ش� �÷��� ���� �ߺ��� ���� ���� �ȵǴ� ��� ����
        - ���� / ���� �� ������ �����ϴ� �������� �� �� �ߺ��� ���� ���� ��� ���� �߻�
*/
Create Table TBL_Member_Cons_Unique1(
        Member_NO Number Not Null,
        Member_ID VarChar2(30) Not Null Unique, -- �÷� ���� ���
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
        Unique(Member_ID) -- ���̺� ���� ���
    );    
    
Insert Into TBL_Member_Cons_Unique1 Values
    (1, 'jsw0902', '1234', '��¿�', '��', '010-4859-1564', 'jsw0902@naver.com', Sysdate);
Insert Into TBL_Member_Cons_Unique1 Values
    (2, 'jsw0902', '1234', '��¿�', '��', '010-4859-1564', 'jsw0902@naver.com', Sysdate);
/*
    ���������� �̸� �����ϱ�
    [ǥ����]
    1) �÷� ���� ���
       Create Table ���̺��(
        �÷��� �ڷ��� [Constraint �������Ǹ�] ��������, 
        �÷��� �ڷ��� [Constraint �������Ǹ�] ��������, 
        �÷��� �ڷ��� [Constraint �������Ǹ�] ��������
       );
       
    2) ���̺� ���� ���
        Create Table ���̺��(
            �÷��� �ڷ���,
            �÷��� �ڷ���,
            �÷��� �ڷ���,
            [Constraint �������Ǹ�] ��������(�÷���)
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
        Constraint MEMID_UNQ Unique(Member_ID) -- ���̺� ���� ���
    );  
    
Insert Into TBL_Member_ConsName Values
    (1,'qwer1234', '1234', '�����', '��', '010-4859-1564', 'qwre1234@naver.com', Sysdate);
Insert Into TBL_Member_ConsName Values
    (2,'qwer1234', null, '�����', '��', '010-4859-1564', 'qwre1234@naver.com', Sysdate);

-- �����߻� ��ũ��Ʈ�� ������ �������Ǹ�Ī�� ��µǹǷ� ��� �÷����� ���������� ����ƴ��� Ȯ�� ����
Insert Into TBL_Member_ConsName Values
    (1,'qwer1234', '1234', '�����', '��', '010-4859-1564', 'qwre1234@naver.com', Sysdate);
    
Insert Into TBL_Member_ConsName Values
    (3,'qwer1532', '1234', '�����', '��', '010-5271-3462', 'qwre1522@naver.com', Sysdate);

/*
    Check
        - �÷��� ���Ե� �� �ִ� ���� ���� ������ ����
        - Check�� ������ ���� ���� / ������ �� ����
*/

Create Table TBL_Member_Cons_Check(
        Member_NO Number Not Null,
        Member_ID VarChar2(30) Not Null Unique,
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) Check(Member_Gender In ('��', '��')) Not Null , -- �÷� ���� ���
        Member_Phone Char(13),
        EMAIL VarChar2(200) Not Null,
        ENT_Date Date Not Null
        -- Check(Member_Gender In ('��', '��')) <- ���̺� ���� ���
    );

Insert Into TBL_Member_Cons_Check Values
    (1,'qwer1234', '1234', '�����', '��', '010-4859-1564', 'qwer1234@naver.com', Sysdate);    
Insert Into TBL_Member_Cons_Check Values
    (2,'qwer6342', '1234', 'ī����', '��', '010-1234-5678', 'qwer6435@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_Check Values -- Check�� ������ '��' �Ǵ� '��' ���� ���Ե� �� ����
    (2,'qwer6642', '1234', '������', '��', '010-1111-1111', 'qwer6431@naver.com', Sysdate); 

Insert Into TBL_Member_Cons_Check Values
    (3,'qwer57235', '1234', '�����', '��', '010-7632-5462', 'qwer1253@naver.com', Sysdate);   

Select * From TBL_Member_Cons_Check;

/*
    Primary Key(�⺻Ű)
        - ���̺��� �� ��(Row)�� �ĺ��ϱ� ���� ���� �÷��� �ο��ϴ� ��������
        - Primary Key �������� ���� �� Unique�� Not Null ���������� ������
        - �� ���̺�� �ϳ��� Primary Key�� ���� ����
*/

Create Table TBL_Member_Cons_Primary(
        Member_NO Number Primary Key, -- �÷� ���� ���. �ڵ������� Not Null + Unique
        Member_ID VarChar2(30) Not Null Unique, 
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) Check(Member_Gender In ('��', '��')) Not Null ,
        Member_Phone Char(13),
        EMAIL VarChar2(200) Not Null,
        ENT_Date Date Not Null
    );

-- Primary Key�� ������ �÷��� ���� �ߺ��� ���̳� Null�� ������ �ʴ´�
Insert Into TBL_Member_Cons_Primary Values
    (1,'qwer1234', '1234', '�����', '��', '010-4859-1564', 'qwer1234@naver.com', Sysdate);  
Insert Into TBL_Member_Cons_Primary Values
    (2,'qwer6342', '1234', 'ī����', '��', '010-1234-5678', 'qwer6435@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_Primary Values -- Member_NO���� 2�� �ߺ��Ǿ ����
    (2,'qwer6642', '1234', '������', '��', '010-1111-1111', 'qwer6431@naver.com', Sysdate);
Insert Into TBL_Member_Cons_Primary Values
    (3,'qwer6642', '1234', '������', '��', '010-1111-1111', 'qwer6431@naver.com', Sysdate);

Select * From TBL_Member_Cons_Primary;

Create Table TBL_Member_Cons_Primary2(
        Member_NO Number Primary Key, -- �÷� ���� ���. �ڵ������� Not Null + Unique
        Member_ID VarChar2(30) Primary Key, --  Primary Key�� �� ���̺�� �ϳ��� ���� -> �����߻�
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) Check(Member_Gender In ('��', '��')) Not Null ,
        Member_Phone Char(13),
        EMAIL VarChar2(200) Not Null,
        ENT_Date Date Not Null
    );

/*
    ���θ�
    
    ȸ������ - ȸ����ȣ, ȸ�����̵�, ȸ����й�ȣ......
    ��ǰ���� - ��ǰ�ڵ�, ��ǰ��, ����, ���.......
    
    �α��� -> ��ǰ�˻� -> ��ǰ �󼼺��� -> ���ƿ�, ���ϱ�
    
    ���̺� : TBL_Mem_Product_Like
        
        - ��ǰ�ڵ�  (Product_CD)
        - ȸ����ȣ  (Member_NO)
        - ���ƿ� ���� ����   (Like_Date)
    ----------------------------------------------------------------------------
    Product_CD          |           Member_NO               |          Like_Date
    ----------------------------------------------------------------------------
    1) Product_CD�� Primary_Key�� �������� �� (�� �ϳ��� ��ǰ�� ������ �� ����)
        - Insert Into TBL_Product_Like Values('P1', 'MEM1', Sysdate);
        - Insert Into TBL_Product_Like Values('P2', 'MEM1', Sysdate);
        - Insert Into TBL_Product_Like Values('P1', 'MEM1', Sysdate); -> ��ǰ�ڵ� �������� ����
        
    2) Member_NO�� Primary_Key�� �������� �� (�� �Ѹ��� ȸ���� �ϳ��� ��ǰ�� ���ؼ��� ���ƿ並 ���� �� ����)
        - Insert Into TBL_Product_Like Values('P1', 'MEM1', Sysdate);
        - Insert Into TBL_Product_Like Values('P1', 'MEM2', Sysdate);
        - Insert Into TBL_Product_Like Values('P2', 'MEM1', Sysdate); -> �ߺ��� ��� �Ұ��� ȸ����ȣ �������� ����
        
    3) Product_CD�� Member_NO�� ���� Primary_Key�� �������� �� 
        - Insert Into TBL_Product_Like Values('P1', 'MEM1', Sysdate);
        - Insert Into TBL_Product_Like Values('P1', 'MEM2', Sysdate);
        - Insert Into TBL_Product_Like Values('P2', 'MEM1', Sysdate);
        - Insert Into TBL_Product_Like Values('P2', 'MEM2', Sysdate);
        - Insert Into TBL_Product_Like Values('P1', 'MEM1', Sysdate); -> �������� ����
*/      
Create Table TBL_Mem_Product_Like(
    Product_CD VarChar2(20),
    Member_NO VarChar2(20),
    Like_Date Date,
    Primary Key (Product_CD, Member_NO) -- ���� Primary key
    );

Insert Into TBL_Mem_Product_Like Values('P1', 'MEM1', Sysdate);
Insert Into TBL_Mem_Product_Like Values('P1', 'MEM2', Sysdate);
Insert Into TBL_Mem_Product_Like Values('P2', 'MEM1', Sysdate);
Insert Into TBL_Mem_Product_Like Values('P2', 'MEM2', Sysdate);
-- Insert Into TBL_Mem_Product_Like Values('P1', 'MEM1', Sysdate); -> �Ѹ��� ȸ���� ���� ��ǰ�� ���� ���ƿ並 �ѹ��� ���� �� ����

Select * From TBL_Mem_Product_Like;
-----------------------------------------------------------------------------------
-- �л� ������ ������ ���̺�
Create Table TBL_Student_NF(
        Student_ID VarChar2(30) Primary Key,
        Student_PW VarChar2(30) Not Null,
        Student_Name VarChar2(30) Not Null
    );
    
-- �л� ��� ������ ������ ���̺�    
Create Table TBL_Student_Hobby_NF(
        Hobby_Code VarChar2(30) Primary Key,
        Hobby_Name VarChar2(30) Not Null,
        Hobby_ID VarChar2(30) 
    );

Insert Into TBL_Student_NF Values('qwer1234', '1234', '�����');
Insert Into TBL_Student_NF Values('hsrd3532', '1234', 'ī����');
Insert Into TBL_Student_NF Values('jtrs2346', '1234', '����');

Insert Into TBL_Student_Hobby_NF Values('1', '��Ա�', '�����');
Insert Into TBL_Student_Hobby_NF Values('2', '��Ʃ�� ����', 'ī����');
Insert Into TBL_Student_Hobby_NF Values('3', '�����ϱ�', '����');

Select * From TBL_Student_NF;
Select * From TBL_Student_Hobby_NF;

Insert Into TBL_Student_Hobby_NF Values('4', '���ڱ�', '���ð�');
------------------------------------------------------------------------------------
-- �л� ���� ���̺�        :   ���� ���ϴ�(�Ǵ�) ���̺�
-- �л� ��� ���� ���̺�   :  ���� �ϴ� ���̺�
/*
    �ܷ�Ű (Foreign Key) ���� ����
        - ���� �ϴ� ���̺��� �÷����� �����Ǵ� ���̺��� �÷������� �����ؾ� ��
*/
Create Table TBL_Grade (
        Grade_Code VarChar2(20) Primary Key,
        Grade_Name VarChar2(20) Not Null
    );

Insert Into TBL_Grade Values ('1', 'VIP');
Insert Into TBL_Grade Values ('2', 'Gold');
Insert Into TBL_Grade Values ('3', 'Silver');

-- ȸ�� ���� ���̺�
Create Table TBL_Member_Cons_Foreign(
    Member_NO VarChar2(20) Primary Key,
    Member_ID VarChar2(20) Unique,
    Member_PW VarChar2(20) Not Null,
    Member_Grade VarChar2(20) References TBL_Grade(Grade_Code) -- �÷� ���� ��� (������ �÷� ���� ������ �� TBL_Grade�� �⺻Ű�� ����)
    /*
    ���̺� ���� ������� �ܷ�Ű ����
    Foreign Key(Member_Grade) References TBL_Grade(Grade_Code)
    */
    );
    
Select * From TBL_Grade;
Select * From TBL_Member_Cons_Foreign;
    
Insert Into TBL_Member_Cons_Foreign Values('1', 'qwer1234', '1234', '1'); -- ��� : 1
Insert Into TBL_Member_Cons_Foreign Values('2', 'ahge4312', '1234', '2'); -- ��� : 2
Insert Into TBL_Member_Cons_Foreign Values('3', 'uyrm1246', '1234', '3'); -- ��� : 3
Insert Into TBL_Member_Cons_Foreign Values('4', 'sjtr2461', '1234', '4'); -- ��� : 4 -> TBL_Grade�� 4�� ����
Insert Into TBL_Member_Cons_Foreign Values('5', 'sjrt5212', '1234', null);

Select A.*,
        (Select Grade_Name From TBL_Grade Z Where Z.Grade_Code = A.Member_Grade) Grade_Name
    From TBL_Member_Cons_Foreign A;
    
Update TBL_Member_Cons_Foreign 
        Set Member_Grade = '6' -- ���
    Where Member_NO = '5';

/*
    TBL_Grade (��� ���� ���̺�)   -> �θ�. �����Ǵ� ���̺�
    TBL_Member_Cons_Foreign (ȸ�� ���� ���̺�) -> �ڽ�. �����ϴ� ���̺�
*/
Select * From TBL_Grade;    -- �θ����̺�

Delete From TBL_Grade
        Where Grade_Code = '2'; -- �θ� ���̺��� �����Ǵ� �����͸� �����ҽ� ���� �߻�
        
Delete From TBL_Grade
        Where Grade_Code = '4'; -- �θ� ���̺��� �ܷ�Ű ���� �����ϰ� �ִ� ���� �������� ���� ���� ������ ����

Select * From TBL_Member_Cons_Foreign; -- �ڽ����̺�

/*
    �ڽ� ���̺��� �ܷ�Ű ���� �� ���� �ɼ� ����
    
    ���� �ɼ� : �θ� ���̺� �����ϰ� �ִ� �����Ͱ� ������ �� �ڽ� ���̺��� �����͸� ��� ó���Ұ���
        - On Delete Restricted (�⺻��) : ���� ���� �ɼ����� �ڽ� �����ͷ� ���Ǵ� �θ� �����ʹ� ������ ���� ����
        - On Delete Set Null : �θ� ������ ���� �� �ش� �����͸� ����ϰ� �ִ� �ڽ� �������� ���� Null�� ����
        - On Delete Cascade : �θ� ������ ���� �� �ش� �����͸� ����ϰ� �ִ� �ڽ� �������� ���� ���� ����
*/

-- ȸ�� ���� ���̺� (On Delete Set Null)
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
Delete From TBL_Member_Cons_Foreign_Null; -- ���� ȸ����� 2�� -> Null�� ����

-- ȸ�� ���� ���̺� (On Delete Cascade)
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
--�θ� ���̺��� Grade_Code = '3' �����Ͽ� �Ʒ� Member_Grade �� '3'�� �ڽ� �����͵� �Բ� �����Ǿ���
-- �� �Ʒ� SQL�� ��ȸ ����� �������� ����
Select Member_ID ȸ�����̵�, Member_Grade ȸ����� From TBL_Member_Cons_Foreign_Cade;

/*
    Default : �÷��� ���� ���� �������� ���� ��� ���Ե� �⺻���� ����
    
        - Default�� ���������� �ƴ� �ܼ��� ���̺� ������ �ϳ��� �ɼ�
*/
-- ȸ�� ������ �����ϴ� ���̺��� ����
Create Table TBL_Member_Default2(
        Member_NO Number,
        Member_ID VarChar2(30),
        Member_PW VarChar2(30),
        Member_Name VarChar2(30),
        Member_Hobby VarChar2(30) Default '������'
    );

Insert Into TBL_Member_Default2 Values('1', 'qwer1234', '14', '�����', '����');
Insert Into TBL_Member_Default2 Values('2', 'tsh4324', '14', 'ī����', '��Ʃ��');
Insert Into TBL_Member_Default2 Values('3', 'nyet5243', '14', '������', '��Ա�');
Insert Into TBL_Member_Default2 Values('4', 'nyet55498', '14', '��ȣ��', Default);

Insert Into TBL_Member_Default2(Member_NO, Member_ID, Member_PW,Member_Name)
            Values('5', 'qwer4363', '14', '������');
Insert Into TBL_Member_Default2(Member_NO, Member_ID, Member_PW)
            Values('5', 'qwer4363', '14');

Select * From TBL_Member_Default2;
---------------------------------------------------------------------------------------------

Select * From TBL_Member_Cons_Foreign;

Insert Into TBL_Member_Cons_Foreign Values ('1', 'yqre3154', '1234', '1');
Insert Into TBL_Member_Cons_Foreign Values ('2', 'hrea5433', '1234', '1');
Insert Into TBL_Member_Cons_Foreign Values ('3', 'ketd512', '1234', '1');

-- �����ʹ� �������� �ʰ� ���̺��� ������ ������ �� ���
/*    Create Table TBL_Member_Cons_Foreign_Copy AS
            Select * From TBL_Member_Cons_Foreign
            Where 1=0;  
���̺� ������ ����Ǿ����� ���������� Not Null�� �����ϰ� ������� ����
Select * From TBL_Member_Cons_Foreign_Copy; */


