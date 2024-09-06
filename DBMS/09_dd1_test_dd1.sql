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
    
DELETE FROM TBL_MEMBER_CONS_UNIQUE2;
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
    Values (1, 'qwer1234', '1234', '��¿�', '��', '010-1234-5678', 'qwer1234@naver.com', Sysdate);

Insert Into TBL_Member
    Values (1, null, '1234', '��¿�', '��', null, 'qwer1234@naver.com', null);
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
        Values(1, 'qwer1234', '1234', '��¿�1', '��', '010-1234-4567', 'qwer1234@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_NotNull -- Phone�� null������ ���
        Values(2, 'qwer4567', '4567', '��¿�2', '��', null, 'qwer4567@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_NotNull -- Pw�� Not Null ���������� �����Ǿ����� -> �����߻�
        Values(3, 'qwer4632', null, '��¿�3', '��', '010-3456-7698', 'qwer7543@naver.com', Sysdate); 
Insert Into TBL_Member_Cons_NotNull
        Values(4, 'qwer7542', '1234', '��¿�4', '��', '010-4732-7542', 'qwer4372@naver.com', Sysdate); 

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
    (1, 'qwer1234', '1234', '�����', '��', '010-4859-1564', 'qwre1234@naver.com', Sysdate);
Insert Into TBL_Member_Cons_Unique1 Values
    (2, 'qwer1234', '1234', '�����', '��', '010-4859-1564', 'qwre1234@naver.com', Sysdate);
    
    
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
        �÷��� �ڷ���(ũ��),
        [CONSTRAINT �������Ǹ�] ��������(�÷���)
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
        CONSTRAINT MEMID_UNQ UNIQUE(Member_ID) -- ���̺� ���� ���
    );    
    
INSERT INTO TBL_MEMBER_CONSNAME VALUES
(1, 'jsw0902', '1234', '��¿�', '��', '010-1111-1111', 'jsw0902@iei.or.kr', SYSDATE);

INSERT INTO TBL_MEMBER_CONSNAME VALUES
(1, 'jsw0902', NULL, '��¿�', '��', '010-1111-1111', 'jsw0902@iei.or.kr', SYSDATE);

-- ���� �߻� ��ũ��Ʈ��, ������ �������� ��Ī�� ��µǹǷ� ��� �÷����� ���������� ����ƴ��� Ȯ�� ����
INSERT INTO TBL_MEMBER_CONSNAME VALUES
(2, 'jsw0902', '1234', '��¿�', '��', '010-1111-1111', 'jsw0902@iei.or.kr', SYSDATE);


INSERT INTO TBL_MEMBER_CONSNAME VALUES
(3, 'jsw0901', '1234', '��¿�', '��', '010-1111-1111', 'jsw0902@iei.or.kr', SYSDATE);

/*
    CHECK 
    - �÷��� ���Ե� �� �ִ� ���� ���� ������ ����.
    - CHECK�� ������ ���� ���� / ������ �� ����.
*/
Create Table TBL_Member_Cons_CHECK(
        Member_NO Number Not Null,
        Member_ID VarChar2(30) Not Null Unique, -- �÷� ���� ���
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) CHECK(MEMBER_GENDER IN ('��','��')) Not Null, -- �÷� ���� ���
        Member_Phone Char(13),
        EMAIL VarChar2(200) Not Null,
        ENT_Date Date Not Null
        -- CHECK(MEMBER_GENDER IN ('��','��')) -- ���̺� ���� ���
    );
    
    
INSERT INTO TBL_MEMBER_CONS_CHECK
VALUES (1, 'jsw0902', '1234', '��¿�', '��', '010-1111-1111', 'jsw0902@iei.or.kr', sysdate);

INSERT INTO TBL_MEMBER_CONS_CHECK
VALUES (2, 'siuu0922', '1234', 'ȣ����', '��', '010-1312-1112', 'siuuu@iei.or.kr', sysdate);

INSERT INTO TBL_MEMBER_CONS_CHECK -- CHECK�� ������ '��' �Ǵ� '��' ���� ���Ե� �� ����.
VALUES (3, 'goat', '1234', '�޽�', '��', '010-1111-1114', 'goat@iei.or.kr', sysdate);
    
INSERT INTO TBL_MEMBER_CONS_CHECK
VALUES (1, 'Hsw0901', '1234', '��¿�', '��', '010-1111-1111', 'jsw0902@iei.or.kr', sysdate);


