CREATE TABLE BOOK_TBL(
    BOOK_NAME VARCHAR2(150) PRIMARY KEY,
    BOOK_CONTENT VARCHAR2(255) NOT NULL,
    BOOK_KIND VARCHAR2(20) CHECK (BOOK_KIND IN ('소설', '인문학', '에세이', '경제학')),
    BOOK_PRICE NUMBER NOT NULL,
    AUTHOR_NAME VARCHAR2(20) REFERENCES AUTHOR_TBL(AUTHOR_NAME) NOT NULL,
    BOOK_PUBLISH DATE
);

CREATE TABLE AUTHOR_TBL(
    AUTHOR_NAME VARCHAR2(20) PRIMARY KEY,
    AUTHOR_AGE NUMBER,
    AUTHOR_GENDER CHAR(3) CHECK (AUTHOR_GENDER IN ('남', '여'))
);

COMMENT ON COLUMN BOOK_TBL.BOOK_NAME IS '도서 이름';
COMMENT ON COLUMN BOOK_TBL.BOOK_CONTENT IS '도서 내용';
COMMENT ON COLUMN BOOK_TBL.BOOK_KIND  IS '도서 종류';
COMMENT ON COLUMN BOOK_TBL.BOOK_PRICE IS '도서 가격';
COMMENT ON COLUMN BOOK_TBL.AUTHOR_NAME IS '저자명';
COMMENT ON COLUMN BOOK_TBL.BOOK_PUBLISH IS '출간일';

COMMENT ON COLUMN AUTHOR_TBL.AUTHOR_NAME IS '저자명';
COMMENT ON COLUMN AUTHOR_TBL.AUTHOR_AGE IS '저자 나이';
COMMENT ON COLUMN AUTHOR_TBL.AUTHOR_GENDER IS '저자 성별';

insert into author_tbl(author_name, author_age, author_gender) VALUES ('장승원', 23, '남');
insert into author_tbl(author_name, author_age, author_gender) VALUES ('호날두', 37, '남');
insert into author_tbl(author_name, author_age, author_gender) VALUES ('나겔스만', 40, '여');
insert into author_tbl(author_name, author_age, author_gender) VALUES ('user', 45, '남');
insert into author_tbl(author_name, author_age, author_gender) VALUES ('user1', 46, '남');
insert into author_tbl(author_name, author_age, author_gender) VALUES ('user2', 46, '여');

insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('인생', '집 가고 싶은..', '인문학', 90000, '장승원', '2024-09-02');
insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('나는 패배자입니다', '나이값 못하는...', '인문학', 80000, '호날두', '2021-10-10');
insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('버림당하다', '드림팀에서 어이없게 잘린..', '소설', 5000, '나겔스만', '2023-11-19');
insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('호우', '1 내용', '소설', 5000, 'user', '2023-11-19');
insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('호우2', '2 내용', '인문학', 6000, 'user', '2021-11-19');
insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('호우3', '3 내용 ', '에세이', 7000, 'user', '2022-11-20');
insert into book_tbl(book_name, BOOK_CONTENT, BOOK_KIND, BOOK_PRICE, AUTHOR_NAME, BOOK_PUBLISH) VALUES ('호우5', '5 내용 ', '에세이', 7000, 'user2', '2022-11-20');


update book_tbl set BOOK_CONTENT = '집 가고 싶은..', BOOK_KIND = '인문학', BOOK_PRICE = '90000', AUTHOR_NAME = '장승원' where book_name = '인생'; 
update book_tbl set BOOK_CONTENT = '나이값 못하는...', BOOK_KIND = '인문학', BOOK_PRICE = '80000', AUTHOR_NAME = '호날두' where book_name = '나는 패배자입니다';
update book_tbl set BOOK_CONTENT = '드림팀에서 어이없게 잘린..', BOOK_KIND = '소설', BOOK_PRICE = '5000', AUTHOR_NAME = '나겔스만' where book_name = '버림당하다';

commit;
ROLLBACK;

delete from book_tbl where book_name = '바보';


select * from author_tbl;
select * from book_tbl;