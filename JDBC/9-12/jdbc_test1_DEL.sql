/*
    TBL_DEL_MEMBER(���� ȸ�� ���� ���̺�)
*/
CREATE TABLE TBL_DEL_MEMBER(
    DEL_MEMBER_ID VARCHAR2(20) PRIMARY KEY, -- ���� ȸ�� ID
    DEL_MEMBER_NAME VARCHAR2(20) NOT NULL,  -- ���� ȸ�� �̸�
    DEL_MEMBER_PHONE CHAR(13) NOT NULL,     -- ���� ȸ�� ��ȭ��ȣ
    DEL_DATE DATE                           -- ���� ���� 
);

select * from tbl_member where member_id = 'jsw92';
select * from tbl_del_member where del_member_id = 'jsw92';