SELECT * FROM TBL_MEMBER_CONS_CHECK;
/*
    PRIMARY KEY(�⺻Ű)
    
    - ���̺��� �� ��(ROW)�� �ĺ��ϱ� ���� ���� �÷��� �ο��ϴ� ��������
    
    PRIMAERY KEY �������� ���� ��, UNIQUE�� NOT NULL ���������� ������
    
    * �� ���̺�� �ϳ��� PRIMARY KEY�� ���� ����!
*/
Create Table TBL_Member_Cons_PRIMARY(
        Member_NO Number Not Null PRIMARY KEY,
        Member_ID VarChar2(30) Not Null Unique, -- �÷� ���� ���
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) CHECK(MEMBER_GENDER IN ('��','��')) Not Null, -- �÷� ���� ���
        Member_Phone Char(13),
        EMAIL VarChar2(200) Not Null,
        ENT_Date Date Not Null
        -- CHECK(MEMBER_GENDER IN ('��','��')) -- ���̺� ���� ���
    );

Create Table TBL_Member_Cons_PRIMARY2(
        Member_NO Number Not Null PRIMARY KEY,
        Member_ID VarChar2(30) Not Null PRIMARY KEY, -- �� ���̺�� �ϳ��� PRIMARY KEY���� ���� �� �ִ�.
        Member_Pw VarChar2(30) Not Null,
        Member_Name VarChar2(30) Not Null,
        Member_Gender Char(3) CHECK(MEMBER_GENDER IN ('��','��')) Not Null, -- �÷� ���� ���
        Member_Phone Char(13),
        EMAIL VarChar2(200) Not Null,
        ENT_Date Date Not Null
        -- CHECK(MEMBER_GENDER IN ('��','��')) -- ���̺� ���� ���
    );
    
INSERT INTO TBL_MEMBER_CONS_PRIMARY
VALUES (1, 'jsw0902', '1234', '��¿�', '��', '010-1111-1111', 'jsw0902@iei.or.kr', sysdate);

INSERT INTO TBL_MEMBER_CONS_PRIMARY
VALUES (2, 'siuu0922', '1234', 'ȣ����', '��', '010-1312-1112', 'siuuu@iei.or.kr', sysdate);

-- PRIMARY KEY�� ������ �÷��� ���� �ߺ��� ���̳� NULL�� ������ ����
INSERT INTO TBL_MEMBER_CONS_PRIMARY -- CHECK�� ������ '��' �Ǵ� '��' ���� ���Ե� �� ����.
VALUES (2, 'goat', '1234', '�޽�', '��', '010-1111-1114', 'goat@iei.or.kr', sysdate);

SELECT * FROM tbl_member_cons_primary;

/*
    ���ι�
    
    ȸ������ - ȸ����ȣ, ȸ�����̵�, ȸ����й�ȣ.............
    ��ǰ���� - ��ǰ�ڵ�, ��ǰ��, ����, ���..................
    
    �α��� -> ��ǰ �˻� -> ��ǰ �󼼺��� -> ���ƿ�, ���ϱ�
    
    ���̺� : TBL_MEM_PRODUCT_LIKE
    
    - ��ǰ �ڵ� (PRODUCT_CD)
    - ȸ�� ��ȣ (MEMBER_NO)
    - ���ƿ� ���� ���� (LIKE_DATE)
    
    ----------------------------------------------------------------
    PRODUCT_CD      |       MEMBER_NO       |       LIKE_DATE
    ----------------------------------------------------------------
    
    1) PRODUCT_CD�� PRIMARY_KEY�� �������� ��
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P1', 'MEM1', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P2', 'MEM1', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P1', 'MEM2', SYSDATE); -- ��ǰ�ڵ� �������� ����.
    
    2) MEMBER_NO�� PRIMARY KEY�� �������� �� (��, �Ѹ��� ȸ���� �ϳ��� ��ǰ�� ���ؼ��� ���ƿ並 ���� �� ����)
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P1', 'MEM1', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P2', 'MEM2', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P2', 'MEM1', SYSDATE); -- ȸ����ȣ �������� ����
    
    3) PRODUCT_CD�� MEMBER_NO�� ���� PRIMARY KEY�� �������� ��
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P1', 'MEM1', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P1', 'MEM2', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P2', 'MEM1', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P2', 'MEM2', SYSDATE);
    INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES ('P1', 'MEM1', SYSDATE); -- �������� ����.
*/

CREATE TABLE TBL_MEM_PRODUCT_LIKE (
       PRODUCT_CD VARCHAR2(20),
       MEMBER_NO VARCHAR2(20),
       LIKE_DATE DATE,
       PRIMARY KEY(PRODUCT_CD, MEMBER_NO) -- ���� PRIMARY KEY
);

INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES('P1', 'MEM1', SYSDATE);
INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES('P1', 'MEM2', SYSDATE);
INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES('P2', 'MEM1', SYSDATE);
INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES('P2', 'MEM2', SYSDATE);
INSERT INTO TBL_MEM_PRODUCT_LIKE VALUES('P1', 'MEM1', SYSDATE); -- �Ѹ��� ȸ���� ���� ��ǰ�� ���� ���ƿ並 �ѹ��� ���� �� ����!!

