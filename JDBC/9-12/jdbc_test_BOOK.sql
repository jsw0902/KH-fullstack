CREATE TABLE BOOK_TBL(
    BOOK_NAME VARCHAR2(150) PRIMARY KEY,
    BOOK_CONTENT VARCHAR2(255) NOT NULL,
    BOOK_KIND VARCHAR2(20) CHECK (BOOK_KIND IN ('�Ҽ�', '�ι���', '������', '������')),
    BOOK_PRICE NUMBER NOT NULL,
    AUTHOR_NAME VARCHAR2(20) REFERENCES AUTHOR_TBL(AUTHOR_NAME) NOT NULL,
    BOOK_PUBLISH DATE
);

CREATE TABLE AUTHOR_TBL(
    AUTHOR_NAME VARCHAR2(20) PRIMARY KEY,
    AUTHOR_AGE NUMBER,
    AUTHOR_GENDER CHAR(3) CHECK (AUTHOR_GENDER IN ('��', '��'))
);

COMMENT ON COLUMN BOOK_TBL.BOOK_NAME IS '���� �̸�';
COMMENT ON COLUMN BOOK_TBL.BOOK_CONTENT IS '���� ����';
COMMENT ON COLUMN BOOK_TBL.BOOK_KIND  IS '���� ����';
COMMENT ON COLUMN BOOK_TBL.BOOK_PRICE IS '���� ����';
COMMENT ON COLUMN BOOK_TBL.AUTHOR_NAME IS '���ڸ�';
COMMENT ON COLUMN BOOK_TBL.BOOK_PUBLISH IS '�Ⱓ��';

COMMENT ON COLUMN AUTHOR_TBL.AUTHOR_NAME IS '���ڸ�';
COMMENT ON COLUMN AUTHOR_TBL.AUTHOR_AGE IS '���� ����';
COMMENT ON COLUMN AUTHOR_TBL.AUTHOR_GENDER IS '���� ����';

insert into author_tbl(author_name, author_age, author_gender) VALUES ('��¿�', 23, '��');
insert into author_tbl(author_name, author_age, author_gender) VALUES ('ȣ����', 37, '��');
insert into author_tbl(author_name, author_age, author_gender) VALUES ('���ֽ���', 40, '��');
insert into author_tbl(author_name, author_age, author_gender) VALUES ('user', 45, '��');
insert into author_tbl(author_name, author_age, author_gender) VALUES ('user1', 46, '��');
insert into author_tbl(author_name, author_age, author_gender) VALUES ('user2', 46, '��');

insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('�λ�', '�� ���� ����..', '�ι���', 90000, '��¿�', '2024-09-02');
insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('���� �й����Դϴ�', '���̰� ���ϴ�...', '�ι���', 80000, 'ȣ����', '2021-10-10');
insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('�������ϴ�', '�帲������ ���̾��� �߸�..', '�Ҽ�', 5000, '���ֽ���', '2023-11-19');
insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('ȣ��', '1 ����', '�Ҽ�', 5000, 'user', '2023-11-19');
insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('ȣ��2', '2 ����', '�ι���', 6000, 'user', '2021-11-19');
insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('ȣ��3', '3 ���� ', '������', 7000, 'user', '2022-11-20');
insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('ȣ��5', '5 ���� ', '������', 7000, 'user2', '2022-11-20');


update book_tbl set BOOK_CONTENT = '�� ���� ����..', BOOK_KIND = '�ι���', BOOK_PRICE = '90000', AUTHOR_NAME = '��¿�' where book_name = '�λ�'; 
update book_tbl set BOOK_CONTENT = '���̰� ���ϴ�...', BOOK_KIND = '�ι���', BOOK_PRICE = '80000', AUTHOR_NAME = 'ȣ����' where book_name = '���� �й����Դϴ�';
update book_tbl set BOOK_CONTENT = '�帲������ ���̾��� �߸�..', BOOK_KIND = '�Ҽ�', BOOK_PRICE = '5000', AUTHOR_NAME = '���ֽ���' where book_name = '�������ϴ�';

commit;
ROLLBACK;

delete from book_tbl where book_name = '�ٺ�';


select * from author_tbl;
select * from book_tbl;