--------------------------------------------------------------------
-- �л� ������ ������ ���̺�
CREATE TABLE TBL_STUDENT_NF(
    STUDENT_ID VARCHAR2(30) PRIMARY KEY,
    STUDENT_PW VARCHAR2(30) NOT NULL,
    STUDENT_NAME VARCHAR2(30) NOT NULL
);
-- �л� ��� ������ ������ ���̺�
CREATE TABLE TBL_STUDENT_HOBBY_NF (
    HOBBY_CODE VARCHAR2(30) PRIMARY KEY,
    HOBBY_NAME VARCHAR2(30) NOT NULL,
    STUDENT_ID VARCHAR2(30) 
);

INSERT INTO TBL_STUDENT_NF VALUES ('jsw0902', '1234', '��¿�');
INSERT INTO TBL_STUDENT_NF VALUES ('siuuuuu', '1234', 'ȣ����');
INSERT INTO TBL_STUDENT_NF VALUES ('messi', '1234', '�޽�');

INSERT INTO TBL_STUDENT_HOBBY_NF VALUES ('1', 'ȣ�켼���Ӵ�', 'siuuuu');
INSERT INTO TBL_STUDENT_HOBBY_NF VALUES ('2', '�����ϱ�', 'messi');
INSERT INTO TBL_STUDENT_HOBBY_NF VALUES ('3', 'ȣ�������׹���Ŭ�ϱ�', 'jsw0902');

SELECT * FROM TBL_STUDENT_HOBBY_NF;
SELECT * FROM TBL_STUDENT_NF;

INSERT INTO TBL_STUDENT_HOBBY_NF VALUES ('4', 'ȣ���� ����Ŭ', 'NEUER');

-------------------------------------------------------------------------------
-- �л� ���� ���̺�            : ���� �Ǵ� ���̺�
-- �л� ��� ���� ���̺�        : ���� �ϴ� ���̺�
/*
    �ܷ�Ű(FOREIGN KEY) ���� ����
    
    - ���� �ϴ� ���̺��� �÷�����, ���� �Ǵ� ���̺��� �÷������� �����ؾ� ��.
*/

-- ȸ�� ��� ���� ���̺�
CREATE TABLE TBL_GRADE(
    GRADE_CODE VARCHAR2(20) PRIMARY KEY,
    GRADE_NAME VARCHAR2(20) NOT NULL
);

INSERT INTO TBL_GRADE VALUES ('1', 'VIP');
INSERT INTO TBL_GRADE VALUES ('2', 'GOLD');
INSERT INTO TBL_GRADE VALUES ('3', 'SILVER');

-- ȸ�� ���� ���̺�
CREATE TABLE TBL_MEMBER_CONS_FOREIGN(
    MEMBER_NO VARCHAR2(20) PRIMARY KEY,
    MEMBER_ID VARCHAR2(20) UNIQUE,
    MEMBER_PW VARCHAR2(20) NOT NULL,
    MEMBER_GRADE VARCHAR2(20) REFERENCES TBL_GRADE(GRADE_CODE)-- �÷� ���� ��� (������ �÷��� ������ ��, TBL_GRADE�� �⺻Ű�� ������)
    /*
    ���̺� ���� ������� �ܷ�Ű ����
    FOREIGN KEY(MEMBER_GRADE) REFERENCES TBL_GRADE(GRADE_CODE)
    */
);
SELECT * FROM TBL_GRADE;

INSERT INTO TBL_MEMBER_CONS_FOREIGN VALUES ('1', 'jsw09020', '1234', '1'); -- ��� : 1
INSERT INTO TBL_MEMBER_CONS_FOREIGN VALUES ('2', 'ronaldo', '1234', '2'); -- ��� : 2
INSERT INTO TBL_MEMBER_CONS_FOREIGN VALUES ('3', 'messi', '1234', '3'); -- ��� : 3
INSERT INTO TBL_MEMBER_CONS_FOREIGN VALUES ('4', 'muller', '1234', '4'); -- ��� : 4 -- �ܷ�Ű �������� ����
INSERT INTO TBL_MEMBER_CONS_FOREIGN VALUES ('5', 'test1', '1234', NULL); -- NULL �����ʹ� ��� ����

UPDATE TBL_MEMBER_CONS_FOREIGN
   SET MEMBER_GRADE = '6' -- ���
 WHERE MEMBER_NO = '5';

SELECT A.*,
        (SELECT GRADE_NAME FROM TBL_GRADE Z WHERE Z.GRADE_CODE = A.MEMBER_GRADE) GRADE_NAME
  FROM TBL_MEMBER_CONS_FOREIGN A;